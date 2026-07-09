import 'package:flutter/material.dart';
import '../../../core/routes/app_routes.dart';
import 'package:bazar_group_1/features/onboarding/presentation/widgets/onboarding_template.dart';

class OnboardingTwo extends StatelessWidget {
  const OnboardingTwo({super.key});
  @override
  Widget build(BuildContext context) {
    return OnboardingTemplate(
      imagePath: "assets/onboarding2.png",
       title: "Your Bookish Soulmate Awaits",
        description: " Let us be your guide to the perfect read. Discover books tailored to your tastes for a truly rewarding experience.",
         activeDotIndex:1, 
         firstButton: "Continue", 
         secondButton: "Sign in", 
         onFirstButtonTap:  () {
          Navigator.pushNamed(context,AppRoutes.onboardingThree );
        }, 
         onSecondButtonTap: (){
          Navigator.pushNamed(context,AppRoutes.onboardingThree );
         },
          onSkip: () {
        Navigator.pushNamed(context,AppRoutes.onboardingThree );
      },);
  }
}