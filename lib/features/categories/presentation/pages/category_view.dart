import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/features/categories/presentation/providers/category_providers.dart';
import 'package:bazar_group_1/features/categories/presentation/widgets/category_tabs_bar.dart';
import 'package:bazar_group_1/features/categories/presentation/widgets/category_book_card.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';

class CategoryView extends ConsumerWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesProvider);
    final booksAsync = ref.watch(categoryBooksProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          categoriesAsync.when(
            loading: () => const SizedBox(
              height: 28,
              child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
            ),
            error: (error, stackTrace) => const SizedBox(height: 28),
            data: (categories) => CategoryTabsBar(categories: categories),
          ),
          const SizedBox(height: 38),
          Expanded(
            child: booksAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) =>
                  Center(child: Text(S.of(context).couldNotLoadVendors)),
              data: (books) {
                if (books.isEmpty) {
                  return Center(child: Text(S.of(context).noVendorsFound));
                }
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 11,
                    mainAxisSpacing: 20,
                    childAspectRatio: 158 / 214,
                  ),
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    final book = books[index];
                    return CategoryBookCard(
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
      ),
    );
  }
}