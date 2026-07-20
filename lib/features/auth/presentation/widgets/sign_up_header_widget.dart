import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUpHeaderWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const SignUpHeaderWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.h3.copyWith(
            color: AppColors.grey900,
          ),
        ),
        Text(
          subtitle,
          style: AppTextStyles.body16Regular.copyWith(
            color: AppColors.grey500,
          ),
        ),
      ],
    );
  }
}
