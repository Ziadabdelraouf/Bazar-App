import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:flutter/material.dart';

class TermAndConditionWidget extends StatelessWidget {
  const TermAndConditionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          localization.registerAgreement,
          style: AppTextStyles.body14Medium.copyWith(
            color: AppColors.grey500,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          localization.termsAndDataPolicy,
          style: AppTextStyles.body14Medium.copyWith(
            color: AppColors.primary500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
