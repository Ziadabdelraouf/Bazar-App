import 'package:bazar_group_1/core/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:bazar_group_1/core/constants/enums.dart';
import 'package:bazar_group_1/core/components/buttons/large_primary_button.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/theme/app_images.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key, required this.flow});
  final SuccessPageFlow flow;

  @override
  Widget build(BuildContext context) {
    final isLoginFlow = flow == SuccessPageFlow.successfulLogin;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom -
                  48,
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
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    isLoginFlow
                        ? S.of(context).successBody
                        : S.of(context).PasswordChangedBody,
                    style: AppTextStyles.body16Regular.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: LargePrimaryButton(
                    label: isLoginFlow
                        ? S.of(context).getStartedButton
                        : S.of(context).loginButton,
                    onPressed: () {
                      if (isLoginFlow) {
                        Navigator.pushReplacementNamed(context, AppRoutes.homePage);
                      } else {
                        Navigator.popUntil(
                          context,
                          ModalRoute.withName(AppRoutes.signInPage),
                        );
                      }
                    },
                    borderRadius: 12,
                    height: 48,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}