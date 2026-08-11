import 'package:bazar_group_1/core/components/app_bars/app_back_bar.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/responsive/app_responsive_breakpoints.dart';
import 'package:bazar_group_1/core/router/app_routes.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/providers/cart_providers.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/widgets/confirm_order/confirm_order_address_card.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/widgets/confirm_order/confirm_order_bottom_bar.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/widgets/confirm_order/confirm_order_date_time_card.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/widgets/confirm_order/confirm_order_payment_card.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/widgets/confirm_order/confirm_order_summary_card.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/widgets/confirm_order/delivery_date_time_bottom_sheet.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/widgets/confirm_order/payment_details_bottom_sheet.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/notification_icon.dart';
import 'package:bazar_group_1/features/profile/presentation/providers/location_address_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfirmOrderView extends ConsumerWidget {
  const ConfirmOrderView({super.key});

  Future<void> _onOrderPressed(BuildContext context, WidgetRef ref) async {
    final addressState = ref.read(locationAddressProvider);
    final isAddressSelected =
        addressState.addressTitle.isNotEmpty ||
        addressState.fullAddress.isNotEmpty;
    if (!isAddressSelected) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).pleaseSelectDeliveryAddress),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    final dateTimeState = ref.read(deliveryDateTimeNotifierProvider);
    final isDateTimeSelected = dateTimeState.selectedTimeSlot.isNotEmpty;
    if (!isDateTimeSelected) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).pleaseSelectDeliveryDateTime),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    final paymentState = ref.read(paymentNotifierProvider);
    final isPaymentSelected =
        paymentState.type == PaymentType.cash ||
        (paymentState.type == PaymentType.card &&
            paymentState.cardNumber.isNotEmpty);
    if (!isPaymentSelected) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).pleaseSelectPaymentMethod),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    await ref.read(cartNotifierProvider.notifier).clearCart();

    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(S.of(context).orderPlacedSuccessfully),
        behavior: SnackBarBehavior.floating,
      ),
    );

    Navigator.of(context).pop();
  }

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
                    onChangePressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.address);
                    },
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
                    title: dateTimeState.getFormattedDate(context),
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
        onOrderPressed: () => _onOrderPressed(context, ref),
      ),
    );
  }
}
