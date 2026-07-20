import 'package:bazar_group_1/core/components/app_bars/app_back_bar.dart';
import 'package:bazar_group_1/core/components/inputs/app_text_field.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/forgot_password/domain/contact_method.dart';
import 'package:bazar_group_1/features/forgot_password/presentation/providers/contact_method_provider.dart';
import 'package:bazar_group_1/features/forgot_password/presentation/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/core/router/app_routes.dart';

class ResetPasswordPage extends ConsumerStatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  ConsumerState<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends ConsumerState<ResetPasswordPage> {
  final TextEditingController _contactController = TextEditingController();
  @override
  void dispose() {
    _contactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedMethod = ref.watch(selectedContactMethodProvider);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: const AppBackBar(),
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * (24 / 375),
              right: MediaQuery.of(context).size.width * (24 / 375),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reset password',
                  style: AppTextStyles.h3.copyWith(color: AppColors.grey900),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * (8 / 812),
                ),
                Text(
                  selectedMethod == ContactMethod.email
                      ? 'Please enter your email, we will send verification code to your email.'
                      : 'Please enter your phone number, we will send a verification code to your phone number.',
                  style: AppTextStyles.body16Regular.copyWith(
                    color: AppColors.grey600,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * (18 / 812),
                ),
                const SizedBox(height: 8),
                AppTextField(
                  label: selectedMethod == ContactMethod.email
                      ? 'Email'
                      : 'Phone Number',
                  placeholder: selectedMethod == ContactMethod.email
                      ? 'example@email.com'
                      : '(+965) 123 435 7565',
                  controller: _contactController,
                  keyboardType: selectedMethod == ContactMethod.email
                      ? TextInputType.emailAddress
                      : TextInputType.phone,
                  prefixIcon: selectedMethod == ContactMethod.phone
                      ? AppIcons.phoneFill
                      : null,
                ),
                const SizedBox(height: 64),
                PrimaryButton(
                  text: 'Send',
                  onPressed: () {
                    if (selectedMethod == ContactMethod.email) {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.forgotPasswordVerificationEmail,
                        arguments: _contactController.text,
                      );
                    } else {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.forgotPasswordVerificationPhone,
                        arguments: _contactController.text,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
