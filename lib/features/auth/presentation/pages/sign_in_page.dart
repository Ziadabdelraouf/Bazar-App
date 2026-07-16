import 'package:bazar_group_1/core/components/buttons/large_primary_button.dart';
import 'package:bazar_group_1/core/components/inputs/app_text_field.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/auth/presentation/widgets/oauth_signin_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // will be replaced with the reusable back button component once it's implemented
            IconButton(
              onPressed: () {
                //Navigator.pop(context);
              },
              alignment: AlignmentGeometry.topLeft,
              icon: Icon(Icons.arrow_back),
            ),
            Text(
              S.of(context).welcomeBackTitle + "👋",
              style: AppTextStyles.h3,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 16),
            Text(
              S.of(context).signInSubtitle,
              style: AppTextStyles.body16Regular.copyWith(
                color: AppColors.grey500,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 32),
            AppTextField(
              label: S.of(context).emailLabel,
              placeholder: S.of(context).emailPlaceholder,
              controller: emailController,
            ),
            AppTextField(
              label: S.of(context).passwordLabel,
              placeholder: S.of(context).passwordPlaceholder,
              controller: passwordController,
              obscureText: true,
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(alignment: Alignment.centerLeft),
              child: Text(
                S.of(context).forgotPasswordButton,
                style: AppTextStyles.body16Regular.copyWith(
                  color: AppColors.primary600,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(height: 16),
            LargePrimaryButton(
              label: S.of(context).loginButton,
              onPressed: () {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).dontHaveAccountText,
                  style: AppTextStyles.body16Regular.copyWith(
                    color: AppColors.grey500,
                  ),
                ),

                TextButton(
                  onPressed: () {
                    //Navigator.pushReplacementNamed(context,  AppRoutes.signupPage);
                  },
                  child: Text(
                    S.of(context).signUpButton,
                    style: AppTextStyles.body16Regular.copyWith(
                      color: AppColors.primary600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(child: Divider(color: AppColors.grey200)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    S.of(context).orSeparator,
                    style: AppTextStyles.body16Regular.copyWith(
                      color: AppColors.grey500,
                    ),
                  ),
                ),
                Expanded(child: Divider(color: AppColors.grey200)),
              ],
            ),
            SizedBox(height: 24),
            OAuthSignInButton(
              onPressed: () {},
              text: S.of(context).signInWithGoogleButton,
              icon: SvgPicture.asset(
                'assets/icons/google_logo.svg',
                height: 16,
                width: 16,
              ),
              backgroundColor: Colors.white,
              textColor: Colors.black87,
              borderColor: AppColors.grey200,
            ),
            SizedBox(height: 16),
            OAuthSignInButton(
              onPressed: () {},
              text: S.of(context).signInWithAppleButton,
              icon: SvgPicture.asset(
                'assets/icons/apple_logo.svg',
                height: 16,
                width: 16,
              ),
              backgroundColor: Colors.white,
              textColor: Colors.black87,
              borderColor: AppColors.grey200,
            ),
          ],
        ),
      ),
    );
  }
}
