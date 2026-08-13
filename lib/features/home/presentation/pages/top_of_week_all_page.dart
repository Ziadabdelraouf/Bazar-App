import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/mock/mock_data_reader.dart';
import 'package:bazar_group_1/features/home/data/models/book_model.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/book_card.dart';
import 'package:flutter/material.dart';

class TopOfWeekAllPage extends StatelessWidget {
  const TopOfWeekAllPage({super.key});

  @override
  Widget build(BuildContext context) {
    final books = parseBooks(mockData);
    final l10n = S.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.topOfWeekTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
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
              title: book.title,
              price: book.price,
              imagePath: book.imagePath,
            );
          },
        ),
      ),
    );
  }
}
