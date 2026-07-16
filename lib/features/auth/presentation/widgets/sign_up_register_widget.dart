import 'package:bazar_group_1/core/components/buttons/large_primary_button.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:flutter/widgets.dart';

class SignUpRegisterWidget extends StatelessWidget {
  final VoidCallback registerButton;
  final VoidCallback? onSignInPressed;

  const SignUpRegisterWidget({
    super.key,
    required this.registerButton,
    this.onSignInPressed,
  });

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    return Column(
      spacing: 22,
      children: [
        LargePrimaryButton(
          label: localization.registerButton,
          onPressed: registerButton,
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
              onTap: onSignInPressed,
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
