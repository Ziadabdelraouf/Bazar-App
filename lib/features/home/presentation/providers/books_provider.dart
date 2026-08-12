import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bazar_group_1/features/home/data/models/book_model.dart';

final booksProvider = StreamProvider<List<Book>>((ref) {
  return FirebaseFirestore.instance
      .collection('books')
      .snapshots()
      .map(
        (snapshot) {
          return snapshot.docs
              .map(
                (doc) => Book.fromFirestore(doc),
              )
              .toList();
        },
      );
});