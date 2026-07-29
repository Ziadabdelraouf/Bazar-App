import 'package:bazar_group_1/features/profile/domain/entities/favorite_item.dart';

abstract class FavoritesRepository {
  Future<List<FavoriteItem>> getFavorites();
  Future<void> removeFavorite(String id);
}