import 'package:flutter/material.dart';

import '../../domain/entities/author.dart';
import 'author_card.dart';

class AuthorListViewWidget extends StatelessWidget {
  const AuthorListViewWidget({
    super.key,
    required this.authors,
  });

  final List<Author> authors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: authors.length,
        separatorBuilder: (context, index) {
          return const SizedBox(width: 16);
        },
        itemBuilder: (context, index) {
          return AuthorCard(
            author: authors[index],
          );
        },
      ),
    );
  }
}