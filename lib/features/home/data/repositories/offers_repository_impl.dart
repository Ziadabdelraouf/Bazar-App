import 'package:bazar_group_1/features/home/data/datasources/offer_remote_datasource.dart';
import 'package:bazar_group_1/features/home/domain/entities/offer.dart';
import 'package:bazar_group_1/features/home/domain/repositories/offers_repository.dart';

class OffersRepositoryImpl implements OffersRepository {
  final OfferRemoteDatasource _remoteDatasource;
  const OffersRepositoryImpl(this._remoteDatasource);
  @override
  Future<List<Offer>> getOffers() async {
    final offers = await _remoteDatasource.getOffers();
    return offers.map((e) => e.toEntity()).toList();
  }
}
