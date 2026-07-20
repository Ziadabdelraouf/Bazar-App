import 'package:bazar_group_1/core/components/buttons/large_primary_button.dart';
import 'package:bazar_group_1/core/components/inputs/app_text_field.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/router/app_router.dart';
import 'package:bazar_group_1/core/router/app_routes.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/auth/presentation/widgets/oauth_signin_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.white),
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${S.of(context).welcomeBackTitle}👋',
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
            SizedBox(height: 24),
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
            // SizedBox(height: 16),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(alignment: Alignment.centerLeft),
              child: Text(
                S.of(context).forgotPasswordButton,
                style: AppTextStyles.body14SemiBold.copyWith(
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
            SizedBox(height: 16),
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
              icon: 'assets/icons/google_logo.svg',
            ),
            SizedBox(height: 16),
            OAuthSignInButton(
              onPressed: () {},
              text: S.of(context).signInWithAppleButton,
              icon: 'assets/icons/apple_logo.svg',
            ),
          ],
        ),
      ),
    );
  }
}
