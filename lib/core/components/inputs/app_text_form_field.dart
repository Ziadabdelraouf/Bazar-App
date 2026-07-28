import 'package:flutter/material.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';

class AppFormTextField extends StatelessWidget {
  final String label;
  final String placeholder;
  final TextEditingController controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final bool showErrorBorder;
  final bool showErrorText;

  const AppFormTextField({
    super.key,
    required this.label,
    required this.placeholder,
    required this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.textInputAction,
    this.keyboardType,
    this.onChanged,
    this.showErrorBorder = true,
    this.showErrorText = true,
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
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          textInputAction: textInputAction,
          keyboardType: keyboardType, // أضف دي
          validator: validator,
          onChanged: onChanged,
          style: AppTextStyles.body16Medium.copyWith(
            color: AppColors.grey900,
          ),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: AppTextStyles.body16Regular.copyWith(
              color: AppColors.grey400,
            ),
            prefixIcon: prefixIcon, // وأضف دي
            suffixIcon: suffixIcon,
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
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: showErrorBorder
                  ? const BorderSide(color: AppColors.red)
                  : BorderSide.none,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: showErrorBorder
                  ? const BorderSide(color: AppColors.red)
                  : BorderSide.none,
            ),
            errorStyle: showErrorText
                ? null
                : const TextStyle(fontSize: 0, height: 0),
          ),
        ),
      ],
    );
  }
}
