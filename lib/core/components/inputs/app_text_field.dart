import 'package:flutter/material.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';

/// A reusable styled text input field matching the app's design system.
///
/// Example usage:
/// ```dart
/// final _emailController = TextEditingController();
///
/// AppTextField(
///   label: 'Email',
///   placeholder: 'Your email',
///   controller: _emailController,
/// )
/// ```
///
/// For password fields, set `obscureText: true`.
class AppTextField extends StatelessWidget {
  final String label;
  final String placeholder;
  final TextEditingController controller;
  final bool obscureText;

  const AppTextField({
    super.key,
    required this.label,
    required this.placeholder,
    required this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.body14Medium.copyWith(
            color: AppColors.grey900,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          obscureText: obscureText,
          style: AppTextStyles.body16Medium.copyWith(
            color: AppColors.grey900,
          ),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: AppTextStyles.body16Regular.copyWith(
              color: AppColors.grey400,
            ),
            filled: true,
            fillColor: AppColors.grey50,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.primary500,
                width: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}