import 'package:bazar_group_1/features/profile/domain/entities/favorite_item.dart';

class FavoriteItemModel extends FavoriteItem {
  FavoriteItemModel({
    required super.id,
    required super.title,
    super.imageUrl,
    required super.price,
  });

  factory FavoriteItemModel.fromJson(Map<String, dynamic> json) {
    return FavoriteItemModel(
      id: json['id'] as String,
      title: json['title'] ?? 'Untitled',
      imageUrl: json['imageUrl'],
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
    );
  }
}