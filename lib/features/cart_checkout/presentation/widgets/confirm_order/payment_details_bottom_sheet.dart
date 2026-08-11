import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/cart_checkout/domain/entities/cart_item.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/providers/cart_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> showPaymentDetailsBottomSheet(
  BuildContext context, {
  List<CartItem>? items,
  double? price,
  double? shipping,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Theme.of(context).colorScheme.onSecondary,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) => PaymentDetailsBottomSheet(
      items: items,
      price: price,
      shipping: shipping,
    ),
  );
}

class OrderItemDetail {
  final String title;
  final double price;

  const OrderItemDetail({required this.title, required this.price});
}

class PaymentDetailsBottomSheet extends ConsumerWidget {
  final List<CartItem>? items;
  final double? price;
  final double? shipping;

  const PaymentDetailsBottomSheet({
    super.key,
    this.items,
    this.price,
    this.shipping,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    final cartState = ref.watch(cartNotifierProvider);
    final currentCartItems = items ?? cartState.value ?? [];

    final List<OrderItemDetail> displayItems = currentCartItems.isNotEmpty
        ? currentCartItems
              .map((e) => OrderItemDetail(title: e.title, price: e.totalPrice))
              .toList()
        : [];

    final double calculatedPrice =
        price ?? displayItems.fold(0.0, (sum, item) => sum + item.price);
    final double shippingFee = shipping ?? 2.0;
    final double totalPayment = calculatedPrice + shippingFee;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 12,
          bottom: bottomInset + 24,
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: isDark ? AppColors.grey700 : AppColors.grey300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              S.of(context).paymentDetailsTitle,
              style: AppTextStyles.h5.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDark
                    ? theme.colorScheme.surfaceContainerHighest
                    : AppColors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isDark ? AppColors.grey700 : AppColors.grey200,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).confirmOrderPrice,
                        style: AppTextStyles.body16SemiBold.copyWith(
                          color: theme.colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${calculatedPrice.toStringAsFixed(2)}',
                        style: AppTextStyles.body16SemiBold.copyWith(
                          color: theme.colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ...displayItems.map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              item.title,
                              style: AppTextStyles.body14Regular.copyWith(
                                color: isDark
                                    ? AppColors.grey400
                                    : AppColors.grey500,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '\$${item.price % 1 == 0 ? item.price.toInt().toString() : item.price.toStringAsFixed(2)}',
                            style: AppTextStyles.body14Regular.copyWith(
                              color: isDark
                                  ? AppColors.grey400
                                  : AppColors.grey500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
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
                        S.of(context).confirmOrderShipping,
                        style: AppTextStyles.body16SemiBold.copyWith(
                          color: theme.colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${shippingFee % 1 == 0 ? shippingFee.toInt().toString() : shippingFee.toStringAsFixed(2)}',
                        style: AppTextStyles.body16SemiBold.copyWith(
                          color: theme.colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
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
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${totalPayment.toStringAsFixed(2)}',
                        style: AppTextStyles.body16SemiBold.copyWith(
                          color: theme.colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
