import 'package:bazar_group_1/core/components/app_bars/app_back_bar.dart';
import 'package:flutter/material.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/features/auth/presentation/widgets/sign_in_header_widget.dart';
import 'package:bazar_group_1/features/auth/presentation/widgets/sign_in_form_widget.dart';
import 'package:bazar_group_1/features/auth/presentation/widgets/sign_in_social_widget.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBackBar(),
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      body: const Padding(
        padding: EdgeInsets.only(
          left: 24.0,
          right: 24.0,
          top: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SignInHeaderWidget(),
              SizedBox(height: 24),
              SignInFormWidget(),
              SizedBox(height: 16),
              SignInSocialWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
