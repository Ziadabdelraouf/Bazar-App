import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bazar_group_1/features/profile/domain/entities/favorite_item.dart';

class FavoritesNotifier extends Notifier<List<FavoriteItem>> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  List<FavoriteItem> build() {
    // Load the user's favorites from Firestore
    Future.microtask(_loadFavorites);

    return [];
  }



  CollectionReference<Map<String, dynamic>> _favoritesCollection() {
    final user = _auth.currentUser;

    if (user == null) {
      throw Exception('User is not logged in.');
    }

    return _firestore
        .collection('users')
        .doc(user.uid)
        .collection('favorites');
  }

  Future<void> _loadFavorites() async {
    try {
      final snapshot = await _favoritesCollection().get();

      final favorites = snapshot.docs.map((doc) {
        return FavoriteItem.fromFirestore(doc.data());
      }).toList();

      state = favorites;
    } catch (e) {
      print('Error loading favorites: $e');
    }
  }

 
  Future<void> addFavorite(FavoriteItem item) async {
    try {
      final user = _auth.currentUser;

      if (user == null) {
        throw Exception('User is not logged in.');
      }

      // Don't add the same book twice
      final alreadyExists = state.any(
        (existing) => existing.bookId == item.bookId,
      );

      if (alreadyExists) {
        return;
      }

      // Save to Firestore
      await _favoritesCollection()
          .doc(item.bookId)
          .set({
        ...item.toFirestore(),
        'addedAt': FieldValue.serverTimestamp(),
      });

      // Update local Riverpod state
      state = [
        ...state,
        item,
      ];
    } catch (e) {
      print('Error adding favorite: $e');
      rethrow;
    }
  }

  
  Future<void> removeFavorite(String bookId) async {
    try {
      final user = _auth.currentUser;

      if (user == null) {
        throw Exception('User is not logged in.');
      }

      // Delete from Firestore
      await _favoritesCollection()
          .doc(bookId)
          .delete();

      // Update local state
      state = state
          .where(
            (item) => item.bookId != bookId,
          )
          .toList();
    } catch (e) {
      print('Error removing favorite: $e');
      rethrow;
    }
  }

  bool isFavorite(String bookId) {
    return state.any(
      (item) => item.bookId == bookId,
    );
  }
}

final favoritesNotifierProvider =
    NotifierProvider<FavoritesNotifier, List<FavoriteItem>>(
  FavoritesNotifier.new,
);