import 'package:bazar_group_1/features/home/presentation/home_page.dart';
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
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const HomePage(),
        ), // غيّرها لصفحتك الرئيسية
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF54408C),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/images/splash_watermark_preview_on_purple.png',
            ),
            width: MediaQuery.of(context).size.width * 0.9,
          ),
          Center(
            child: Image.asset(
              'assets/images/splash_logo_transparent_final.png',
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}
