import 'package:bazar_group_1/core/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:bazar_group_1/core/constants/enums.dart';
import 'package:bazar_group_1/core/components/buttons/large_primary_button.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_images.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key, required this.flow});
  final SuccessPageFlow flow;

  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    final isLoginFlow = flow == SuccessPageFlow.successfulLogin;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: screensize.height * 0.039,
          right: screensize.width * 0.07,
          left: screensize.width * 0.07,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.success),
            const SizedBox(height: 32),
            Text(
              isLoginFlow
                  ? S.of(context).congratulations
                  : S.of(context).PasswordChanged,
              style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                isLoginFlow
                    ? S.of(context).successBody
                    : S.of(context).PasswordChangedBody,
                style: AppTextStyles.body16Regular.copyWith(
                  color: AppColors.grey500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: screensize.width * 0.9,
              child: LargePrimaryButton(
                label: isLoginFlow
                    ? S.of(context).getStartedButton
                    : S.of(context).loginButton,
                onPressed: () {
                  if (isLoginFlow) {
                    // Navigate to home page but temporarily navigate to onboarding page to restart
                    Navigator.pushReplacementNamed(context, AppRoutes.homePage);
                  } else {
                    // Navigate to login page
                    Navigator.popUntil(
                      context,
                      ModalRoute.withName(AppRoutes.signInPage),
                    );
                  }
                },
                borderRadius: 12,
                height: screensize.height * 0.06,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
