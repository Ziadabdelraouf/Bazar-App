class FavoriteItem {
  final String title;
  final String? imageUrl;
  final double price;

  FavoriteItem({
    required this.title,
    this.imageUrl,
    required this.price,
  });

  factory FavoriteItem.fromPriceText({
    required String title,
    required String priceText,
    String? imageUrl,
  }) {
    final match = RegExp(r'[\d.]+').firstMatch(priceText);
    final price = match != null ? double.tryParse(match.group(0)!) ?? 0.0 : 0.0;

    return FavoriteItem(
      title: title,
      imageUrl: imageUrl,
      price: price,
    );
  }
}