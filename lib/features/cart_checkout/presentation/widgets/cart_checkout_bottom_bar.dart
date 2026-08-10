import 'package:bazar_group_1/core/responsive/app_responsive_breakpoints.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CartCheckoutBottomBar extends StatelessWidget {
  final double subtotal;
  final VoidCallback onCheckout;

  const CartCheckoutBottomBar({
    super.key,
    required this.subtotal,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final isWide = !context.isMobile || isLandscape;

    final padding = context.responsiveValue<double>(
      mobile: isLandscape ? 12.0 : 20.0,
      tablet: 20.0,
      desktop: 24.0,
    );

    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: BorderRadius.vertical(
          top: const Radius.circular(20),
          bottom: Radius.circular(isWide ? 20 : 0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: AppTextStyles.h5.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              Text(
                '\$${subtotal.toStringAsFixed(2)}',
                style: AppTextStyles.h4.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
          SizedBox(height: isLandscape ? 8 : 16),
          SizedBox(
            width: double.infinity,
            height: isLandscape ? 44 : 50,
            child: ElevatedButton(
              onPressed: onCheckout,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(48),
                ),
                elevation: 0,
              ),
              child: Text(
                'Checkout',
                style: AppTextStyles.h6.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
