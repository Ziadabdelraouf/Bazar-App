import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/features/home/presentation/providers/books_provider.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopOfWeekAllPage extends ConsumerWidget {
  const TopOfWeekAllPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final booksAsync = ref.watch(booksProvider);
    final l10n = S.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.topOfWeekTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: booksAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(
            child: Text(
              l10n.couldNotLoadVendors,
            ),
          ),
          data: (books) {
            if (books.isEmpty) {
              return Center(child: Text(l10n.noBooksFound));
            }

            return GridView.builder(
              itemCount: books.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.65,
              ),
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
    );
  }
}

