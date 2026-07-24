import 'package:bazar_group_1/features/home/domain/entities/offer.dart';
import 'package:bazar_group_1/features/home/domain/repositories/offers_repository.dart';
import 'package:bazar_group_1/features/home/presentation/providers/offers_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OfferNotifier extends AsyncNotifier<List<Offer>> {
  final ValueNotifier<int> pageNotifier = ValueNotifier<int>(0);

  @override
  Future<List<Offer>> build() async {
    ref.onDispose(() {
      pageNotifier.dispose();
    });
    final offersRepository = ref.read(offersRepositoryProvider);
    return await offersRepository.getOffers();
  }

  void setPageIndex(int index) {
    pageNotifier.value = index;
  }

  Future<void> getOffers(OffersRepository offersRepository) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final offers = await offersRepository.getOffers();
      return offers;
    });
  }
}

