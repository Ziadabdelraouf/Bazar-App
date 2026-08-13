import 'package:bazar_group_1/core/responsive/app_responsive_breakpoints.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/home/presentation/providers/books_provider.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopOfWeekSection extends ConsumerWidget {
  const TopOfWeekSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final booksAsync = ref.watch(booksProvider);

    final sectionHeight = context.responsiveValue<double>(
      mobile: (MediaQuery.of(context).size.height * .25)
          .clamp(180.0, 220.0),
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
              style: AppTextStyles.h5.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            Text(
              'See all',
              style: AppTextStyles.body14SemiBold.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        SizedBox(
          height: sectionHeight,

          child: booksAsync.when(
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),

            error: (error, stackTrace) => Center(
              child: Text(
                'Failed to load books',
                style: AppTextStyles.body14Medium,
              ),
            ),

            data: (books) {
              if (books.isEmpty) {
                return const Center(
                  child: Text('No books found'),
                );
              }

              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: books.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(width: 16),

                itemBuilder: (context, index) {
                  final book = books[index];

                  return BookCard(
                    bookId: book.bookId,
                    title: book.title,
                    price: '\$${book.price.toStringAsFixed(2)}',
                    imagePath: book.imageUrl,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}