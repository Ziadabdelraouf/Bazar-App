import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class SpecialOfferEmpty extends StatelessWidget {
  const SpecialOfferEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        S.of(context).noOffersAvailable,
        style: AppTextStyles.body14Regular,
      ),
    );
  }
}
