import 'package:bazar_group_1/features/onboarding/presentation/widgets/onboarding_template.dart';
import '../../../../core/router/app_routes.dart';
import 'package:flutter/material.dart';



class OnboardingOne extends StatelessWidget {
  const OnboardingOne({super.key});
  @override
  Widget build(BuildContext context) {
    return OnboardingTemplate(
      imagePath: "assets/onboarding1.png",
       title: "Now reading books will be easier",
        description: " Discover new worlds, join a vibrant reading community. Start your reading adventure effortlessly with us.",
         activeDotIndex:0, 
         firstButton: "Continue", 
         secondButton: "Sign in", 
         onFirstButtonTap:  () {
          Navigator.pushNamed(context, AppRoutes.onboardingTwo);
        }, 
         onSecondButtonTap: (){
          Navigator.pushNamed(context,AppRoutes.onboardingThree);
         },
         onSkip: () {
        Navigator.pushNamed(context, AppRoutes.onboardingThree);
       
      },
      
         );
    

    
    }}
    
    
    
    
    
    
    