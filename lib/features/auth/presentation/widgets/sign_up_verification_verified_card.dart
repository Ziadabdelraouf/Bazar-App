import 'package:flutter/material.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/core/components/buttons/large_primary_button.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';

class SignUpVerificationVerifiedCard extends StatelessWidget {
  final Animation<double> scaleAnimation;
  final VoidCallback onContinue;

  const SignUpVerificationVerifiedCard({
    super.key,
    required this.scaleAnimation,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primary500.withValues(alpha: 0.2)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary500.withValues(alpha: 0.08),
            blurRadius: 32,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          ScaleTransition(
            scale: scaleAnimation,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: AppColors.primary500,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_rounded,
                color: AppColors.white,
                size: 56,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            S.of(context).verificationComplete,
            style: AppTextStyles.h4.copyWith(color: AppColors.grey900),
          ),
          const SizedBox(height: 8),
          Text(
            S.of(context).congratsVerifiedTapBelow,
            style: AppTextStyles.body14Regular.copyWith(
              color: AppColors.grey500,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          LargePrimaryButton(
            label: S.of(context).continueSignUpButton,
            onPressed: onContinue,
          ),
        ],
      ),
    );
  }
}
