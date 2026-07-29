class FavoriteItem {
  final String id;
  final String title;
  final String? imageUrl;
  final double price;

  FavoriteItem({
    required this.id,
    required this.title,
    this.imageUrl,
    required this.price,
  });
}