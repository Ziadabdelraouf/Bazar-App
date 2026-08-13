import 'package:bazar_group_1/features/categories/domain/entities/category.dart';
import 'package:bazar_group_1/features/categories/domain/entities/book.dart';

abstract class CategoryRepository {
  Future<List<Category>> getCategories();
  Future<List<Book>> getBooks({String? categoryId});
}