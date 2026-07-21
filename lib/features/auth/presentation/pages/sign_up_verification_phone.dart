import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/core/router/app_routes.dart';
import 'package:bazar_group_1/features/auth/domain/verification_type.dart';
import 'package:bazar_group_1/features/auth/presentation/pages/verification_code_screen.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/sign_up_provider.dart';

class SignUpVerificationPhone extends ConsumerWidget {
  final String phoneNumber;

  const SignUpVerificationPhone({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return VerificationCodeScreen(
      flow: VerificationFlow.signUp,
      contactMethod: ContactMethod.phone,
      contactValue: phoneNumber,
      onVerified: () {
        ref.read(signUpProvider.notifier).reset();
        Navigator.pushNamed(context, AppRoutes.successfulLogin);
      },
    );
  }
}