import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/core/network/books_dio.dart';
import 'package:bazar_group_1/features/profile/data/models/favorite_item_model.dart';

class FavoritesRemoteDataSource {
  final BooksDio booksDio;

  FavoritesRemoteDataSource(this.booksDio);

  // TODO(favorites-backend): No real endpoint exists yet. Once one does,
  // replace this with a real call following VendorsRemoteDataSource's
  // pattern (real Dio call + try/catch with _isServerSideIssue fallback,
  // verified against actual observed API behavior first).
  Future<List<FavoriteItemModel>> getFavorites() async {
    return _getMockFavorites();
  }

  // TODO(favorites-backend): No real endpoint exists yet. Once one does,
  // this should call the real delete endpoint.
  Future<void> removeFavorite(String id) async {
    // Nothing to persist to yet — no-op until a real backend exists.
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