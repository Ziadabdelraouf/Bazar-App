import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/core/components/navigation/app_back_button.dart';
import 'package:bazar_group_1/core/components/buttons/large_primary_button.dart';
import 'package:bazar_group_1/features/auth/domain/verification_type.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/verification_code_notifier.dart';
import 'package:bazar_group_1/features/auth/presentation/widgets/code_input_boxes.dart';
import 'package:bazar_group_1/features/auth/presentation/widgets/numeric_keypad.dart';

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
    final keypadBackgroundColor = isSignUp ? AppColors.primary500 : AppColors.grey50;
    final keypadForegroundColor = isSignUp ? AppColors.grey50 : AppColors.grey900;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppBackButton(),
                    const SizedBox(height: 24),
                    Center(
                      child: SizedBox(
                        width: 327,
                        child: Column(
                          children: [
                            Text(
                              _getTitle(),
                              textAlign: TextAlign.center,
                              style: AppTextStyles.h3.copyWith(color: AppColors.grey900),
                            ),
                            const SizedBox(height: 8),
                            RichText(
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
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    const CodeInputBoxes(),
                    if (state.errorMessage != null) ...[
                      const SizedBox(height: 8),
                      Center(
                        child: Text(
                          state.errorMessage!,
                          style: AppTextStyles.body14Regular.copyWith(color: AppColors.red),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
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
                    const Spacer(),
                    state.isLoading
                        ? const Center(
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          )
                        : LargePrimaryButton(
                            label: 'Continue',
                            onPressed: () {
                              ref.read(verificationCodeNotifierProvider.notifier).submitCode();
                            },
                          ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            NumericKeypad(
              backgroundColor: keypadBackgroundColor,
              foregroundColor: keypadForegroundColor,
              onDigitPressed: (digit) {
                ref.read(verificationCodeNotifierProvider.notifier).enterDigitFromKeypad(digit);
              },
              onDeletePressed: () {
                ref.read(verificationCodeNotifierProvider.notifier).deleteDigitFromKeypad();
              },
            ),
          ],
        ),
      ),
    );
  }
}