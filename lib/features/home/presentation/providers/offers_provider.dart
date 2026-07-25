import 'package:bazar_group_1/core/network/books_dio.dart';
import 'package:bazar_group_1/features/home/data/datasources/offer_remote_datasource.dart';
import 'package:bazar_group_1/features/home/data/repositories/offers_repository_impl.dart';
import 'package:bazar_group_1/features/home/domain/entities/offer.dart';
import 'package:bazar_group_1/features/home/domain/repositories/offers_repository.dart';
import 'package:bazar_group_1/features/home/presentation/notifiers/offer_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final offersProvider = AsyncNotifierProvider<OfferNotifier, List<Offer>>(() {
  return OfferNotifier();
});

final offersRepositoryProvider = Provider<OffersRepository>((ref) {
  return OffersRepositoryImpl(ref.read(offerRemoteDataSourceProvider));
});

final offerRemoteDataSourceProvider = Provider<OfferRemoteDatasource>((ref) {
  return OfferRemoteDatasource(BooksDio());
});
