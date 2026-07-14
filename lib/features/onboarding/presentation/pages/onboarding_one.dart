import 'package:bazar_group_1/features/onboarding/presentation/widgets/onboarding_template.dart';
import '../../../../core/router/app_routes.dart';
import 'package:flutter/material.dart';
import '../../../../core/localization/generated/l10n.dart';

class OnboardingOne extends StatelessWidget {
  const OnboardingOne({super.key});
  @override
  Widget build(BuildContext context) {
    return OnboardingTemplate(
      imagePath: "assets/onboarding1.png",
      title: S.of(context).onboardingOneTitle,
      description: S.of(context).onboardingOneDescription,
      activeDotIndex: 0,
      firstButton: S.of(context).continueButton,
      secondButton: S.of(context).signInButton,
      onFirstButtonTap: () {
        Navigator.pushNamed(context, AppRoutes.onboardingTwo);
      },
      onSecondButtonTap: () {
        Navigator.pushNamed(context, AppRoutes.onboardingThree);
      },
      onSkip: () {
        Navigator.pushNamed(context, AppRoutes.onboardingThree);
      },
    );
  }
}
