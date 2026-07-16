import 'package:flutter/material.dart';
import 'package:bazar_group_1/features/auth/domain/verification_type.dart';
import 'package:bazar_group_1/features/auth/presentation/pages/verification_code_screen.dart';
import 'package:bazar_group_1/features/auth/presentation/pages/phone_number_input_screen.dart';
import 'package:bazar_group_1/features/auth/presentation/pages/sign_up_verification_phone.dart';

/// Entry point for the Sign Up verification sequence: verifies the email
/// the user signed up with, then automatically continues to phone number
/// collection and phone verification.
///
/// Only [onAllVerified] needs to be provided — called once the entire
/// sequence (email verify → phone input → phone verify) completes.
class SignUpVerificationEmail extends StatelessWidget {
  final String email;
  final VoidCallback onAllVerified;

  const SignUpVerificationEmail({
    super.key,
    required this.email,
    required this.onAllVerified,
  });

  @override
  Widget build(BuildContext context) {
    return VerificationCodeScreen(
      flow: VerificationFlow.signUp,
      contactMethod: ContactMethod.email,
      contactValue: email,
      onVerified: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PhoneNumberInputScreen(
              onSubmitted: (phoneNumber) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SignUpVerificationPhone(
                      phoneNumber: phoneNumber,
                      onVerified: onAllVerified,
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}