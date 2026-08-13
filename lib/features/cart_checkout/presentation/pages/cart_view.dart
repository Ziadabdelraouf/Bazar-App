import 'package:bazar_group_1/core/components/app_bars/app_back_bar.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/responsive/app_responsive_breakpoints.dart';
import 'package:bazar_group_1/core/router/app_routes.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/providers/cart_providers.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/widgets/cart_checkout_bottom_bar.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/widgets/cart_items_list.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/widgets/empty_cart_widget.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/notification_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartView extends ConsumerWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartAsync = ref.watch(cartNotifierProvider);

    void navigateToConfirmOrder() {
      Navigator.pushNamed(context, AppRoutes.confirmOrder);
    }

    return Scaffold(
      appBar: AppBackBar(
        title: S.of(context).cartTitle,
        trailingWidget: const NotificationIcon(),
      ),
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      body: cartAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text(
            S.of(context).failedToLoadCart,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        data: (items) {
          if (items.isEmpty) {
            return const EmptyCartWidget();
          }

          double subtotal = 0.0;
          for (final item in items) {
            subtotal += item.totalPrice;
          }

          final isLandscape =
              MediaQuery.of(context).orientation == Orientation.landscape;
          final isWide = !context.isMobile || isLandscape;

          if (isWide) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: context.responsiveValue<int>(
                    mobile: 3,
                    tablet: 3,
                    desktop: 4,
                  ),
                  child: CartItemsList(items: items),
                ),
                Expanded(
                  flex: context.responsiveValue<int>(
                    mobile: 2,
                    tablet: 2,
                    desktop: 2,
                  ),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(
                          context.responsiveValue<double>(
                            mobile: 12.0,
                            tablet: 16.0,
                            desktop: 24.0,
                          ),
                        ),
                        child: CartCheckoutBottomBar(
                          subtotal: subtotal,
                          onCheckout: navigateToConfirmOrder,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }

          return Column(
            children: [
              Expanded(child: CartItemsList(items: items)),
              CartCheckoutBottomBar(
                subtotal: subtotal,
                onCheckout: navigateToConfirmOrder,
              ),
            ],
          );
        },
      ),
    );
  }
}
