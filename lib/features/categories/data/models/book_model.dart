import 'package:bazar_group_1/features/categories/domain/entities/book.dart';

class BookModel extends Book {
  const BookModel({
    required super.id,
    required super.title,
    required super.description,
    required super.imageUrl,
    required super.authorIds,
    required super.categoryIds,
    required super.vendorId,
    required super.price,
    super.discountPrice,
    required super.averageRating,
  });

  factory BookModel.fromJson(String id, Map<String, dynamic> json) {
    return BookModel(
      id: id,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      authorIds: List<String>.from(json['authorIds'] ?? []),
      categoryIds: List<String>.from(json['categoryIds'] ?? []),
      vendorId: json['vendorId'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      discountPrice: (json['discountPrice'] as num?)?.toDouble(),
      averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0.0,
    );
  }
}