import 'package:bazar_group_1/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/localization/generated/l10n.dart';
import 'core/router/app_router.dart';
import 'features/auth/presentation/pages/sign_up_verification_email.dart';
import 'features/auth/presentation/pages/forgot_password_verification_email.dart';
import 'features/auth/presentation/pages/forgot_password_verification_phone.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale("ar"),
      // locale: Locale("en"),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Bazar App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SplashScreen(),
      //home: SignUpVerificationEmail(email: 'Johndoe@gmail.com'),
      //home: ForgotPasswordVerificationEmail(email: 'Johndoe@email.com'),
      //home: ForgotPasswordVerificationPhone(phoneNumber: '(+965) 123 435 7565'),
      routes: AppRouter.routes,
    );
  }
}