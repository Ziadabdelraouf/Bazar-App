import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/notifiers/payment_notifier.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/widgets/confirm_order/payment_method_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConfirmOrderPaymentCard extends ConsumerWidget {
  final String? title;
  final String? subtitle;
  final VoidCallback? onTap;

  const ConfirmOrderPaymentCard({
    super.key,
    this.title,
    this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final paymentState = ref.watch(paymentNotifierProvider);

    final displayTitle = title ??
        (paymentState.type == PaymentType.cash
            ? 'Cash on Delivery'
            : 'Credit / Debit Card');

    final displaySubtitle = subtitle ??
        (paymentState.type == PaymentType.cash
            ? 'Pay with cash upon delivery'
            : paymentState.maskedCardNumber);

    final iconPath = paymentState.type == PaymentType.cash
        ? AppIcons.walletFill
        : AppIcons.cardOutline;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? theme.colorScheme.surfaceContainerHighest : AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? AppColors.grey700 : AppColors.grey200,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).confirmOrderPaymentHeader,
            style: AppTextStyles.h5.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 12),
          InkWell(
            onTap: onTap ?? () => showPaymentMethodBottomSheet(context),
            borderRadius: BorderRadius.circular(8),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.primary900 : AppColors.primary50,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      iconPath,
                      width: 22,
                      height: 22,
                      colorFilter: ColorFilter.mode(
                        theme.colorScheme.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        displayTitle.isNotEmpty
                            ? displayTitle
                            : S.of(context).confirmOrderPaymentTitle,
                        style: AppTextStyles.body16SemiBold.copyWith(
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        displaySubtitle.isNotEmpty
                            ? displaySubtitle
                            : S.of(context).confirmOrderChoosePayment,
                        style: AppTextStyles.body14Regular.copyWith(
                          color: isDark ? AppColors.grey400 : AppColors.grey600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                SvgPicture.asset(
                  AppIcons.chevronRight,
                  width: 20,
                  height: 20,
                  colorFilter: ColorFilter.mode(
                    isDark ? AppColors.grey400 : AppColors.grey600,
                    BlendMode.srcIn,
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

