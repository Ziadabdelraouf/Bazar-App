import 'package:bazar_group_1/core/components/inputs/app_text_form_field.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/sign_up_provider.dart';
import 'package:bazar_group_1/features/auth/presentation/widgets/password_requirements_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpFormWigdet extends ConsumerWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignUpFormWigdet({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpState = ref.watch(signUpProvider);
    final signUpNotifier = ref.read(signUpProvider.notifier);
    final localization = S.of(context);

    return Column(
      spacing: 16,
      children: [
        AppFormTextField(
          label: localization.nameLabel,
          placeholder: localization.namePlaceholder,
          controller: nameController,
          textInputAction: TextInputAction.next,
          validator: (value) {
            final name = value?.trim() ?? '';

            if (name.isEmpty) {
              return localization.nameRequired;
            }

            if (name.length < 2) {
              return localization.nameMinimumLength;
            }

            return null;
          },
        ),
        AppFormTextField(
          label: localization.emailLabel,
          placeholder: localization.emailPlaceholder,
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          validator: (value) {
            final email = value?.trim() ?? '';

            if (email.isEmpty) {
              return localization.emailRequired;
            }

            final emailPattern = RegExp(
              r'^[\w\.-]+@[\w\.-]+\.[a-zA-Z]{2,}$',
            );

            if (!emailPattern.hasMatch(email)) {
              return localization.invalidEmail;
            }

            return null;
          },
        ),
        AppFormTextField(
          label: localization.passwordLabel,
          placeholder: localization.passwordPlaceholder,
          controller: passwordController,
          textInputAction: TextInputAction.done,
          obscureText: signUpState.obscurePassword,
          onChanged: signUpNotifier.validatePassword,
          validator: (value) {
            final password = value ?? '';

            if (password.isEmpty) {
              return localization.passwordRequired;
            }

            if (password.length < 8) {
              return localization.passwordMinimumLength;
            }

            if (!RegExp(r'[0-9]').hasMatch(password)) {
              return localization.passwordNumberRequired;
            }

            if (!RegExp(r'[a-zA-Z]').hasMatch(password)) {
              return localization.passwordLetterRequired;
            }

            return null;
          },
          suffixIcon: IconButton(
            onPressed: signUpNotifier.togglePasswordVisibility,
            icon: Icon(
              signUpState.obscurePassword
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
            ),
          ),
        ),
        if (signUpState.showPasswordRules)
          PasswordRequirementsWidget(
            hasMinimumLength: signUpState.hasMinimumLength,
            hasNumber: signUpState.hasNumber,
            hasLetter: signUpState.hasLetter,
          ),
      ],
    );
  }
}