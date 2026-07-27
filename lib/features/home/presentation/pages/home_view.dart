import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/book_card.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/top_of_week_section.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/special_offer.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    const double baseHeight = 820.0;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: (185 / baseHeight) * screenHeight,
            child: const SpecialOffer(),
          ),
          const SizedBox(height: 16),
          const TopOfWeekSection(),
          const SizedBox(height: 16),
          Container(
            height: (120 / baseHeight) * screenHeight,
            decoration: BoxDecoration(
              color: AppColors.grey200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: BookCard(title: 'De7k', price: '\$12', imagePath: ''),
          ),
          const SizedBox(height: 16),
          Container(
            height: (190 / baseHeight) * screenHeight,
            decoration: BoxDecoration(
              color: AppColors.grey200,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ],
      ),
    );
  }
}
