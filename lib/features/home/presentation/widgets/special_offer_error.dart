import 'package:bazar_group_1/core/components/buttons/small_primary_button.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class SpecialOfferError extends StatelessWidget {
  final VoidCallback onRetry;

  const SpecialOfferError({
    super.key,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            S.of(context).failedToLoadOffers,
            style: AppTextStyles.body14Regular,
          ),
          const SizedBox(height: 8),
          SmallPrimaryButton(
            label: S.of(context).retryButton,
            onPressed: onRetry,
          ),
        ],
      ),
    );
  }
}
