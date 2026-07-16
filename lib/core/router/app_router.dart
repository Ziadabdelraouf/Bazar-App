import 'package:flutter/material.dart';

import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import 'app_routes.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    AppRoutes.onboardingPage: (context) => const OnboardingPage(),
  };
}