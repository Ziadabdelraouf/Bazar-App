import 'package:bazar_group_1/core/components/app_bars/app_back_bar.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/offers_provider.dart';
import '../widgets/coupon_card.dart';

class OffersPage extends ConsumerWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization=S.of(context);
    final offersAsync = ref.watch(offersProvider);

    return Scaffold(
      appBar:  AppBackBar(title: localization.offersAndPromos),
      body: offersAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Text(
            localization.failedToLoadOffers,
          ),
        ),
        data: (offers) {
          if (offers.isEmpty) {
            return Center(
              child: Text(localization.noOffersAvailable),
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.85,
            ),
            itemCount: offers.length,
            itemBuilder: (context, index) {
              final offer = offers[index];

              return CouponCard(
                offer: offer,
              );
            },
          );
        },
      ),
    );
  }
}