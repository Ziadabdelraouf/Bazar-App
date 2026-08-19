class FavoriteItem {
  final String bookId;
  final String title;
  final String? imageUrl;
  final double price;

  const FavoriteItem({
    required this.bookId,
    required this.title,
    this.imageUrl,
    required this.price,
  });

  factory FavoriteItem.fromFirestore(
    Map<String, dynamic> data,
  ) {
    return FavoriteItem(
      bookId: data['bookId'] as String? ?? '',
      title: data['title'] as String? ?? '',
      imageUrl: data['imageUrl'] as String?,
      price: (data['price'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'bookId': bookId,
      'title': title,
      'imageUrl': imageUrl,
      'price': price,
    };
  }
}