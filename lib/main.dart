import 'package:bazar_group_1/core/mock/mock_data_reader.dart';
import 'package:bazar_group_1/core/responsive/app_responsive_breakpoints.dart';
import 'package:bazar_group_1/core/router/app_router.dart';
import 'package:bazar_group_1/features/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'core/localization/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await loadMockData();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return ResponsiveBreakpoints.builder(
          child: Builder(
            builder: (context) {
              return GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: MaxWidthBox(
                  maxWidth: AppResponsiveBreakpoints.maxContentWidth,
                  child: ResponsiveScaledBox(
                    width: context.responsiveValue<double>(
                      mobile: 450,
                      tablet: 768,
                      desktop: AppResponsiveBreakpoints.maxContentWidth,
                    ),
                    child: child ?? const SizedBox.shrink(),
                  ),
                ),
              );
            },
          ),
          breakpoints: AppResponsiveBreakpoints.breakpoints,
        );
      },
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
