import 'package:bazar_group_1/core/responsive/app_responsive_breakpoints.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/home/presentation/pages/detail_menu_page.dart';
import 'package:bazar_group_1/features/profile/presentation/notifiers/favorites_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookCard extends ConsumerWidget {
  final String bookId;
  final String title;
  final String price;
  final String imagePath;
  const BookCard({
    super.key,
    required this.bookId,
    required this.title,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    final cardWidth = context.responsiveValue<double>(
      mobile: 127.0,
      tablet: 140.0,
      desktop: 160.0,
    );

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Theme.of(context).colorScheme.surface,
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) => DetailMenuPage(
            bookId: bookId,
            title: title,
            price: price,
            imagePath: imagePath,
            brandLogo: AppIcons.goodDayVector,
          ),
        );
      },
      child: SizedBox(
        width: cardWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outlineVariant,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                clipBehavior: Clip.antiAlias,
                child: imagePath.isNotEmpty
                    ? Image.network(
                        imagePath,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.broken_image),
                      )
                    : const Icon(Icons.book),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.body14Medium.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            Text(price),
          ],
        ),
      ),
    );
  }
}
