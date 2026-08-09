import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';

class FirebaseErrorUtils {
  FirebaseErrorUtils._();

  static String getErrorMessage(Object error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'invalid-phone-number':
          return 'The phone number format is invalid.';
        case 'too-many-requests':
          return 'Too many requests. Please try again later.';
        case 'quota-exceeded':
          return 'SMS quota exceeded. Please try again later.';
        case 'invalid-verification-code':
          return 'The verification code entered is invalid.';
        case 'session-expired':
          return 'The verification code has expired. Please resend.';
        case 'user-not-found':
          return 'No user found for this email address.';
        case 'wrong-password':
          return 'Incorrect password. Please try again.';
        case 'email-already-in-use':
          return 'An account already exists for this email address.';
        case 'invalid-email':
          return 'The email address format is invalid.';
        case 'weak-password':
          return 'The password provided is too weak.';
        case 'app-not-authorized':
        case 'captcha-check-failed':
          return error.message ?? 'App verification failed. Please try again.';
        default:
          return error.message ??
              'An authentication error occurred (${error.code}).';
      }
    }
    return error.toString().replaceAll('Exception: ', '');
  }

  static void showErrorSnackBar(BuildContext context, Object error) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          getErrorMessage(error),
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  static void showSuccessSnackBar(BuildContext context, String message) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white)),
        backgroundColor: AppColors.primary500,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
