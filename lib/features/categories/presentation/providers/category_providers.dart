import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/features/categories/data/repositories/category_repository_impl.dart';
import 'package:bazar_group_1/features/categories/domain/entities/book.dart';
import 'package:bazar_group_1/features/categories/domain/entities/category.dart';
import 'package:bazar_group_1/features/categories/domain/repositories/category_repository.dart';

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepositoryImpl();
});

final categoriesProvider = FutureProvider<List<Category>>((ref) async {
  final repository = ref.watch(categoryRepositoryProvider);
  return repository.getCategories();
});

final selectedCategoryIdProvider = StateProvider<String>((ref) => 'all');

final categoryBooksProvider = FutureProvider<List<Book>>((ref) async {
  final repository = ref.watch(categoryRepositoryProvider);
  final selectedCategoryId = ref.watch(selectedCategoryIdProvider);
  return repository.getBooks(categoryId: selectedCategoryId);
});

final bookSearchShowProvider = StateProvider<bool>((ref) => false);
final bookSearchQueryProvider = StateProvider<String>((ref) => '');