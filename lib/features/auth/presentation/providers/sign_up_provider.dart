import 'package:bazar_group_1/features/auth/presentation/providers/auth_service_provider.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/name_notifier_provider.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/sign_up_state.dart';
import 'package:bazar_group_1/features/home/presentation/providers/bottom_nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpNotifier extends Notifier<SignUpState> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  SignUpState build() {
    ref.onDispose(() {
      nameController.dispose();
      emailController.dispose();
      passwordController.dispose();
    });

    return const SignUpState();
  }

  void reset() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    state = const SignUpState();
  }

  void togglePasswordVisibility() {
    state = state.copyWith(obscurePassword: !state.obscurePassword);
  }

  void validatePassword(String password) {
    final hasMinimumLength = password.length >= 8;
    final hasLetter = RegExp(r'[a-zA-Z]').hasMatch(password);
    final hasNumber = RegExp(r'[0-9]').hasMatch(password);

    final isValid = hasMinimumLength && hasLetter && hasNumber;

    state = state.copyWith(
      hasMinimumLength: hasMinimumLength,
      hasLetter: hasLetter,
      hasNumber: hasNumber,
      showPasswordRules: password.isNotEmpty && !isValid,
    );
  }

  bool register(GlobalKey<FormState> formKey) {
    final isFormValid = formKey.currentState?.validate() ?? false;

    if (!isFormValid) {
      return false;
    }

    ref
        .read(nameNotifierProvider.notifier)
        .updateName(nameController.text.trim());
    return true;
  }

  Future<void> handleSignUp({String? mobile}) async {
    state = state.copyWith(isLoading: true);
    try {
      final email = emailController.text.trim();
      final password = passwordController.text;
      final nameText = nameController.text.trim();
      final storedName = ref.read(nameNotifierProvider);
      final finalName = nameText.isNotEmpty ? nameText : storedName;

      final authService = ref.read(authServiceProvider);

      if (authService.currentUser == null &&
          email.isNotEmpty &&
          password.isNotEmpty) {
        await authService.signUpWithEmailAndPassword(
          email,
          password,
          finalName,
        );
        /*if (finalName.isNotEmpty) {
          await authService.currentUser?.updateDisplayName(finalName);
        }*/
        await authService.sendEmailVerification();
      } else if (authService.currentUser != null) {
        await authService.sendEmailVerification();
      }

      await saveSession(mobile: mobile);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> saveSession({String? mobile}) async {
    final email = emailController.text.trim();
    //final password = passwordController.text;
    final nameText = nameController.text.trim();
    final storedName = ref.read(nameNotifierProvider);
    final finalName = nameText.isNotEmpty ? nameText : storedName;

    final authService = ref.read(authServiceProvider);

    await authService.saveSession(
      email: email.isNotEmpty ? email : null,
      name: finalName.isNotEmpty ? finalName : null,
      mobile: mobile,
    );

    ref.invalidate(userProfileProvider);
    ref.invalidate(bottomNavIndexProvider);
  }
}

final signUpProvider = NotifierProvider<SignUpNotifier, SignUpState>(
  SignUpNotifier.new,
);
