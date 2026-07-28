import 'package:bazar_group_1/core/components/app_bars/app_back_bar.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/forgot_password/domain/contact_method.dart';
import 'package:bazar_group_1/features/forgot_password/presentation/pages/reset_password_page.dart';
import 'package:bazar_group_1/features/forgot_password/presentation/widgets/contact_method_card.dart';
import 'package:bazar_group_1/features/forgot_password/presentation/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:bazar_group_1/features/forgot_password/presentation/providers/contact_method_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ForgotPasswordPage> createState() =>
      _ForgotPasswordPageState();
}

class _ForgotPasswordPageState
    extends ConsumerState<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    final selectedMethod = ref.watch(
      selectedContactMethodProvider,
    );

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBackBar(),
      body: Padding(
        padding: EdgeInsets.only(
          left:
              MediaQuery.of(context).size.width *
              (24 / 375),
          right:
              MediaQuery.of(context).size.width *
              (24 / 375),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localization.forgotPasswordTitle,
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
              localization.forgotPasswordDescription,
              style: AppTextStyles.body16Regular.copyWith(
                color: AppColors.grey600,
              ),
            ),
            SizedBox(
              height:
                  MediaQuery.of(context).size.height *
                  (16 / 812),
            ),
            Row(
              children: [
                Expanded(
                  child: ContactMethodCard(
                    iconPath: AppIcons.emailBulk,
                    title: localization
                        .contactMethodEmailTitle,
                    subtitle: localization
                        .contactMethodEmailSubtitle,
                    isSelected:
                        selectedMethod ==
                        ContactMethod.email,
                    onTap: () {
                      ref
                          .read(
                            selectedContactMethodProvider
                                .notifier,
                          )
                          .state = ContactMethod
                          .email;
                    },
                  ),
                ),
                SizedBox(
                  width:
                      MediaQuery.of(context).size.width *
                      (16 / 375),
                ),
                Expanded(
                  child: ContactMethodCard(
                    iconPath: AppIcons.phoneFill,
                    title: localization
                        .contactMethodPhoneTitle,
                    subtitle: localization
                        .contactMethodPhoneSubtitle,
                    isSelected:
                        selectedMethod ==
                        ContactMethod.phone,
                    onTap: () {
                      ref
                          .read(
                            selectedContactMethodProvider
                                .notifier,
                          )
                          .state = ContactMethod
                          .phone;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 64),
            PrimaryButton(
              text: localization.continueButton,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const ResetPasswordPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
