import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/core/components/inputs/app_text_form_field.dart';
import 'package:bazar_group_1/core/components/buttons/large_primary_button.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/router/app_routes.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/auth/domain/validators/email_validator.dart';
import 'package:bazar_group_1/features/auth/domain/validators/password_validator.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/sign_in_provider.dart';

class SignInFormWidget extends ConsumerWidget {
  const SignInFormWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInState = ref.watch(signInProvider);
    final signInNotifier = ref.read(
      signInProvider.notifier,
    );
    final localization = S.of(context);

    return Form(
      key: signInNotifier.formKey,
      autovalidateMode: signInState.autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppFormTextField(
            label: localization.emailLabel,
            placeholder: localization.emailPlaceholder,
            controller: signInNotifier.emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            onChanged: (value) =>
                signInNotifier.clearEmailError(),
            validator: (value) {
              return signInState.emailError ??
                  validateEmail(
                    value,
                    emptyError: localization.emailRequired,
                    invalidError: localization.invalidEmail,
                  );
            },
          ),
          const SizedBox(height: 16),
          AppFormTextField(
            label: localization.passwordLabel,
            placeholder: localization.passwordPlaceholder,
            controller: signInNotifier.passwordController,
            obscureText: signInState.obscurePassword,
            textInputAction: TextInputAction.done,
            suffixIcon: IconButton(
              onPressed:
                  signInNotifier.togglePasswordVisibility,
              icon: Icon(
                signInState.obscurePassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
            ),
            onChanged: (value) =>
                signInNotifier.clearPasswordError(),
            validator: (value) {
              return signInState.passwordError ??
                  validatePassword(
                    value,
                    emptyError:
                        localization.passwordRequired,
                    minimumLengthError:
                        localization.passwordMinimumLength,
                    numberRequiredError:
                        localization.passwordNumberRequired,
                    letterRequiredError:
                        localization.passwordLetterRequired,
                    isSignUp: false,
                  );
            },
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRoutes.forgotPasswordPage,
              );
            },
            style: TextButton.styleFrom(
              alignment: Alignment.centerLeft,
            ),
            child: Text(
              localization.forgotPasswordButton,
              style: AppTextStyles.body14SemiBold.copyWith(
                color: AppColors.primary600,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(height: 16),
          signInState.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary500,
                  ),
                )
              : LargePrimaryButton(
                  label: localization.loginButton,
                  onPressed: () async {
                    final success = await signInNotifier
                        .login(
                          emailRequired:
                              localization.emailRequired,
                          invalidEmail:
                              localization.invalidEmail,
                          passwordRequired:
                              localization.passwordRequired,
                          passwordMinimumLength:
                              localization
                                  .passwordMinimumLength,
                          passwordNumberRequired:
                              localization
                                  .passwordNumberRequired,
                          passwordLetterRequired:
                              localization
                                  .passwordLetterRequired,
                        );
                    if (success && context.mounted) {
                      ref.read(signInProvider.notifier).reset();
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.onboardingPage,
                      );
                    }
                  },
                ),
        ],
      ),
    );
  }
}
