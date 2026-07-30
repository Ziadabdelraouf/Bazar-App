import 'package:bazar_group_1/core/router/app_routes.dart';
import 'package:bazar_group_1/features/onboarding/data/onboarding_data.dart';
import 'package:bazar_group_1/features/onboarding/presentation/provider/onboarding_provider.dart';
import 'package:bazar_group_1/features/onboarding/presentation/widgets/onboarding_template.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends ConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = S.of(context);
    final onboardingItems = getOnboardingItems(context);
    final currentIndex = ref.watch(onboardingProvider);
    final currentItem = onboardingItems[currentIndex];
    final isLastPage = currentIndex == onboardingItems.length - 1;

    return OnboardingTemplate(
      imagePath: currentItem.imagePath,
      title: currentItem.title,
      description: currentItem.description,
      activeDotIndex: currentIndex,
      firstButton: currentItem.firstButton,
      secondButton: localization.signInButton,
      onFirstButtonTap: () {
        if (isLastPage) {
          Navigator.pushNamed(context, AppRoutes.signUpPage);
        } else {
          ref.read(onboardingProvider.notifier).nextPage();
        }
      },
      onSecondButtonTap: () {
        Navigator.pushNamed(context, AppRoutes.signInPage);
      },
      onSkip: () {
        ref.read(onboardingProvider.notifier).reset();

        Navigator.pushNamed(context, AppRoutes.signUpPage);
      },
    );
  }
}
