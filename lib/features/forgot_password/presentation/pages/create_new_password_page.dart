import 'package:bazar_group_1/core/components/app_bars/app_back_bar.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/forgot_password/presentation/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:bazar_group_1/core/components/inputs/app_text_field.dart';

class CreateNewPasswordPage extends StatefulWidget {
  const CreateNewPasswordPage({super.key});

  @override
  State<CreateNewPasswordPage> createState() => _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends State<CreateNewPasswordPage> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: const AppBackBar(),
          body: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * (24 / 375),
              right: MediaQuery.of(context).size.width * (24 / 375),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New password',
                  style: AppTextStyles.h3.copyWith(color: AppColors.grey900),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * (8 / 812),
                ),
                Text(
                  'Create your new password, so you can login to your account',
                  style: AppTextStyles.body16Regular.copyWith(
                    color: AppColors.grey600,
                  ),
                ),
                const SizedBox(height: 8),
                AppTextField(
                  label: 'New Password',
                  placeholder: 'Your password',
                  controller: _newPasswordController,
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  label: 'Confirm Password',
                  placeholder: 'Your password',
                  controller: _confirmPasswordController,
                  obscureText: true,
                ),
                const SizedBox(height: 32),
                PrimaryButton(text: 'Send', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
