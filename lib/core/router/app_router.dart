import 'package:bazar_group_1/core/constants/enums.dart';
import 'package:bazar_group_1/features/auth/presentation/pages/sign_in_page.dart';
import 'package:bazar_group_1/features/auth/presentation/pages/sign_up_page.dart';
import 'package:bazar_group_1/features/auth/presentation/pages/success_page.dart';
import 'package:bazar_group_1/features/auth/presentation/pages/verification_page.dart';
import 'package:flutter/material.dart';

import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import 'app_routes.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    AppRoutes.onboardingPage: (context) => const OnboardingPage(),
    AppRoutes.successfulLogin: (context) =>
        const SuccessPage(flow: SuccessPageFlow.successfulLogin),
    AppRoutes.passwordChange: (context) =>
        const SuccessPage(flow: SuccessPageFlow.passwordChange),
    AppRoutes.onboardingPage: (context) => const OnboardingPage(),
    AppRoutes.signInPage: (context) => const SignInPage(),
    AppRoutes.signUpPage: (context) => const SignUpPage(),
    AppRoutes.verificationPage: (context) =>
        const VerificationPage(),
  };
}
