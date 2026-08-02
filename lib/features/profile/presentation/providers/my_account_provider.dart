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

  /// Call once when the page first loads, to prefill the fields with the
  /// user's existing account data.
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

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }
    final digitsOnly = value.replaceAll(RegExp(r'\D'), '');
    if (digitsOnly.length < 10) {
      return 'Enter a valid phone number';
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
