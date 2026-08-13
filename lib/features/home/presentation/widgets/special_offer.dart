import 'package:bazar_group_1/features/cart_checkout/domain/entities/cart_item.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/providers/cart_providers.dart';
import 'package:bazar_group_1/features/home/presentation/providers/bottom_nav_provider.dart';
import 'package:bazar_group_1/features/home/presentation/providers/offers_provider.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/special_offer_card.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/special_offer_empty.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/special_offer_error.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/special_offer_indicators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SpecialOffer extends ConsumerStatefulWidget {
  const SpecialOffer({super.key});

  @override
  ConsumerState<SpecialOffer> createState() => _SpecialOfferState();
}

class _SpecialOfferState extends ConsumerState<SpecialOffer> {
  late PageController _pageController;
  static const int itemMultiplier = 10000;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: (itemMultiplier ~/ 2) * 4);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final offersAsync = ref.watch(offersProvider);

    return offersAsync.when(
      data: (offers) {
        final discountedOffers = offers
            .where((offer) => offer.discount > 0)
            .take(4)
            .toList();

        if (discountedOffers.isEmpty) {
          return const SpecialOfferEmpty();
        }

        return Column(
          children: [
            SizedBox(
              height: 180,
              child: PageView.builder(
                controller: _pageController,
                pageSnapping: true,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) {
                  ref
                      .read(offersProvider.notifier)
                      .setPageIndex(index % discountedOffers.length);
                },
                itemCount: discountedOffers.length * itemMultiplier,
                itemBuilder: (context, index) {
                  final actualIndex = index % discountedOffers.length;
                  final currentItem = discountedOffers[actualIndex];
                  return SpecialOfferCard(
                    offer: currentItem,
                    onOrderPressed: () {
                      ref.read(cartNotifierProvider.notifier).addToCart(
                            CartItem(
                              id: currentItem.title,
                              title: currentItem.title,
                              price: currentItem.price,
                              imagePath: currentItem.image,
                              quantity: 1,
                            ),
                          );
                      ref.read(bottomNavIndexProvider.notifier).state = 2;
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            SpecialOfferIndicators(
              pageNotifier: ref.read(offersProvider.notifier).pageNotifier,
              itemCount: discountedOffers.length,
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => SpecialOfferError(
        onRetry: () {
          ref
              .read(offersProvider.notifier)
              .getOffers(ref.read(offersRepositoryProvider));
        },
      ),
    );
  }
}
