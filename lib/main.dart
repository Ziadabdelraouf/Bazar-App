import 'package:bazar_group_1/core/constants/api_constants.dart';
import 'package:bazar_group_1/core/mock/mock_data_reader.dart';
import 'package:bazar_group_1/core/responsive/app_responsive_breakpoints.dart';
import 'package:bazar_group_1/core/router/app_router.dart';
import 'package:bazar_group_1/core/theme/app_theme.dart';
import 'package:bazar_group_1/features/home/presentation/pages/home_page.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/features/profile/presentation/pages/address_page.dart';
import 'package:bazar_group_1/features/profile/presentation/pages/help_center_page.dart';
import 'package:bazar_group_1/features/splash_screen/splash_screen.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'core/localization/generated/l10n.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  if (kDebugMode) {
    await FirebaseAppCheck.instance.activate(
      providerAndroid: AndroidDebugProvider(
        debugToken: ApiConstants.debugToken.isEmpty
            ? null
            : ApiConstants.debugToken,
      ),
      providerApple: AppleDebugProvider(
        debugToken: ApiConstants.debugToken.isEmpty
            ? null
            : ApiConstants.debugToken,
      ),
    );
  } else {
    await FirebaseAppCheck.instance.activate(
      providerAndroid: const AndroidPlayIntegrityProvider(),
      providerApple: const AppleDeviceCheckProvider(),
    );
  }

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
          breakpoints: AppResponsiveBreakpoints.breakpoints,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: MaxWidthBox(
              maxWidth: AppResponsiveBreakpoints.maxContentWidth,
              // Fills either side of the capped content column on viewports
              // wider than maxContentWidth. Without it that area renders black.
              backgroundColor: Theme.of(context).colorScheme.surface,
              // `Builder` puts this below MaxWidthBox, which clamps
              // MediaQuery.size to its maxWidth. Reading the width from above
              // the box would over-report it on wide screens and shrink the UI.
              child: Builder(
                builder: (context) {
                  // `SizedBox.expand` is load-bearing: MaxWidthBox aligns its
                  // child (topCenter), handing down *loose* constraints.
                  // ResponsiveScaledBox's FittedBox would then shrink-wrap to
                  // the canvas instead of filling — letterboxing the app in
                  // black and cancelling the zoom entirely.
                  return SizedBox.expand(
                    child: ResponsiveScaledBox(
                      width: AppResponsiveBreakpoints.scaledCanvasWidth(
                        MediaQuery.sizeOf(context).width,
                      ),
                      child: child ?? const SizedBox.shrink(),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
      // locale: Locale("ar"),
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
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
      routes: AppRouter.routes,
    );
  }
}
