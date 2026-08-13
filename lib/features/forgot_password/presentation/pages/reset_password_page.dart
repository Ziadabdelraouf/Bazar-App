import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/core/components/app_bars/app_back_bar.dart';
import 'package:bazar_group_1/core/components/inputs/app_text_form_field.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/router/app_routes.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/core/utils/firebase_error_utils.dart';
import 'package:bazar_group_1/features/auth/domain/validators/email_validator.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/auth_service_provider.dart';
import 'package:bazar_group_1/features/forgot_password/presentation/widgets/primary_button.dart';

class ResetPasswordPage extends ConsumerStatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  ConsumerState<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends ConsumerState<ResetPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _handleSendResetLink() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final email = _emailController.text.trim();
      final authService = ref.read(authServiceProvider);
      await authService.sendPasswordResetEmail(email);

      if (mounted) {
        Navigator.pushNamed(
          context,
          AppRoutes.forgotPasswordVerificationEmail,
          arguments: email,
        );
      }
    } catch (e) {
      if (mounted) {
        FirebaseErrorUtils.showErrorSnackBar(context, e);
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: const AppBackBar(),
        backgroundColor: colorScheme.surface,
        body: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * (24 / 375),
            right: MediaQuery.of(context).size.width * (24 / 375),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  localization.resetPasswordTitle,
                  style: AppTextStyles.h3.copyWith(color: colorScheme.onSurface),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * (8 / 812)),
                Text(
                  localization.resetPasswordEmailDescription,
                  style: AppTextStyles.body16Regular.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * (18 / 812)),
                const SizedBox(height: 8),

                AppFormTextField(
                  label: localization.emailLabel,
                  placeholder: localization.emailExamplePlaceholder,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    return validateEmail(
                      value,
                      emptyError: localization.emailRequired,
                      invalidError: localization.invalidEmail,
                    );
                  },
                ),

                const SizedBox(height: 64),

                _isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: colorScheme.primary,
                        ),
                      )
                    : PrimaryButton(
                        text: localization.sendButton,
                        onPressed: _handleSendResetLink,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
