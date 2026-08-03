import 'package:bazar_group_1/core/components/app_bars/app_back_bar.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBackBar(title: 'Order History'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Text('You Have 5 Copons to uses', style: AppTextStyles.h5)],
      ),
    );
  }
}
