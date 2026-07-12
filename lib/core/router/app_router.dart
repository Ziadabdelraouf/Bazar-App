import 'package:flutter/material.dart';

import '../../features/onboarding/presentation/pages/onboarding_one.dart';
import '../../features/onboarding/presentation/pages/onboarding_two.dart';
import '../../features/onboarding/presentation/pages/onboarding_three.dart';
import 'app_routes.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    AppRoutes.onboardingOne: (context) => const OnboardingOne(),
    AppRoutes.onboardingTwo: (context) => const OnboardingTwo(),
    AppRoutes.onboardingThree: (context) => const OnboardingThree(),

  };
}