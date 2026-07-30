import 'package:dio/dio.dart';
import 'package:bazar_group_1/core/network/books_dio.dart';
import 'package:bazar_group_1/features/profile/data/models/favorite_item_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesRemoteDataSource {
  final BooksDio booksDio;

  FavoritesRemoteDataSource(this.booksDio);

  Future<List<FavoriteItemModel>> getFavorites() async {
    try {
      // TODO: Replace with a real call once a Favorites endpoint exists.
      // Example, once BooksDio has wrapper methods:
      // final response = await booksDio.get('/favorites');
      // final items = response.data['items'] as List;
      // return items.map((json) => FavoriteItemModel.fromJson(json)).toList();

      // No real endpoint exists yet, so this always falls through to mock data.
      throw UnimplementedError('No real Favorites endpoint yet.');
    } catch (e) {
      return _getMockFavorites();
    }
  }

  List<FavoriteItemModel> _getMockFavorites() {
    final mockJson = [
      {
        'id': '1',
        'title': 'In in amet ultrices sit.',
        'imageUrl': null,
        'price': 19.99,
      },
      {
        'id': '2',
        'title': 'Bibendum facilisis.',
        'imageUrl': null,
        'price': 27.12,
      },
      {
        'id': '3',
        'title': 'Nulla et diam cras.',
        'imageUrl': null,
        'price': 13.52,
      },
      {
        'id': '4',
        'title': 'Risus malesuada in.',
        'imageUrl': null,
        'price': 31.00,
      },
    ];

    return mockJson.map((json) => FavoriteItemModel.fromJson(json)).toList();
  }
}
final favoritesRemoteDataSourceProvider = Provider<FavoritesRemoteDataSource>(
  (ref) => FavoritesRemoteDataSource(BooksDio()),
); 
