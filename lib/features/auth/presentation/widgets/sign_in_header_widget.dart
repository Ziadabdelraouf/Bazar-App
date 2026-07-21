import 'package:flutter/material.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';

class SignInHeaderWidget extends StatelessWidget {
  const SignInHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${S.of(context).welcomeBackTitle}👋',
          style: AppTextStyles.h3,
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 16),
        Text(
          S.of(context).signInSubtitle,
          style: AppTextStyles.body16Regular.copyWith(
            color: AppColors.grey500,
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
