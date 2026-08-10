import 'package:bazar_group_1/core/components/app_bars/app_back_bar.dart';
import 'package:bazar_group_1/core/components/buttons/large_primary_button.dart';
import 'package:bazar_group_1/core/components/inputs/app_text_form_field.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';
import 'package:bazar_group_1/features/auth/domain/validators/email_validator.dart';
import 'package:bazar_group_1/features/auth/domain/validators/password_validator.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/name_notifier_provider.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/phone_number_notifier.dart';
import 'package:bazar_group_1/features/profile/presentation/providers/my_account_provider.dart';
import 'package:bazar_group_1/features/profile/presentation/widgets/profile_avatar_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAccountPage extends ConsumerStatefulWidget {
  const MyAccountPage({super.key});

  @override
  ConsumerState<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends ConsumerState<MyAccountPage> {
  @override
  void initState() {
    super.initState();

    final notifier = ref.read(myAccountProvider.notifier);

    final name = ref.read(nameNotifierProvider);
    final phoneState = ref.read(phoneNumberNotifierProvider);

    notifier.loadInitialData(name: name, email: '', phone: phoneState.digits);
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(myAccountProvider.notifier);
    final state = ref.watch(myAccountProvider);
    final localization = S.of(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBackBar(title: localization.myAccountTitle),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Form(
              key: notifier.formKey,
              autovalidateMode: AutovalidateMode.onUserInteractionIfError,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Center(child: ProfileAvatarEdit()),
                  const SizedBox(height: 24),

                  AppFormTextField(
                    label: localization.nameLabel,
                    placeholder: localization.namePlaceholder,
                    controller: notifier.nameController,
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
                  const SizedBox(height: 16),

                  AppFormTextField(
                    label: localization.emailLabel,
                    placeholder: localization.emailPlaceholder,
                    controller: notifier.emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      return validateEmail(
                        value,
                        emptyError: localization.emailRequired,
                        invalidError: localization.invalidEmail,
                      );
                    },
                  ),
                  const SizedBox(height: 16),

                  AppFormTextField(
                    label: localization.phoneNumberLabel,
                    placeholder: localization.phoneNumberPlaceholder,
                    controller: notifier.phoneController,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    prefixIcon: Padding(
                      padding: const EdgeInsetsGeometry.all(12),
                      child: SvgPicture.asset(
                        AppIcons.phoneOutline,
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    validator: (value) {
                      return notifier.validatePhone(
                        value,
                        emptyError: localization.emptyPhoneNumberError,
                        invalidError: localization.invalidPhoneNumberError,
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  AppFormTextField(
                    label: localization.passwordLabel,
                    placeholder: localization.passwordPlaceholder,
                    controller: notifier.passwordController,
                    textInputAction: TextInputAction.done,
                    obscureText: state.obscurePassword,
                    onChanged: notifier.validatePassword,
                    showErrorBorder: false,
                    showErrorText: false,
                    validator: (value) {
                      return validatePassword(
                        value,
                        emptyError: localization.passwordRequired,
                        minimumLengthError: localization.passwordMinimumLength,
                        numberRequiredError:
                            localization.passwordNumberRequired,
                        letterRequiredError:
                            localization.passwordLetterRequired,
                      );
                    },
                    suffixIcon: IconButton(
                      onPressed: notifier.toggleObscurePassword,
                      icon: Icon(
                        state.obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),
                  LargePrimaryButton(
                    label: localization.saveChangesButton,
                    onPressed: () async {
                      final isValid = await notifier.submit();
                      if (isValid && context.mounted) {
                        // TODO: show success feedback (snackbar/toast)
                      }
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
