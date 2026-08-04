import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final FlutterSecureStorage _storage;

  static const String _keyIsLoggedIn = 'is_logged_in';
  static const String _keyEmail = 'user_email';
  static const String _keyPassword = 'user_password';
  static const String _keyName = 'user_name';
  static const String _keyMobile = 'user_mobile';

  static const String fallbackName = 'Ahmed Mohamed';
  static const String fallbackMobile = '+1000000000';

  AuthService({FlutterSecureStorage? storage})
    : _storage = storage ?? const FlutterSecureStorage();

  Future<void> saveSession({
    required String email,
    required String password,
    String? name,
    String? mobile,
  }) async {
    try {
      final String finalName = (name != null && name.trim().isNotEmpty)
          ? name.trim()
          : fallbackName;
      final String finalMobile = (mobile != null && mobile.trim().isNotEmpty)
          ? mobile.trim()
          : fallbackMobile;

      await Future.wait([
        _storage.write(key: _keyEmail, value: email.trim()),
        _storage.write(key: _keyPassword, value: password),
        _storage.write(key: _keyName, value: finalName),
        _storage.write(key: _keyMobile, value: finalMobile),
        _storage.write(key: _keyIsLoggedIn, value: 'true'),
      ]);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> isLoggedIn() async {
    try {
      final String? loggedInStr = await _storage.read(key: _keyIsLoggedIn);
      return loggedInStr == 'true';
    } catch (e) {
      return false;
    }
  }

  Future<Map<String, String>> getUserProfile() async {
    try {
      final email = await _storage.read(key: _keyEmail) ?? '';
      final password = await _storage.read(key: _keyPassword) ?? '';
      final name = await _storage.read(key: _keyName) ?? fallbackName;
      final mobile = await _storage.read(key: _keyMobile) ?? fallbackMobile;

      return {
        'email': email,
        'password': password,
        'name': name,
        'mobile': mobile,
      };
    } catch (e) {
      return {
        'email': '',
        'password': '',
        'name': fallbackName,
        'mobile': fallbackMobile,
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
        _storage.delete(key: _keyPassword),
        _storage.delete(key: _keyName),
        _storage.delete(key: _keyMobile),
      ]);
    }
  }
}
