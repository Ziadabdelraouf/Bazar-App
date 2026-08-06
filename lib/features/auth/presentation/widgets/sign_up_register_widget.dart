import 'package:bazar_group_1/core/components/buttons/large_primary_button.dart';
import 'package:bazar_group_1/core/router/app_routes.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/core/utils/firebase_error_utils.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/sign_up_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpRegisterWidget extends ConsumerWidget {
  const SignUpRegisterWidget({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = S.of(context);
    final signUpState = ref.watch(signUpProvider);
    final signUpNotifier = ref.read(signUpProvider.notifier);
    return Column(
      spacing: 22,
      children: [
        LargePrimaryButton(
          label: localization.registerButton,
          isLoading: signUpState.isLoading,
          onPressed: () async {
            final isValid = signUpNotifier.register(formKey);
            if (!isValid) {
              return;
            }
            try {
              await signUpNotifier.handleSignUp();
              if (context.mounted) {
                Navigator.pushNamed(
                  context,
                  AppRoutes.signUpVerificationEmail,
                  arguments: signUpNotifier.emailController.text,
                );
              }
            } catch (e) {
              if (context.mounted) {
                FirebaseErrorUtils.showErrorSnackBar(context, e);
              }
            }
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${localization.haveAccount} ',
              style: AppTextStyles.body16Medium.copyWith(
                color: AppColors.grey500,
              ),
            ),
            GestureDetector(
              onTap: () {
                final arguments = ModalRoute.of(context)?.settings.arguments;
                if (arguments is Map &&
                    arguments['from'] == AppRoutes.signInPage) {
                  Navigator.pop(context);
                } else {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.signInPage,
                    arguments: {'from': AppRoutes.signUpPage},
                  );
                }
              },
              child: Text(
                localization.signInButton,
                style: AppTextStyles.body16Medium.copyWith(
                  color: AppColors.primary500,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
