import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bazar_group_1/features/categories/data/models/book_model.dart';
import 'package:bazar_group_1/features/categories/data/models/category_model.dart';

class CategoryRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getCategories() async {
    final snapshot = await _firestore.collection('categories').get();
    return snapshot.docs
        .map((doc) => CategoryModel.fromFirestore(doc))
        .toList();
  }

  Future<List<BookModel>> getBooks() async {
    final snapshot = await _firestore.collection('books').get();
    return snapshot.docs.map((doc) => BookModel.fromFirestore(doc)).toList();
  }
}