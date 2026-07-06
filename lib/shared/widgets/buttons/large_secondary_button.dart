import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class LargeSecondaryButton extends StatelessWidget {

  final String label;
  final VoidCallback onPressed;

  const LargeSecondaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
Widget build(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    height: 48,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48),
        ),
        elevation: 0,
      ),
      child: Text(
        label,
        style: AppTextStyles.h6.copyWith(
          color: AppColors.primary500,
        ),
      ),
    ),
  );
}
}