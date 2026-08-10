import 'package:bazar_group_1/features/categories/data/models/book_model.dart';
import 'package:bazar_group_1/features/categories/data/models/category_model.dart';
import 'package:bazar_group_1/features/categories/domain/entities/book.dart';
import 'package:bazar_group_1/features/categories/domain/entities/category.dart';
import 'package:bazar_group_1/features/categories/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  static final List<CategoryModel> _mockCategories = [
    const CategoryModel(id: 'cat_1', nameEn: 'Novels', nameAr: 'روايات'),
    const CategoryModel(id: 'cat_2', nameEn: 'Self Love', nameAr: 'تطوير الذات'),
    const CategoryModel(id: 'cat_3', nameEn: 'Science', nameAr: 'علوم'),
    const CategoryModel(id: 'cat_4', nameEn: 'Romantic', nameAr: 'رومانسي'),
  ];

  static final List<BookModel> _mockBooks = [
    BookModel(
      id: 'book_1',
      title: 'The Da Vinci Code',
      description: 'A mystery thriller novel.',
      imageUrl: 'https://covers.openlibrary.org/b/id/8231856-L.jpg',
      authorIds: const ['author_1'],
      categoryIds: const ['cat_1'],
      vendorId: 'vendor_1',
      price: 19.99,
      averageRating: 4.5,
    ),
    BookModel(
      id: 'book_2',
      title: 'Carrie Fisher',
      description: 'The best awful, a novel.',
      imageUrl: 'https://covers.openlibrary.org/b/id/8231857-L.jpg',
      authorIds: const ['author_2'],
      categoryIds: const ['cat_1'],
      vendorId: 'vendor_1',
      price: 27.12,
      averageRating: 4.2,
    ),
    BookModel(
      id: 'book_3',
      title: 'The Good Sister',
      description: 'A gripping novel.',
      imageUrl: 'https://covers.openlibrary.org/b/id/8231858-L.jpg',
      authorIds: const ['author_3'],
      categoryIds: const ['cat_1', 'cat_4'],
      vendorId: 'vendor_2',
      price: 27.12,
      averageRating: 4.7,
    ),
    BookModel(
      id: 'book_4',
      title: 'The Waiting',
      description: 'County Secrets.',
      imageUrl: 'https://covers.openlibrary.org/b/id/8231859-L.jpg',
      authorIds: const ['author_4'],
      categoryIds: const ['cat_4'],
      vendorId: 'vendor_2',
      price: 27.12,
      averageRating: 4.0,
    ),
  ];

  @override
  Future<List<Category>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _mockCategories;
  }

  @override
  Future<List<Book>> getBooks({String? categoryId}) async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (categoryId == null || categoryId == 'all') {
      return _mockBooks;
    }
    return _mockBooks
        .where((book) => book.categoryIds.contains(categoryId))
        .toList();
  }
}