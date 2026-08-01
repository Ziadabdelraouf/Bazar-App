import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/theme/app_images.dart';
import 'package:bazar_group_1/features/onboarding/domain/models/onboarding_item.dart';
import 'package:flutter/material.dart';

List<OnboardingItem> getOnboardingItems(BuildContext context) {
  final localization = S.of(context);

  return [
    OnboardingItem(
      imagePath: AppImages.onboarding1,
      title: localization.onboardingOneTitle,
      description: localization.onboardingOneDescription,
      firstButton: localization.continueButton,
    ),
    OnboardingItem(
      imagePath: AppImages.onboarding2,
      title: localization.onboardingTwoTitle,
      description: localization.onboardingTwoDescription,
      firstButton: localization.continueButton,
    ),
    OnboardingItem(
      imagePath: AppImages.onboarding3,
      title: localization.onboardingThreeTitle,
      description: localization.onboardingThreeDescription,
      firstButton: localization.getStartedButton,
    ),
  ];
}