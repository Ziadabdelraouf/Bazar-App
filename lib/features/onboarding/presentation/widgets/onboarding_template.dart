import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/onboarding/presentation/widgets/onboarding_buttons.dart';
import 'package:bazar_group_1/features/onboarding/presentation/widgets/onboarding_dot.dart';
import 'package:flutter/material.dart';


class OnboardingTemplate extends StatelessWidget {
  const OnboardingTemplate({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.activeDotIndex,
    required this.firstButton,
    required this.secondButton,
    required this.onFirstButtonTap,
    required this.onSecondButtonTap,
    this.onSkip,

  });
  final String imagePath;
  final String title;
  final String description;
  final int activeDotIndex;
  final String firstButton;
  final String secondButton;
  final VoidCallback onFirstButtonTap;
  final VoidCallback onSecondButtonTap;
  final VoidCallback ? onSkip;


  @override
  Widget build(BuildContext context) {
    final screensize=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: 
      SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(left:screensize.width*0.074,top: screensize.height*0.019),
              child:Align(
                alignment: Alignment.topLeft,
              
              child: Container(
                
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
                //padding: EdgeInsets.symmetric(horizontal:16,vertical: 8),
                child: InkWell(
                  onTap: onSkip,
                  child: Text("Skip",style:AppTextStyles.body14Regular,))
                ),),
            ),
           
              Image.asset(imagePath,width: screensize.width*0.853,height: screensize.height*0.394,fit: BoxFit.contain,),
            
            
            Padding(
              padding:  EdgeInsets.only(top: screensize.height*0.017),
              child: SizedBox(
                width: screensize.width*0.64,
                height: screensize.height*0.1,
                child: Text(title,style: AppTextStyles.h3,textAlign: TextAlign.center,)),
            ),
           
              
            Padding(
              padding:  EdgeInsets.only(top: screensize.height*0.037),
              child: SizedBox(
                width: screensize.width*0.77,
                height: screensize.height*0.15,
                child: Text(description, style: app_text_styles.body14Regular,textAlign: TextAlign.center,)),
            ),
            //const SizedBox(height: 32),
               
            Padding(
              padding: EdgeInsets.only(top: screensize.height*0.0344),
              child: OnboardingDot(activeIndex: activeDotIndex),
            ),

            OnboardingButtons(firstButtonLabel: firstButton, firstButtonOnPressed: onFirstButtonTap, secondButtonLabel: secondButton, secondButtonOnPressed: onSecondButtonTap)
          ],
        ),
      ),
    ),);
  }
}
