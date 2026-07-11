import 'package:flutter/material.dart';
import 'app_colors.dart';

class OnboardingTextstyle {
  static const TextStyle skip = TextStyle(
    color: OnboardingColors.primary,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle onboardingTitle = TextStyle(
    color: OnboardingColors.titleColor,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle onboardingDescription = TextStyle(
    color: OnboardingColors.greyTextColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle firstButton = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle secondButton = TextStyle(
    color: OnboardingColors.primary,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
}