import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/offer_model.dart';

class OffersRepository {
  final FirebaseFirestore _firestore;

  OffersRepository({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<List<OfferModel>> getOffers() async {
    final snapshot = await _firestore
        .collection('offers')
        .where('isActive', isEqualTo: true)
        .get();

    return snapshot.docs
        .map((doc) => OfferModel.fromFirestore(doc))
        .toList();
  }
}