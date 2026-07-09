import 'package:bazar_group_1/core/theme/onboarding_colors.dart';
import 'package:flutter/material.dart';

class OnboardingDot extends StatelessWidget {
  const OnboardingDot({
    super.key,
    required this.activeIndex,
    this.count=3,
  });
  final int activeIndex;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
                  spacing:2 ,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: 
                    List.generate(count, (index){
                      final isActive=index==activeIndex;
                      return Container(
                        width: isActive? 8:4 ,
                        height: isActive?8:4,
                        decoration: BoxDecoration(
                          color: isActive? OnboardingColors.primary: OnboardingColors.inactiveDot,
                          shape: BoxShape.circle,
                        ),

                      );
                    }),
                   
                             
                  
                );
  }
}