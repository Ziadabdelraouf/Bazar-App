import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/favorite_item.dart';

class FavoritesFirestoreService {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  FavoritesFirestoreService({
    FirebaseFirestore? firestore,
    FirebaseAuth? auth,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _auth = auth ?? FirebaseAuth.instance;

  String get _userId {
    final user = _auth.currentUser;

    if (user == null) {
      throw Exception('User is not logged in');
    }

    return user.uid;
  }

  CollectionReference<Map<String, dynamic>> get _favoritesCollection {
    return _firestore
        .collection('users')
        .doc(_userId)
        .collection('favorites');
  }

  Future<void> addFavorite(FavoriteItem item) async {
    await _favoritesCollection
        .doc(item.bookId)
        .set({
      ...item.toFirestore(),
      'addedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> removeFavorite(String bookId) async {
    await _favoritesCollection
        .doc(bookId)
        .delete();
  }

  Future<List<FavoriteItem>> getFavorites() async {
    final snapshot = await _favoritesCollection
        .orderBy('addedAt', descending: true)
        .get();

    return snapshot.docs
        .map(
          (doc) => FavoriteItem.fromFirestore(doc.data()),
        )
        .toList();
  }

  Future<bool> isFavorite(String bookId) async {
    final doc = await _favoritesCollection
        .doc(bookId)
        .get();

    return doc.exists;
  }
}