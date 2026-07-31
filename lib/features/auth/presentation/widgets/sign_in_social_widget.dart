import 'package:flutter/material.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/router/app_routes.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/auth/presentation/widgets/oauth_signin_button.dart';

class SignInSocialWidget extends StatelessWidget {
  const SignInSocialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                final arguments = ModalRoute.of(context)?.settings.arguments;
                if (arguments is Map && arguments['from'] == AppRoutes.signUpPage) {
                  Navigator.pop(context);
                } else {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.signUpPage,
                    arguments: {'from': AppRoutes.signInPage},
                  );
                }
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
        const SizedBox(height: 16),
        Row(
          children: [
            const Expanded(
              child: Divider(color: AppColors.grey200),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: Text(
                S.of(context).orSeparator,
                style: AppTextStyles.body16Regular.copyWith(
                  color: AppColors.grey500,
                ),
              ),
            ),
            const Expanded(
              child: Divider(color: AppColors.grey200),
            ),
          ],
        ),
        const SizedBox(height: 24),
        OAuthSignInButton(
          onPressed: () {},
          text: S.of(context).signInWithGoogleButton,
          icon: AppIcons.googleLogo,
        ),
        const SizedBox(height: 16),
        OAuthSignInButton(
          onPressed: () {},
          text: S.of(context).signInWithAppleButton,
          icon: AppIcons.appleLogo,
        ),
      ],
    );
  }
}
