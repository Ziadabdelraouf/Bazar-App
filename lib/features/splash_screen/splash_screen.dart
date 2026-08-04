import 'package:bazar_group_1/core/router/app_routes.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_images.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed(AppRoutes.onboardingPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        // clipBehavior: Clip.none,
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * (495 / 812),
            left: MediaQuery.of(context).size.width * (-30 / 375),
            child: Transform.rotate(
              angle: -90 * 3.1415926535 / 180,
              child: Image.asset(
                AppImages.splashVectorFaded,
                width: MediaQuery.of(context).size.width * (316.61 / 375),
                height: MediaQuery.of(context).size.height * (315.86 / 812),
              ),
            ),
          ),
          Center(
            child: Image.asset(
              AppImages.splashLogoTransparentFinal,
              width: MediaQuery.of(context).size.width * (200 / 375),
            ),
          ),
        ],
      ),
    );
  }
}
