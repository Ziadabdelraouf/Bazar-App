import 'package:flutter/material.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';

class SignUpVerificationHeader extends StatelessWidget {
  final bool isVerified;
  final String email;

  const SignUpVerificationHeader({
    super.key,
    required this.isVerified,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            isVerified ? S.of(context).congratsVerified : S.of(context).pleaseVerifyEmail,
            textAlign: TextAlign.center,
            style: AppTextStyles.h3.copyWith(
              color: AppColors.grey900,
            ),
          ),
          const SizedBox(height: 12),
          isVerified
              ? Text(
                  S.of(context).continueSignUpProcess,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body16Regular.copyWith(
                    color: AppColors.grey500,
                  ),
                )
              : RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: AppTextStyles.body16Regular.copyWith(
                      color: AppColors.grey500,
                      height: 1.4,
                    ),
                    children: [
                      TextSpan(
                        text: S.of(context).verificationLinkSentTo,
                      ),
                      TextSpan(
                        text: email,
                        style: AppTextStyles.body16Medium.copyWith(
                          color: AppColors.grey900,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
