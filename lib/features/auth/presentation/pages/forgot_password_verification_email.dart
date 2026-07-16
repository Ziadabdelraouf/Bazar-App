import 'package:flutter/material.dart';
import 'package:bazar_group_1/features/auth/domain/verification_type.dart';
import 'package:bazar_group_1/features/auth/presentation/pages/verification_code_screen.dart';

class ForgotPasswordVerificationEmail extends StatelessWidget {
  final String email;
  final VoidCallback onVerified;

  const ForgotPasswordVerificationEmail({
    super.key,
    required this.email,
    required this.onVerified,
  });

  @override
  Widget build(BuildContext context) {
    return VerificationCodeScreen(
      flow: VerificationFlow.forgotPassword,
      contactMethod: ContactMethod.email,
      contactValue: email,
      onVerified: onVerified,
    );
  }
}