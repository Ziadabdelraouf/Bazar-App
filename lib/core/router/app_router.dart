import 'package:flutter/material.dart';
import 'package:bazar_group_1/core/constants/enums.dart';
import 'package:bazar_group_1/features/auth/presentation/pages/success_page.dart';
import 'package:bazar_group_1/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:bazar_group_1/features/auth/presentation/pages/sign_up_verification_email.dart';
import 'package:bazar_group_1/features/auth/presentation/pages/sign_up_verification_phone.dart';
import 'package:bazar_group_1/features/auth/presentation/pages/phone_number_input_screen.dart';
import 'package:bazar_group_1/features/auth/presentation/pages/forgot_password_verification_email.dart';
import 'package:bazar_group_1/features/auth/presentation/pages/forgot_password_verification_phone.dart';
import 'app_routes.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    AppRoutes.successfulLogin: (context) =>
        const SuccessPage(flow: SuccessPageFlow.successfulLogin),
    AppRoutes.passwordChange: (context) =>
        const SuccessPage(flow: SuccessPageFlow.passwordChange),
    AppRoutes.onboardingPage: (context) => const OnboardingPage(),

    AppRoutes.signUpVerificationEmail: (context) {
      final email = ModalRoute.of(context)!.settings.arguments as String;
      return SignUpVerificationEmail(email: email);
    },

    AppRoutes.phoneNumberInput: (context) => const PhoneNumberInputScreen(),

    AppRoutes.signUpVerificationPhone: (context) {
      final phoneNumber = ModalRoute.of(context)!.settings.arguments as String;
      return SignUpVerificationPhone(phoneNumber: phoneNumber);
    },

    AppRoutes.forgotPasswordVerificationEmail: (context) {
      final email = ModalRoute.of(context)!.settings.arguments as String;
      return ForgotPasswordVerificationEmail(email: email);
    },

    AppRoutes.forgotPasswordVerificationPhone: (context) {
      final phoneNumber = ModalRoute.of(context)!.settings.arguments as String;
      return ForgotPasswordVerificationPhone(phoneNumber: phoneNumber);
    },
  };
}