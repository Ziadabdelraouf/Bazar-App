import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  /// Fetches the current user's data from Firestore and fills the form.
  /// Adjust collection/field names below to match your actual schema.
  Future<void> loadFromFirestore() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    state = state.copyWith(isFetching: true);
    try {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      final data = doc.data();
      if (data != null) {
        nameController.text = (data['name'] ?? '') as String;
        emailController.text = (data['email'] ?? user.email ?? '') as String;
        // 'phone' مش field في users doc — بناخده من Firebase Auth لو موجود
        phoneController.text =
            (data['phone'] ?? user.phoneNumber ?? '') as String;
      }
    } finally {
      state = state.copyWith(isFetching: false);
    }
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
    if (password.isEmpty) {
      state = state.copyWith(
        hasMinimumLength: false,
        hasLetter: false,
        hasNumber: false,
        showPasswordRules: false,
      );
      return;
    }

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
  if (!isFormValid) return false;

  final user = FirebaseAuth.instance.currentUser;
  if (user == null) return false;

  state = state.copyWith(isLoading: true);
  try {
    final dataToSave = <String, dynamic>{
      'name': nameController.text.trim(),
      'email': emailController.text.trim(),
      'updatedAt': FieldValue.serverTimestamp(),
    };

    // Only include phone if the user actually entered one.
    if (phoneController.text.trim().isNotEmpty) {
      dataToSave['phone'] = phoneController.text.trim();
    }

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .set(dataToSave, SetOptions(merge: true));

    // Password: only update if the user typed a new one.
    if (passwordController.text.isNotEmpty) {
      await user.updatePassword(passwordController.text.trim());
    }

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