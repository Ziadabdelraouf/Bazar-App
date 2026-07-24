
import 'package:bazar_group_1/features/home/domain/entities/author.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/author_card.dart';
import 'package:flutter/material.dart';

class AuthorListViewWidget extends StatelessWidget {
  const AuthorListViewWidget({super.key,
  required this.authors});
  final List<Author>authors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
         itemCount: authors.length,
         scrollDirection: Axis.horizontal,
        //itemCount: authors.length,
        itemBuilder: (context, index){
        return AuthorCard(author: authors[index]);
      })
    );
  }
}