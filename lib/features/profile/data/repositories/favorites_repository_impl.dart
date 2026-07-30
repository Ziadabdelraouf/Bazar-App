import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/features/profile/domain/entities/favorite_item.dart';
import 'package:bazar_group_1/features/profile/domain/repositories/favorites_repository.dart';
import 'package:bazar_group_1/features/profile/data/datasources/favorites_remote_data_source.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesRemoteDataSource remoteDataSource;

  FavoritesRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<FavoriteItem>> getFavorites() async {
    return remoteDataSource.getFavorites();
  }

  @override
  Future<void> removeFavorite(String id) async {
    await remoteDataSource.removeFavorite(id);
  }
}

final favoritesRepositoryProvider = Provider<FavoritesRepository>(
  (ref) => FavoritesRepositoryImpl(ref.watch(favoritesRemoteDataSourceProvider)),
);