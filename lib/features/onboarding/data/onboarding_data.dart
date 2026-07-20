import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/features/onboarding/domain/models/onboarding_item.dart';
import 'package:flutter/material.dart';

List<OnboardingItem> getOnboardingItems(BuildContext context) {
  final localization = S.of(context);

  return [
    OnboardingItem(
      imagePath: 'assets/onboarding1.png',
      title: localization.onboardingOneTitle,
      description: localization.onboardingOneDescription,
      firstButton: localization.continueButton,
    ),
    OnboardingItem(
      imagePath: 'assets/onboarding2.png',
      title: localization.onboardingTwoTitle,
      description: localization.onboardingTwoDescription,
      firstButton: localization.continueButton,
    ),
    OnboardingItem(
      imagePath: 'assets/onboarding3.png',
      title: localization.onboardingThreeTitle,
      description: localization.onboardingThreeDescription,
      firstButton: localization.getStartedButton,
    ),
  ];
}