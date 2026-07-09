import '../../../core/routes/app_routes.dart';
import 'package:bazar_group_1/features/onboarding/presentation/widgets/onboarding_template.dart';
import 'package:flutter/material.dart';

class OnboardingThree extends StatelessWidget {
  const OnboardingThree({super.key});
  @override
  Widget build(BuildContext context) {
    return OnboardingTemplate(
      imagePath: "assets/onboarding3.png",
       title: "Start Your Adventure",
        description: " Ready to embark on a quest for inspiration and knowledge? Your adventure begins now. Let's go!",
         activeDotIndex:2, 
         firstButton: "Get Started", 
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