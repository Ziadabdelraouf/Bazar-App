import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/responsive/app_responsive_breakpoints.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class ConfirmOrderBottomBar extends StatelessWidget {
  final VoidCallback? onOrderPressed;

  const ConfirmOrderBottomBar({
    super.key,
    this.onOrderPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final padding = context.responsiveValue<double>(
      mobile: isLandscape ? 12.0 : 20.0,
      tablet: 20.0,
      desktop: 24.0,
    );

    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          width: double.infinity,
          height: isLandscape ? 44 : 50,
          child: ElevatedButton(
            onPressed: onOrderPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(48),
              ),
              elevation: 0,
            ),
            child: Text(
              S.of(context).confirmOrderButton,
              style: AppTextStyles.h6.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
