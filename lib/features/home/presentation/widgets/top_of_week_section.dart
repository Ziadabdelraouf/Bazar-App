import 'package:bazar_group_1/core/mock/mock_data_reader.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/home/data/models/book_model.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/book_card.dart';
import 'package:flutter/material.dart';

class TopOfWeekSection extends StatelessWidget {
  const TopOfWeekSection({super.key});

  @override
  Widget build(BuildContext context) {
    final books = parseBooks(mockData);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Top of Week',
              style: AppTextStyles.h5.copyWith(color: AppColors.grey900),
            ),
            Text(
              'See all',
              style: AppTextStyles.body14SemiBold.copyWith(
                color: AppColors.primary500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: MediaQuery.of(context).size.height * (210 / 812),
          child: ListView.builder(
            itemBuilder:  ,
            itemCount: books.length,
            scrollDirection: Axis.horizontal,
            children: [
              BookCard(
                title: 'The Kite Runner',
                price: '\$14.99',
                imagePath: '',
              ),
              const SizedBox(width: 16),
              BookCard(
                title: 'The Subtle Art',
                price: '\$20.99',
                imagePath: '',
              ),
              const SizedBox(width: 16),
              BookCard(
                title: 'The Art of War',
                price: '\$14.99',
                imagePath: '',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
