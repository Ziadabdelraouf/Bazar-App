import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/offers_provider.dart';
import '../widgets/coupon_card.dart';

class OffersPage extends ConsumerWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offersAsync = ref.watch(offersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Offers'),
      ),
      body: offersAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Text(
            'Failed to load offers',
          ),
        ),
        data: (offers) {
          if (offers.isEmpty) {
            return const Center(
              child: Text('No offers available'),
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