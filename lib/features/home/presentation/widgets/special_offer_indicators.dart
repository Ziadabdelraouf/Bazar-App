import 'package:flutter/material.dart';

class SpecialOfferIndicators extends StatelessWidget {
  final ValueNotifier<int> pageNotifier;
  final int itemCount;

  const SpecialOfferIndicators({
    super.key,
    required this.pageNotifier,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: pageNotifier,
      builder: (context, currentPage, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(itemCount, (index) {
            final bool isActive = currentPage == index;
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 2.0),
              width: isActive ? 8 : 4,
              height: isActive ? 8 : 4,
              decoration: BoxDecoration(
                color: isActive
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.surfaceContainerHighest,
                shape: BoxShape.circle,
              ),
            );
          }),
        );
      },
    );
  }
}
