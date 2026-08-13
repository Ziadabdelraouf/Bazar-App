import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/offer_model.dart';
import '../../data/repositories/offers_repository.dart';

final offersRepositoryProvider = Provider<OffersRepository>((ref) {
  return OffersRepository();
});

final offersProvider = FutureProvider<List<OfferModel>>((ref) async {
  final repository = ref.read(offersRepositoryProvider);

  return repository.getOffers();
});