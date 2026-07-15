import 'package:bazar_group_1/core/components/buttons/large_primary_button.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class SuccessfulLogin extends StatelessWidget {
  const SuccessfulLogin({super.key});
  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/success.png"),
        SizedBox(height: 32),
        Text(
          S.of(context).congratulations,
          style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 32, right: 32),
          child: Text(
            S.of(context).successBody,
            style: AppTextStyles.body16Regular.copyWith(
              color: AppColors.grey500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 40),
        SizedBox(
          width: screensize.width * 0.9,
          child: LargePrimaryButton(
            label: S.of(context).getStartedButton,
            onPressed: () {
              // navigate to home page
            },
            borderRadius: 12,
            height: screensize.height * 0.06,
          ),
        ),
      ],
    );
  }
}
