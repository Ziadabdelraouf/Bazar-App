import 'package:flutter/material.dart';
import 'package:bazar_group_1/core/components/inputs/app_text_form_field.dart';
import 'package:bazar_group_1/core/components/buttons/large_primary_button.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/router/app_routes.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/auth/domain/validators/email_validator.dart';
import 'package:bazar_group_1/features/auth/domain/validators/password_validator.dart';

class SignInFormWidget extends StatefulWidget {
  const SignInFormWidget({super.key});

  @override
  State<SignInFormWidget> createState() =>
      _SignInFormWidgetState();
}

class _SignInFormWidgetState
    extends State<SignInFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController =
      TextEditingController();
  final TextEditingController passwordController =
      TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;
  String? _emailError;
  String? _passwordError;
  AutovalidateMode _autovalidateMode =
      AutovalidateMode.onUserInteractionIfError;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<bool> _handleLogin() async {
    //later this will have auth calls from api,etc
    final emailRequired = S.of(context).emailRequired;
    final invalidEmail = S.of(context).invalidEmail;
    final passwordRequired = S.of(context).passwordRequired;
    final passwordMinimumLength = S
        .of(context)
        .passwordMinimumLength;
    final passwordNumberRequired = S
        .of(context)
        .passwordNumberRequired;
    final passwordLetterRequired = S
        .of(context)
        .passwordLetterRequired;

    setState(() {
      _emailError = null;
      _passwordError = null;
    });

    await Future.delayed(const Duration(seconds: 2));

    final password = passwordController.text;
    final email = emailController.text;

    final emailValResult = validateEmail(
      email,
      emptyError: emailRequired,
      invalidError: invalidEmail,
    );
    if (emailValResult != null) {
      setState(() => _emailError = emailValResult);
      if (mounted) {
        _formKey.currentState?.validate();
      }
      return false;
    }

    final passwordValResult = validatePassword(
      password,
      emptyError: passwordRequired,
      minimumLengthError: passwordMinimumLength,
      numberRequiredError: passwordNumberRequired,
      letterRequiredError: passwordLetterRequired,
      isSignUp: false,
    );
    if (passwordValResult != null) {
      setState(() => _passwordError = passwordValResult);
      if (mounted) {
        _formKey.currentState?.validate();
      }
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppFormTextField(
            label: S.of(context).emailLabel,
            placeholder: S.of(context).emailPlaceholder,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            onChanged: (value) {
              if (_emailError != null) {
                setState(() => _emailError = null);
              }
            },
            validator: (value) {
              return _emailError ??
                  validateEmail(
                    value,
                    emptyError: S.of(context).emailRequired,
                    invalidError: S
                        .of(context)
                        .invalidEmail,
                  );
            },
          ),
          const SizedBox(height: 16),
          AppFormTextField(
            label: S.of(context).passwordLabel,
            placeholder: S.of(context).passwordPlaceholder,
            controller: passwordController,
            obscureText: _obscurePassword,
            textInputAction: TextInputAction.done,
            suffixIcon: IconButton(
              onPressed: () => setState(
                () => _obscurePassword = !_obscurePassword,
              ),
              icon: Icon(
                _obscurePassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
            ),
            onChanged: (value) {
              if (_passwordError != null) {
                setState(() => _passwordError = null);
              }
            },
            validator: (value) {
              return _passwordError ??
                  validatePassword(
                    value,
                    emptyError: S
                        .of(context)
                        .passwordRequired,
                    minimumLengthError: S
                        .of(context)
                        .passwordMinimumLength,
                    numberRequiredError: S
                        .of(context)
                        .passwordNumberRequired,
                    letterRequiredError: S
                        .of(context)
                        .passwordLetterRequired,
                    isSignUp: false,
                  );
            },
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              alignment: Alignment.centerLeft,
            ),
            child: Text(
              S.of(context).forgotPasswordButton,
              style: AppTextStyles.body14SemiBold.copyWith(
                color: AppColors.primary600,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(height: 16),
          _isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary500,
                  ),
                )
              : LargePrimaryButton(
                  label: S.of(context).loginButton,
                  onPressed: () async {
                    setState(() {
                      _autovalidateMode = AutovalidateMode
                          .onUserInteraction;
                      _emailError = null;
                      _passwordError = null;
                    });
                    if (_formKey.currentState?.validate() ??
                        false) {
                      setState(() => _isLoading = true);
                      final success = await _handleLogin();
                      setState(() => _isLoading = false);
                      if (success && context.mounted) {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.onboardingPage,
                        );
                      }
                    }
                  },
                ),
        ],
      ),
    );
  }
}
