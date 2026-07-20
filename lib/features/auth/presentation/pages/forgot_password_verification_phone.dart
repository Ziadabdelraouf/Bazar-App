import 'package:flutter/material.dart';
import 'package:bazar_group_1/core/router/app_routes.dart';
import 'package:bazar_group_1/features/auth/domain/verification_type.dart';
import 'package:bazar_group_1/features/auth/presentation/pages/verification_code_screen.dart';

class ForgotPasswordVerificationPhone extends StatelessWidget {
  final String phoneNumber;

  const ForgotPasswordVerificationPhone({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return VerificationCodeScreen(
      flow: VerificationFlow.forgotPassword,
      contactMethod: ContactMethod.phone,
      contactValue: phoneNumber,
      onVerified: () {
        // TODO: once teammate builds real New Password screen,
        // update this to their actual registered route name.
      },
    );
  }
}