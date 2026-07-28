class Book {
  final String title;
  final String price;
  final String imagePath;

  Book({required this.title, required this.price, required this.imagePath});

  factory Book.fromJson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'] ?? {};
    final saleInfo = json['saleInfo'] ?? {};
    final imageLinks = volumeInfo['imageLinks'] ?? {};

    final retailPrice = saleInfo['retailPrice'];
    final priceText = retailPrice != null
        ? '${retailPrice['amount']} ${retailPrice['currencyCode']}'
        : 'N/A';

    return Book(
      title: volumeInfo['title'] ?? 'Unknown Title',
      price: priceText,
      imagePath: imageLinks['thumbnail'] ?? '',
    );
  }
}

List<Book> parseBooks(dynamic mockData) {
  final items = mockData['items'] as List<dynamic>? ?? [];
  return items.map((item) => Book.fromJson(item)).toList();
}
