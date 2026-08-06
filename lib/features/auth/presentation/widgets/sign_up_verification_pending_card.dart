import 'package:flutter/material.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';

class SignUpVerificationPendingCard extends StatelessWidget {
  final bool isResending;
  final int cooldownSeconds;
  final VoidCallback onResend;

  const SignUpVerificationPendingCard({
    super.key,
    required this.isResending,
    required this.cooldownSeconds,
    required this.onResend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.grey200),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey900.withValues(alpha: 0.04),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.primary50.withValues(alpha: 0.4),
              shape: BoxShape.circle,
            ),
            child: const SizedBox(
              width: 48,
              height: 48,
              child: CircularProgressIndicator(
                color: AppColors.primary500,
                strokeWidth: 3.5,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            S.of(context).pleaseVerifyAccount,
            style: AppTextStyles.body16Medium.copyWith(
              color: AppColors.grey900,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            S.of(context).checkInboxVerificationPrompt,
            style: AppTextStyles.body14Regular.copyWith(
              color: AppColors.grey500,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 28),
          const Divider(color: AppColors.grey100, height: 1),
          const SizedBox(height: 20),

          // Resend Action Area
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).didNotReceiveLink,
                style: AppTextStyles.body14Regular.copyWith(
                  color: AppColors.grey500,
                ),
              ),
              const SizedBox(width: 4),
              InkWell(
                onTap: (isResending || cooldownSeconds > 0) ? null : onResend,
                borderRadius: BorderRadius.circular(4),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 4,
                  ),
                  child: Text(
                    isResending
                        ? S.of(context).resending
                        : cooldownSeconds > 0
                            ? S.of(context).resendInSeconds(cooldownSeconds)
                            : S.of(context).resendLink,
                    style: AppTextStyles.body14SemiBold.copyWith(
                      color: (isResending || cooldownSeconds > 0)
                          ? AppColors.grey400
                          : AppColors.primary500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
