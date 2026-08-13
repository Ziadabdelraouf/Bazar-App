import 'package:bazar_group_1/features/home/domain/entities/author.dart';
import 'package:bazar_group_1/features/home/presentation/pages/author_detail_page.dart';
import 'package:bazar_group_1/features/home/presentation/pages/home_page.dart';
import 'package:bazar_group_1/features/home/presentation/pages/vendors_search_placeholder_page.dart';
import 'package:bazar_group_1/features/offers/presentation/pages/offers_page.dart';
import 'package:bazar_group_1/features/profile/presentation/pages/my_account_page.dart';
import 'package:bazar_group_1/features/profile/presentation/pages/address_page.dart';
import 'package:bazar_group_1/features/profile/presentation/pages/help_center_page.dart';
import 'package:flutter/material.dart';
import 'package:bazar_group_1/core/constants/enums.dart';
import 'package:bazar_group_1/features/auth/presentation/pages/sign_in_page.dart';
import 'package:bazar_group_1/features/auth/presentation/pages/sign_up_page.dart';
import 'package:bazar_group_1/features/auth/presentation/pages/success_page.dart';
import 'package:bazar_group_1/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:bazar_group_1/features/auth/presentation/pages/sign_up_verification_email.dart';
import 'package:bazar_group_1/features/auth/presentation/pages/sign_up_verification_phone.dart';
import 'package:bazar_group_1/features/auth/presentation/pages/phone_number_input_screen.dart';
import 'package:bazar_group_1/features/auth/presentation/pages/forgot_password_verification_email.dart';
import 'package:bazar_group_1/features/auth/presentation/pages/forgot_password_verification_phone.dart';
import 'package:bazar_group_1/features/forgot_password/presentation/pages/create_new_password_page.dart';
import '../../features/forgot_password/presentation/pages/forgot_password_page.dart';
import 'package:bazar_group_1/features/home/presentation/pages/vendors_page.dart';
import 'package:bazar_group_1/features/profile/presentation/pages/favorites_page.dart';
import 'package:bazar_group_1/features/profile/presentation/pages/order_history_page.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/pages/confirm_order_view.dart';
import 'app_routes.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    AppRoutes.onboardingPage: (context) => const OnboardingPage(),
    AppRoutes.successfulLogin: (context) =>
        const SuccessPage(flow: SuccessPageFlow.successfulLogin),
    AppRoutes.passwordChange: (context) =>
        const SuccessPage(flow: SuccessPageFlow.passwordChange),
    AppRoutes.signInPage: (context) => const SignInPage(),

    AppRoutes.forgotPasswordPage: (context) => const ForgotPasswordPage(),

    AppRoutes.signUpPage: (context) => const SignUpPage(),

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
    AppRoutes.createNewPasswordPage: (context) => const CreateNewPasswordPage(),
    AppRoutes.homePage: (context) => const HomePage(),
    AppRoutes.authorDetailPage: (context) {
      final author = ModalRoute.of(context)!.settings.arguments as Author;
      return AuthorDetailPage(author: author);
    },
    AppRoutes.vendorsPage: (context) => const VendorsPage(),
    AppRoutes.vendorsSearchPage: (context) =>
        const VendorsSearchPlaceholderPage(),
    AppRoutes.myAccount: (context) => const MyAccountPage(),
    AppRoutes.favoritesPage: (context) => const FavoritesPage(),
    AppRoutes.orderHistoryPage: (context) => const OrderHistoryPage(),
    AppRoutes.helpCenter: (context) => const HelpCenterPage(),
    AppRoutes.address: (context) => const AddressPage(),
    AppRoutes.confirmOrder: (context) => const ConfirmOrderView(),
    AppRoutes.offersPage: (context) => const OffersPage(),
    
  };
}
