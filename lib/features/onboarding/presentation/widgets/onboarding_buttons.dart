import 'package:bazar_group_1/core/theme/onboarding_colors.dart';
import 'package:bazar_group_1/core/theme/onboarding_textstyle.dart';
import 'package:flutter/material.dart';

class OnboardingButtons extends StatelessWidget {
  const OnboardingButtons({
    super.key,
    required this.firstButtonLabel,
    required this.firstButtonOnPressed,
    required this.secondButtonLabel,
    required this.secondButtonOnPressed,

    });
  final String firstButtonLabel;
  final VoidCallback firstButtonOnPressed;
  final String secondButtonLabel;
  final VoidCallback secondButtonOnPressed;
  
  @override
  Widget build(BuildContext context) {
    final screensize=MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
                padding: EdgeInsets.only(top: screensize.height*0.039,right: screensize.width*0.064,left: screensize.width*0.064),
                child: Column(
                  spacing: 8,
                  children: [
                    InkWell(
                      onTap: firstButtonOnPressed,
                      child: Container(
                        width: screensize.width*0.872,
                        height: screensize.height*0.068,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: OnboardingColors.primary,
                          borderRadius: BorderRadius.circular(12),
                          
                        ),
                        child: Text(firstButtonLabel,style: OnboardingTextstyle.firstButton,textAlign: TextAlign.center,),
                                      
                      ),
                    ),
                    InkWell(
                      onTap: secondButtonOnPressed,
                      child: Container(
                        width: screensize.width*0.872,
                        height: screensize.height*0.068,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color:OnboardingColors.secondaryButtonBackground,
                          borderRadius: BorderRadius.circular(12),
                          
                        ),
                        child: Text(secondButtonLabel,style:  OnboardingTextstyle.secondButton,textAlign: TextAlign.center,),
                                      
                      ),
                    ),
                  ],
                ),
              ),

      ],
    );
  }
}