class Book {
  final String id;
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
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.authorIds,
    required this.categoryIds,
    required this.vendorId,
    required this.price,
    this.discountPrice,
    required this.averageRating,
  });
}