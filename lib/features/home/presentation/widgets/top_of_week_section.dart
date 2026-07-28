import 'package:bazar_group_1/core/mock/mock_data_reader.dart';
import 'package:bazar_group_1/core/responsive/app_responsive_breakpoints.dart';
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
    final sectionHeight = context.responsiveValue<double>(
      mobile: (MediaQuery.of(context).size.height * (200 / 812)).clamp(
        180.0,
        220.0,
      ),
      tablet: 220.0,
      desktop: 240.0,
    );

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
        SizedBox(
          height: sectionHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final book = books[index];
              return BookCard(
                title: book.title,
                price: book.price,
                imagePath: book.imagePath,
              );
            },
          ),
        ),
      ],
    );
  }
}
