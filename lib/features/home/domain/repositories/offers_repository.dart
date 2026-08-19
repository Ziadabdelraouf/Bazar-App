import 'package:bazar_group_1/features/home/domain/entities/offer.dart';

abstract class OffersRepository {
  Future<List<Offer>> getOffers();
}
