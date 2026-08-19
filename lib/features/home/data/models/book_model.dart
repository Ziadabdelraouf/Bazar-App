import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  final String bookId;
  final String title;
  final String description;
  final String imageUrl;
  final List<String> authorIds;
  final List<String> categoryIds;
  final String vendorId;
  final double price;
  final double? discountPrice;
  final double averageRating;

  const Book({
    required this.bookId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.authorIds,
    required this.categoryIds,
    required this.vendorId,
    required this.price,
    required this.discountPrice,
    required this.averageRating,
  });

  factory Book.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data() ?? {};

    return Book(
      // Firestore document ID
      bookId: doc.id,

      title: data['title'] as String? ?? '',

      description: data['description'] as String? ?? '',

      imageUrl: data['imageUrl'] as String? ?? '',

      authorIds: List<String>.from(
        data['authorIds'] ?? const [],
      ),

      categoryIds: List<String>.from(
        data['categoryIds'] ?? const [],
      ),

      vendorId: data['vendorId'] as String? ?? '',

      price: (data['price'] as num?)?.toDouble() ?? 0.0,

      discountPrice: (data['discountPrice'] as num?)?.toDouble(),

      averageRating:
          (data['averageRating'] as num?)?.toDouble() ?? 0.0,
    );
  }
}