import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/features/profile/domain/entities/favorite_item.dart';

class FavoritesNotifier extends Notifier<List<FavoriteItem>> {
  @override
  List<FavoriteItem> build() {
    return [];
  }

  void addFavorite(FavoriteItem item) {
    final alreadyExists = state.any((existing) => existing.title == item.title);
    if (alreadyExists) return;

    state = [...state, item];
  }

  void removeFavorite(String title) {
    state = state.where((item) => item.title != title).toList();
  }

  bool isFavorite(String title) {
    return state.any((item) => item.title == title);
  }
}

final favoritesNotifierProvider =
    NotifierProvider<FavoritesNotifier, List<FavoriteItem>>(
  () => FavoritesNotifier(),
);