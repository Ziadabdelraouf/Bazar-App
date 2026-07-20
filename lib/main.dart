import 'package:bazar_group_1/core/router/app_routes.dart';
import 'package:bazar_group_1/features/forgot_password/presentation/pages/create_new_password_page.dart';
import 'package:bazar_group_1/features/forgot_password/presentation/pages/forgot_password_page.dart';
import 'package:bazar_group_1/features/forgot_password/presentation/pages/reset_password_page.dart';
import 'package:bazar_group_1/features/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/localization/generated/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/router/app_router.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //locale: Locale("ar"),
      locale: Locale("en"),
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
      routes: AppRouter.routes,
    );
  }
}
