import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConfirmOrderSummaryCard extends StatelessWidget {
  final double price;
  final double shipping;
  final VoidCallback? onSeeDetailsPressed;

  const ConfirmOrderSummaryCard({
    super.key,
    this.price = 87.10,
    this.shipping = 2.00,
    this.onSeeDetailsPressed,
  });

  double get totalPayment => price + shipping;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? theme.colorScheme.surfaceContainerHighest : AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? AppColors.grey700 : AppColors.grey200,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).confirmOrderSummaryHeader,
                  style: AppTextStyles.h5.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).confirmOrderPrice,
                      style: AppTextStyles.body14Regular.copyWith(
                        color: isDark ? AppColors.grey400 : AppColors.grey600,
                      ),
                    ),
                    Text(
                      '\$${price.toStringAsFixed(2)}',
                      style: AppTextStyles.body16SemiBold.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).confirmOrderShipping,
                      style: AppTextStyles.body14Regular.copyWith(
                        color: isDark ? AppColors.grey400 : AppColors.grey600,
                      ),
                    ),
                    Text(
                      '\$${shipping % 1 == 0 ? shipping.toInt().toString() : shipping.toStringAsFixed(2)}',
                      style: AppTextStyles.body16SemiBold.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: isDark ? AppColors.grey700 : AppColors.grey200,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).confirmOrderTotalPayment,
                      style: AppTextStyles.body16SemiBold.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      '\$${totalPayment.toStringAsFixed(2)}',
                      style: AppTextStyles.h6.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: isDark ? AppColors.grey700 : AppColors.grey200,
          ),
          InkWell(
            onTap: onSeeDetailsPressed,
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  Text(
                    S.of(context).confirmOrderSeeDetails,
                    style: AppTextStyles.body14SemiBold.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 4),
                  SvgPicture.asset(
                    AppIcons.chevronRight,
                    width: 18,
                    height: 18,
                    colorFilter: ColorFilter.mode(
                      theme.colorScheme.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
