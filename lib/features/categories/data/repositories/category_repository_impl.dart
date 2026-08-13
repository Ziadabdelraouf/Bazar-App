import 'package:bazar_group_1/features/categories/data/datasources/category_remote_data_source.dart';
import 'package:bazar_group_1/features/categories/domain/entities/book.dart';
import 'package:bazar_group_1/features/categories/domain/entities/category.dart';
import 'package:bazar_group_1/features/categories/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Category>> getCategories() async {
    return remoteDataSource.getCategories();
  }

  @override
  Future<List<Book>> getBooks({String? categoryId}) async {
    final books = await remoteDataSource.getBooks();
    if (categoryId == null || categoryId == 'all') {
      return books;
    }
    return books.where((book) => book.categoryIds.contains(categoryId)).toList();
  }
}