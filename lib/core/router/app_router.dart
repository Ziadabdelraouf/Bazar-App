import 'package:bazar_group_1/core/constants/enums.dart';
import 'package:bazar_group_1/features/auth/presentation/pages/success_page.dart';
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
    AppRoutes.successfulLogin: (context) =>
        const SuccessPage(flow: SuccessPageFlow.successfulLogin),
    AppRoutes.passwordChange: (context) =>
        const SuccessPage(flow: SuccessPageFlow.passwordChange),
  };
}
