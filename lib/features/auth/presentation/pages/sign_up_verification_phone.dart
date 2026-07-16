import 'package:flutter/material.dart';
import 'package:bazar_group_1/features/auth/domain/verification_type.dart';
import 'package:bazar_group_1/features/auth/presentation/pages/verification_code_screen.dart';

class SignUpVerificationPhone extends StatelessWidget {
  final String phoneNumber;
  final VoidCallback onVerified;

  const SignUpVerificationPhone({
    super.key,
    required this.phoneNumber,
    required this.onVerified,
  });

  @override
  Widget build(BuildContext context) {
    return VerificationCodeScreen(
      flow: VerificationFlow.signUp,
      contactMethod: ContactMethod.phone,
      contactValue: phoneNumber,
      onVerified: onVerified,
    );
  }
}