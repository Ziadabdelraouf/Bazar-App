import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class LargePrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final double height;
  final double borderRadius;
  final TextStyle? textStyle;
  final bool isLoading;

  const LargePrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.height = 48,
    this.borderRadius = 48,
    this.textStyle,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary500,
          disabledBackgroundColor: AppColors.primary300,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.white,
                ),
              )
            : Text(
                label,
                style: (textStyle ?? AppTextStyles.body16SemiBold).copyWith(
                  color: AppColors.white,
                ),
              ),
      ),
    );
  }
}
