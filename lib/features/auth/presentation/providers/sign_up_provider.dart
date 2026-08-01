import 'package:bazar_group_1/features/auth/presentation/providers/name_notifier_provider.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpNotifier
    extends Notifier<SignUpState> {
  final TextEditingController nameController =
      TextEditingController();
  final TextEditingController emailController =
      TextEditingController();
  final TextEditingController passwordController =
      TextEditingController();

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
    state = state.copyWith(
      obscurePassword: !state.obscurePassword,
    );
  }

  void validatePassword(String password) {
    final hasMinimumLength = password.length >= 8;
    final hasLetter = RegExp(
      r'[a-zA-Z]',
    ).hasMatch(password);
    final hasNumber = RegExp(r'[0-9]').hasMatch(password);

    final isValid =
        hasMinimumLength && hasLetter && hasNumber;

    state = state.copyWith(
      hasMinimumLength: hasMinimumLength,
      hasLetter: hasLetter,
      hasNumber: hasNumber,
      showPasswordRules: password.isNotEmpty && !isValid,
    );
  }

  bool register(GlobalKey<FormState> formKey) {
    final isFormValid =
        formKey.currentState?.validate() ?? false;

    if (!isFormValid) {
      return false;
    }

    ref.read(nameNotifierProvider.notifier).updateName(nameController.text.trim());
    return true;
  }
}

final signUpProvider =
    NotifierProvider<
      SignUpNotifier,
      SignUpState
    >(SignUpNotifier.new);
