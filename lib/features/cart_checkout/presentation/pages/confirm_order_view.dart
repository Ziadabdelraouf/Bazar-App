import 'package:bazar_group_1/core/components/app_bars/app_back_bar.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/responsive/app_responsive_breakpoints.dart';

import 'package:bazar_group_1/features/cart_checkout/presentation/notifiers/cart_notifier.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/notifiers/delivery_date_time_notifier.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/widgets/confirm_order/confirm_order_address_card.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/widgets/confirm_order/confirm_order_bottom_bar.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/widgets/confirm_order/confirm_order_date_time_card.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/widgets/confirm_order/confirm_order_payment_card.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/widgets/confirm_order/confirm_order_summary_card.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/widgets/confirm_order/delivery_date_time_bottom_sheet.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/widgets/confirm_order/payment_details_bottom_sheet.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/notification_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfirmOrderView extends ConsumerWidget {
  const ConfirmOrderView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartAsync = ref.watch(cartNotifierProvider);
    final dateTimeState = ref.watch(deliveryDateTimeNotifierProvider);

    double subtotal = 87.10;
    cartAsync.whenData((items) {
      if (items.isNotEmpty) {
        subtotal = items.fold(0.0, (sum, item) => sum + item.totalPrice);
      }
    });

    final padding = context.responsiveValue<double>(
      mobile: 16.0,
      tablet: 20.0,
      desktop: 24.0,
    );

    return Scaffold(
      appBar: AppBackBar(
        title: S.of(context).confirmOrderTitle,
        trailingWidget: const NotificationIcon(),
      ),
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: padding, vertical: 16.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ConfirmOrderAddressCard(
                    onChangePressed: () {},
                  ),
                  const SizedBox(height: 16),
                  ConfirmOrderSummaryCard(
                    price: subtotal,
                    shipping: 2.0,
                    onSeeDetailsPressed: () =>
                        showPaymentDetailsBottomSheet(context),
                  ),
                  const SizedBox(height: 16),
                  ConfirmOrderDateTimeCard(
                    title: dateTimeState.formattedDate,
                    subtitle: dateTimeState.selectedTimeSlot,
                    onTap: () => showDeliveryDateTimeBottomSheet(context),
                  ),
                  const SizedBox(height: 16),
                  const ConfirmOrderPaymentCard(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: ConfirmOrderBottomBar(
        onOrderPressed: () {},
      ),
    );
  }
}
