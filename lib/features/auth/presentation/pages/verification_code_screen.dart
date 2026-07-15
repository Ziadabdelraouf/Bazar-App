import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/auth/domain/verification_type.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/verification_code_notifier.dart';
import 'package:bazar_group_1/features/auth/presentation/widgets/code_input_boxes.dart';
import 'package:bazar_group_1/features/auth/presentation/widgets/auth_screen_template.dart';

class VerificationCodeScreen extends ConsumerWidget {
  final VerificationFlow flow;
  final ContactMethod contactMethod;
  final String contactValue;

  const VerificationCodeScreen({
    super.key,
    required this.flow,
    required this.contactMethod,
    required this.contactValue,
  });

  String _getTitle() {
    if (flow == VerificationFlow.forgotPassword) {
      return 'Verification Code';
    }
    return contactMethod == ContactMethod.email
        ? 'Verification Email'
        : 'Verification Phone';
  }

  String _getDescriptionPrefix() {
    return contactMethod == ContactMethod.email
        ? 'Please enter the code we just sent to email '
        : 'Please enter the code we just sent to phone number ';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(verificationCodeNotifierProvider);
    final isSignUp = flow == VerificationFlow.signUp;

    return AuthScreenTemplate(
      title: _getTitle(),
      description: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: AppTextStyles.body16Regular.copyWith(color: AppColors.grey500),
          children: [
            TextSpan(text: _getDescriptionPrefix()),
            TextSpan(
              text: contactValue,
              style: const TextStyle(color: AppColors.grey900),
            ),
          ],
        ),
      ),
      middleContent: Column(
        children: [
          const CodeInputBoxes(),
          const SizedBox(height: 16),
          Center(
            child: RichText(
              text: TextSpan(
                style: AppTextStyles.body14SemiBold.copyWith(color: AppColors.grey500),
                children: [
                  const TextSpan(text: "If you didn't receive a code? "),
                  TextSpan(
                    text: 'Resend',
                    style: const TextStyle(color: AppColors.primary500),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        ref.read(verificationCodeNotifierProvider.notifier).resendCode();
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      errorMessage: state.errorMessage,
      isLoading: state.isLoading,
      onContinuePressed: () {
        ref.read(verificationCodeNotifierProvider.notifier).submitCode();
      },
      keypadBackgroundColor: isSignUp ? AppColors.primary500 : AppColors.grey50,
      keypadForegroundColor: isSignUp ? AppColors.grey50 : AppColors.grey900,
      onDigitPressed: (digit) {
        ref.read(verificationCodeNotifierProvider.notifier).enterDigitFromKeypad(digit);
      },
      onDeletePressed: () {
        ref.read(verificationCodeNotifierProvider.notifier).deleteDigitFromKeypad();
      },
    );
  }
}