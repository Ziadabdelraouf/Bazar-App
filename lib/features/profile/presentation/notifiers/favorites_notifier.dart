import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/features/profile/domain/entities/favorite_item.dart';
import 'package:bazar_group_1/features/profile/data/repositories/favorites_repository_impl.dart';

class FavoritesNotifier extends AsyncNotifier<List<FavoriteItem>> {
  @override
  Future<List<FavoriteItem>> build() async {
    final repository = ref.watch(favoritesRepositoryProvider);
    return repository.getFavorites();
  }

  Future<void> removeFavorite(String id) async {
    final repository = ref.read(favoritesRepositoryProvider);
    await repository.removeFavorite(id);

    state = await AsyncValue.guard(() => repository.getFavorites());
  }
}

final favoritesNotifierProvider =
    AsyncNotifierProvider<FavoritesNotifier, List<FavoriteItem>>(
  () => FavoritesNotifier(),
);