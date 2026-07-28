import 'package:bazar_group_1/core/components/app_bars/app_back_bar.dart';
import 'package:bazar_group_1/core/components/inputs/app_text_form_field.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/router/app_routes.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/auth/domain/validators/password_validator.dart';
import 'package:bazar_group_1/features/auth/presentation/widgets/password_requirements_widget.dart';
import 'package:bazar_group_1/features/forgot_password/presentation/providers/create_new_password_provider.dart';
import 'package:bazar_group_1/features/forgot_password/presentation/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateNewPasswordPage extends ConsumerStatefulWidget {
  const CreateNewPasswordPage({super.key});

  @override
  ConsumerState<CreateNewPasswordPage> createState() =>
      _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState
    extends ConsumerState<CreateNewPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    final notifier = ref.read(
      createNewPasswordProvider.notifier,
    );
    final state = ref.watch(createNewPasswordProvider);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: const AppBackBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left:
                  MediaQuery.of(context).size.width *
                  (24 / 375),
              right:
                  MediaQuery.of(context).size.width *
                  (24 / 375),
            ),
            child: Form(
              key: notifier.formKey,
              autovalidateMode:
                  AutovalidateMode.onUserInteractionIfError,
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    localization.createNewPasswordTitle,
                    style: AppTextStyles.h3.copyWith(
                      color: AppColors.grey900,
                    ),
                  ),
                  SizedBox(
                    height:
                        MediaQuery.of(context).size.height *
                        (8 / 812),
                  ),
                  Text(
                    localization
                        .createNewPasswordDescription,
                    style: AppTextStyles.body16Regular
                        .copyWith(color: AppColors.grey600),
                  ),
                  const SizedBox(height: 8),

                  AppFormTextField(
                    label: localization.newPasswordLabel,
                    placeholder:
                        localization.passwordPlaceholder,
                    controller:
                        notifier.newPasswordController,
                    obscureText: state.obscureNewPassword,
                    textInputAction: TextInputAction.next,
                    onChanged: notifier.validatePassword,
                    showErrorBorder: false,
                    showErrorText: false,
                    validator: (value) {
                      return validatePassword(
                        value,
                        emptyError:
                            localization.passwordRequired,
                        minimumLengthError: localization
                            .passwordMinimumLength,
                        numberRequiredError: localization
                            .passwordNumberRequired,
                        letterRequiredError: localization
                            .passwordLetterRequired,
                      );
                    },
                    suffixIcon: IconButton(
                      onPressed: notifier
                          .toggleNewPasswordVisibility,
                      icon: Icon(
                        state.obscureNewPassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                    ),
                  ),

                  if (state.showPasswordRules) ...[
                    const SizedBox(height: 12),
                    PasswordRequirementsWidget(
                      hasMinimumLength:
                          state.hasMinimumLength,
                      hasNumber: state.hasNumber,
                      hasLetter: state.hasLetter,
                    ),
                  ],

                  const SizedBox(height: 16),

                  AppFormTextField(
                    label:
                        localization.confirmPasswordLabel,
                    placeholder:
                        localization.passwordPlaceholder,
                    controller:
                        notifier.confirmPasswordController,
                    obscureText:
                        state.obscureConfirmPassword,
                    textInputAction: TextInputAction.done,
                    validator: (value) {
                      final confirmPassword = value ?? '';

                      if (confirmPassword.isEmpty) {
                        return localization
                            .confirmPasswordRequired;
                      }

                      if (confirmPassword !=
                          notifier
                              .newPasswordController
                              .text) {
                        return localization
                            .passwordsDoNotMatch;
                      }

                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: notifier
                          .toggleConfirmPasswordVisibility,
                      icon: Icon(
                        state.obscureConfirmPassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),
                  PrimaryButton(
                    text: localization.sendButton,
                    onPressed: () {
                      final isValid = notifier.submit();
                      if (isValid) {
                        // TODO: call the reset-password API
                        Navigator.of(
                          context,
                        ).pushReplacementNamed(
                          AppRoutes.passwordChange,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
