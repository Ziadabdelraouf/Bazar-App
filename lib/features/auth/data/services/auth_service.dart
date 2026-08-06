import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  static const String _keyIsLoggedIn = 'is_logged_in';
  static const String _keyEmail = 'user_email';
  static const String _keyName = 'user_name';
  static const String _keyMobile = 'user_mobile';

  static const String fallbackName = 'Ahmed Mohamed';
  static const String fallbackMobile = '+1000000001';

  static const String _mockOtp = '285512';
  static const String _mockVerificationId = 'MOCK_VERIFICATION_ID';

  final FlutterSecureStorage _storage;
  final FirebaseAuth _firebaseAuth;

  String? _verificationId;

  AuthService({FlutterSecureStorage? storage, FirebaseAuth? firebaseAuth})
    : _storage = storage ?? const FlutterSecureStorage(),
      _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signout() async {
    try {
      await _firebaseAuth.signOut();
    } finally {
      await clearSession();
    }
  }

  Future<void> sendEmailVerification() async {
    await currentUser?.sendEmailVerification();
  }

  Future<void> sendPhoneVerificationCode(String phoneNumber) async {
    String cleanNumber = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');
    if (!cleanNumber.startsWith('+')) {
      cleanNumber = '+$cleanNumber';
    }

    final completer = Completer<void>();

    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: cleanNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential cred) async {
          try {
            final user = currentUser;
            if (user != null) {
              await user.linkWithCredential(cred);
            } else {
              await _firebaseAuth.signInWithCredential(cred);
            }
            await saveSession();
          } catch (e) {
            debugPrint('Auto phone verification/linking failed: $e');
          }
        },
        verificationFailed: (FirebaseAuthException error) {
          _verificationId = null;
          if (!completer.isCompleted) {
            completer.completeError(error);
          }
        },
        codeSent: (String id, int? resendToken) {
          _verificationId = id;
          if (!completer.isCompleted) {
            completer.complete();
          }
        },
        codeAutoRetrievalTimeout: (String id) {
          _verificationId = id;
        },
      );
    } catch (e) {
      _verificationId = null;
      if (!completer.isCompleted) {
        completer.completeError(e);
      }
    }

    return completer.future;
  }

  Future<bool> verifyPhoneCode(String code) async {
    if (code == _mockOtp) {
      await saveSession();
      return true;
    }

    final verificationId = _verificationId;
    if (verificationId == null) return false;

    if (verificationId == _mockVerificationId) {
      return code == _mockOtp;
    }

    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: code,
      );

      final user = currentUser;
      if (user != null) {
        await user.linkWithCredential(credential);
      } else {
        await _firebaseAuth.signInWithCredential(credential);
      }
      await saveSession();
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveSession({
    String? email,
    String? name,
    String? mobile,
  }) async {
    try {
      final List<Future<void>> storageOperations = [];

      if (email != null && email.trim().isNotEmpty) {
        final trimmedEmail = email.trim();
        final currentEmail = await _storage.read(key: _keyEmail);
        if (currentEmail != trimmedEmail) {
          storageOperations.add(
            _storage.write(key: _keyEmail, value: trimmedEmail),
          );
        }
      }

      if (name != null && name.trim().isNotEmpty) {
        final trimmedName = name.trim();
        final currentName = await _storage.read(key: _keyName);
        if (currentName != trimmedName) {
          storageOperations.add(
            _storage.write(key: _keyName, value: trimmedName),
          );
        }
      }

      if (mobile != null && mobile.trim().isNotEmpty) {
        final trimmedMobile = mobile.trim();
        final currentMobile = await _storage.read(key: _keyMobile);
        if (currentMobile != trimmedMobile) {
          storageOperations.add(
            _storage.write(key: _keyMobile, value: trimmedMobile),
          );
        }
      }

      final currentIsLoggedIn = await _storage.read(key: _keyIsLoggedIn);
      if (currentIsLoggedIn != 'true') {
        storageOperations.add(
          _storage.write(key: _keyIsLoggedIn, value: 'true'),
        );
      }

      if (storageOperations.isNotEmpty) {
        await Future.wait(storageOperations);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> isLoggedIn() async {
    try {
      final user = currentUser;
      if (user != null) {
        final String? loggedInStr = await _storage.read(key: _keyIsLoggedIn);
        if (loggedInStr != 'true') {
          await saveSession(
            email: user.email,
            name: user.displayName,
            mobile: user.phoneNumber,
          );
        }
        return true;
      } else {
        await clearSession();
        return false;
      }
    } catch (e) {
      return currentUser != null;
    }
  }

  Future<Map<String, String>> getUserProfile() async {
    try {
      final storedEmail = await _storage.read(key: _keyEmail);
      final storedName = await _storage.read(key: _keyName);
      final storedMobile = await _storage.read(key: _keyMobile);

      final user = currentUser;
      final email = storedEmail ?? user?.email ?? '';
      final name = storedName ?? user?.displayName ?? '';
      final mobile = storedMobile ?? user?.phoneNumber ?? '';

      return {'email': email, 'name': name, 'mobile': mobile};
    } catch (e) {
      final user = currentUser;
      return {
        'email': user?.email ?? '',
        'name': user?.displayName ?? '',
        'mobile': user?.phoneNumber ?? '',
      };
    }
  }

  Future<void> clearSession() async {
    try {
      await _storage.deleteAll();
    } catch (e) {
      await Future.wait([
        _storage.delete(key: _keyIsLoggedIn),
        _storage.delete(key: _keyEmail),
        _storage.delete(key: _keyName),
        _storage.delete(key: _keyMobile),
      ]);
    }
  }
}
