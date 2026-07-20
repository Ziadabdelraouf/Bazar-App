import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/features/auth/domain/verification_type.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/verification_code_notifier.dart';
import 'package:bazar_group_1/features/auth/presentation/widgets/code_input_boxes.dart';
import 'package:bazar_group_1/features/auth/presentation/widgets/auth_screen_template.dart';

class VerificationCodeScreen extends ConsumerStatefulWidget {
  final VerificationFlow flow;
  final ContactMethod contactMethod;
  final String contactValue;
  final VoidCallback onVerified;

  const VerificationCodeScreen({
    super.key,
    required this.flow,
    required this.contactMethod,
    required this.contactValue,
    required this.onVerified,
  });

  @override
  ConsumerState<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends ConsumerState<VerificationCodeScreen> {
  bool _isResending = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.invalidate(verificationCodeNotifierProvider);
    });
  }

  String _getTitle(S s) {
    if (widget.flow == VerificationFlow.forgotPassword) {
      return s.verificationCodeTitle;
    }
    return widget.contactMethod == ContactMethod.email
        ? s.verificationEmailTitle
        : s.verificationPhoneTitle;
  }

  String _getDescriptionPrefix(S s) {
    return widget.contactMethod == ContactMethod.email
        ? s.verificationSentToEmail
        : s.verificationSentToPhone;
  }

  Future<void> _handleResend() async {
    setState(() => _isResending = true);
    await ref.read(verificationCodeNotifierProvider.notifier).resendCode();
    if (mounted) {
      setState(() => _isResending = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(S.of(context).codeResentMessage)),
      );
    }
  }

  Future<void> _handleContinue() async {
    await ref.read(verificationCodeNotifierProvider.notifier).submitCode();
    final hasError = ref.read(verificationCodeNotifierProvider).hasError;
    if (!hasError) {
      widget.onVerified();
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final state = ref.watch(verificationCodeNotifierProvider);
    final isSignUp = widget.flow == VerificationFlow.signUp;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        ref.read(verificationCodeNotifierProvider.notifier).setFocused(false);
      },
      child: AuthScreenTemplate(
        title: _getTitle(s),
        description: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: AppTextStyles.body16Regular.copyWith(color: AppColors.grey500),
            children: [
              TextSpan(text: _getDescriptionPrefix(s)),
              TextSpan(
                text: widget.contactValue,
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
                    TextSpan(text: s.resendCodePrompt),
                    TextSpan(
                      text: _isResending ? '...' : s.resendButton,
                      style: TextStyle(
                        color: _isResending ? AppColors.grey400 : AppColors.primary500,
                      ),
                      recognizer: _isResending
                          ? null
                          : (TapGestureRecognizer()..onTap = _handleResend),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        errorMessage: state.hasError ? s.incorrectCodeError : null,
        isLoading: state.isLoading,
        onContinuePressed: _handleContinue,
        keypadBackgroundColor: isSignUp ? AppColors.primary500 : AppColors.grey50,
        keypadForegroundColor: isSignUp ? AppColors.grey50 : AppColors.grey900,
        onDigitPressed: (digit) {
          ref.read(verificationCodeNotifierProvider.notifier).enterDigitFromKeypad(digit);
        },
        onDeletePressed: () {
          ref.read(verificationCodeNotifierProvider.notifier).deleteDigitFromKeypad();
        },
      ),
    );
  }
}