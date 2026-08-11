import 'package:flutter/material.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/categories/domain/entities/book.dart';
import 'package:bazar_group_1/features/home/presentation/pages/detail_menu_page.dart';

class CategoryBookCard extends StatelessWidget {
  final Book book;
  final VoidCallback? onBeforeOpen;

  const CategoryBookCard({super.key, required this.book, this.onBeforeOpen});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final priceText = '\$${book.price.toStringAsFixed(2)}';

    return GestureDetector(
      onTap: () {
        onBeforeOpen?.call();
        showModalBottomSheet(
          backgroundColor: colorScheme.surface,
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) => DetailMenuPage(
            title: book.title,
            price: priceText,
            imagePath: book.imageUrl,
            brandLogo: AppIcons.goodDayVector,
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: book.imageUrl.isNotEmpty
                    ? Image.network(
                        book.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.broken_image),
                      )
                    : const Icon(Icons.book),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            book.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.body14Medium.copyWith(
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            priceText,
            style: AppTextStyles.body14Bold.copyWith(
              color: colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}