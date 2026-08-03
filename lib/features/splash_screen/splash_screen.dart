import 'package:bazar_group_1/core/router/app_routes.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_images.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/auth_service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkSessionAndNavigate();
  }

  Future<void> _checkSessionAndNavigate() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;

    final authService = ref.read(authServiceProvider);
    final isLoggedIn = await authService.isLoggedIn();

    if (!mounted) return;

    if (isLoggedIn) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.homePage);
    } else {
      Navigator.of(context).pushReplacementNamed(AppRoutes.onboardingPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary500,
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
