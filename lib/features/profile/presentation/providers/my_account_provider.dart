import 'package:bazar_group_1/features/profile/presentation/providers/my_account_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyAccountNotifier extends AutoDisposeNotifier<MyAccountState> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  MyAccountState build() {
    ref.onDispose(() {
      nameController.dispose();
      emailController.dispose();
      phoneController.dispose();
      passwordController.dispose();
    });

    return const MyAccountState();
  }

  void loadInitialData({
    required String name,
    required String email,
    required String phone,
  }) {
    nameController.text = name;
    emailController.text = email;
    phoneController.text = phone;
  }

  void toggleObscurePassword() {
    state = state.copyWith(obscurePassword: !state.obscurePassword);
  }

  Future<void> pickProfileImage() async {
    // TODO: integrate the team's existing image_picker usage here —
    // check how it's called elsewhere in the app and mirror that
    // exact pattern for consistency.
    // On success:
    // state = state.copyWith(profileImagePath: pickedPath);
  }

  String? validatePhone(
    String? value, {
    required String emptyError,
    required String invalidError,
  }) {
    if (value == null || value.trim().isEmpty) {
      return emptyError;
    }

    final digitsOnly = value.replaceAll(RegExp(r'\D'), '');

    if (digitsOnly.length < 10) {
      return invalidError;
    }

    return null;
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

  Future<bool> submit() async {
    final isFormValid = formKey.currentState?.validate() ?? false;

    if (!isFormValid) {
      return false;
    }

    state = state.copyWith(isLoading: true);
    try {
      // TODO: call the repository/use case that saves the profile,
      // going through the mock data source for now.
      // await ref.read(profileRepositoryProvider).updateProfile(...);
      return true;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}

final myAccountProvider =
    AutoDisposeNotifierProvider<MyAccountNotifier, MyAccountState>(
      MyAccountNotifier.new,
    );
