import 'package:bazar_group_1/features/forgot_password/presentation/providers/create_new_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateNewPasswordNotifier
    extends AutoDisposeNotifier<CreateNewPasswordState> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  CreateNewPasswordState build() {
    ref.onDispose(() {
      newPasswordController.dispose();
      confirmPasswordController.dispose();
    });

    return const CreateNewPasswordState();
  }

  void toggleNewPasswordVisibility() {
    state = state.copyWith(obscureNewPassword: !state.obscureNewPassword);
  }

  void toggleConfirmPasswordVisibility() {
    state = state.copyWith(
      obscureConfirmPassword: !state.obscureConfirmPassword,
    );
  }

  void validatePassword(String password) {
    final hasMinimumLength = password.length >= 8;
    final hasLetter = RegExp(r'[a-zA-Z]').hasMatch(password);
    final hasNumber = RegExp(r'[0-9]').hasMatch(password);

    final isValid = hasMinimumLength && hasLetter && hasNumber;

    state = state.copyWith(
      hasMinimumLength: hasMinimumLength,
      hasNumber: hasNumber,
      hasLetter: hasLetter,
      showPasswordRules: password.isNotEmpty && !isValid,
    );
  }

  bool submit() {
    final isFormValid = formKey.currentState?.validate() ?? false;

    if (!isFormValid) {
      return false;
    }

    return true;
  }
}

final createNewPasswordProvider =
    AutoDisposeNotifierProvider<
      CreateNewPasswordNotifier,
      CreateNewPasswordState
    >(CreateNewPasswordNotifier.new);
