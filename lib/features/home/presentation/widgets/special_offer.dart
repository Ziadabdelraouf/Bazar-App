import 'package:bazar_group_1/core/components/buttons/small_primary_button.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SpecialOffer extends ConsumerStatefulWidget {
  const SpecialOffer({super.key});

  @override
  ConsumerState<SpecialOffer> createState() => _SpecialOfferState();
}

class _SpecialOfferState extends ConsumerState<SpecialOffer> {
  int _currentPage = 0;
  int numberOfOffers = 0;
  late PageController _pageController;
  static const int itemMultiplier = 10000;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final int initialPage = (itemMultiplier ~/ 2) * offers.length;
    _pageController = PageController(initialPage: initialPage);

    numberOfOffers = offers.length;
  }

  List<List<String>> offers = [
    ["Special Offer", "Discount 25%", "assets/onboarding1.png"],
    ["Special Offer", "Discount 50%", "assets/onboarding2.png"],
    ["Offer", "Discount 2%", "assets/onboarding1.png"],
    ["Discount", "Discount 33%", "assets/onboarding1.png"],
    ["Sale", "Discount 80%", "assets/onboarding1.png"],
    ["final page", "Discount 0%", "assets/onboarding2.png"],
    ["test", "Discount 100%", "assets/onboarding3.png"],
    ["test", "Discount 100%", "assets/onboarding1.png"],
    ["test", "Discount 100%", "assets/onboarding1.png"],
  ];
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            pageSnapping: true,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index % offers.length;
              });
            },
            // physics: PageScrollPhysics(),
            itemCount: offers.length * itemMultiplier,
            itemBuilder: (context, index) {
              final actualIndex = index % offers.length;
              final currentItem = offers[actualIndex];
              return Card(
                color: AppColors.primary50,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide.none,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 21,
                        top: 45,
                        bottom: 42,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(currentItem[0], style: AppTextStyles.h4),
                          SizedBox(height: 4),
                          Text(
                            currentItem[1],
                            style: AppTextStyles.body14Regular,
                          ),
                          SizedBox(height: 16),
                          SmallPrimaryButton(
                            label: "Order Now",
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    Image.asset(currentItem[2]),
                  ],
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(numberOfOffers, (index) {
            return Container(
              width: _currentPage == index ? 8 : 4,
              height: _currentPage == index ? 8 : 4,
              decoration: BoxDecoration(
                color: _currentPage == index
                    ? AppColors.primary500
                    : AppColors.grey100,
                shape: BoxShape.circle,
              ),
            );
          }),
        ),
      ],
    );
  }
}
