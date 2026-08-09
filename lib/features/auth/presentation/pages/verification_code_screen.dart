import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/utils/firebase_error_utils.dart';
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
  ConsumerState<VerificationCodeScreen> createState() =>
      _VerificationCodeScreenState();
}

class _VerificationCodeScreenState
    extends ConsumerState<VerificationCodeScreen> {
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
    try {
      await ref
          .read(verificationCodeNotifierProvider.notifier)
          .resendCode(
            phoneNumber: widget.contactMethod == ContactMethod.phone
                ? widget.contactValue
                : null,
          );
      if (mounted) {
        FirebaseErrorUtils.showSuccessSnackBar(
          context,
          S.of(context).codeResentMessage,
        );
      }
    } catch (e) {
      if (mounted) {
        FirebaseErrorUtils.showErrorSnackBar(context, e);
      }
    } finally {
      if (mounted) {
        setState(() => _isResending = false);
      }
    }
  }

  Future<void> _handleContinue() async {
    try {
      await ref.read(verificationCodeNotifierProvider.notifier).submitCode();
      final hasError = ref.read(verificationCodeNotifierProvider).hasError;
      if (!hasError) {
        widget.onVerified();
      }
    } catch (e) {
      if (mounted) {
        FirebaseErrorUtils.showErrorSnackBar(context, e);
      }
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
            style: AppTextStyles.body16Regular.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            children: [
              TextSpan(text: _getDescriptionPrefix(s)),
              TextSpan(
                text: widget.contactValue,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
        middleContent: Column(
          children: [
            const CodeInputBoxes(),
            const SizedBox(height: 24),
            Center(
              child: RichText(
                text: TextSpan(
                  style: AppTextStyles.body14SemiBold.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  children: [
                    TextSpan(text: s.resendCodePrompt),
                    TextSpan(
                      text: _isResending ? '...' : s.resendButton,
                      style: TextStyle(
                        color: _isResending
                            ? Theme.of(context).colorScheme.outline
                            : Theme.of(context).colorScheme.primary,
                      ),
                      recognizer: _isResending
                          ? null
                          : (TapGestureRecognizer()..onTap = _handleResend),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 19),
          ],
        ),
        errorMessage: state.hasError ? s.incorrectCodeError : null,
        isLoading: state.isLoading,
        onContinuePressed: _handleContinue,
        keypadBackgroundColor: isSignUp
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.surfaceContainerHighest,
        keypadForegroundColor: isSignUp
            ? Theme.of(context).colorScheme.onPrimary
            : Theme.of(context).colorScheme.onSurface,
        onDigitPressed: (digit) {
          ref
              .read(verificationCodeNotifierProvider.notifier)
              .enterDigitFromKeypad(digit);
        },
        onDeletePressed: () {
          ref
              .read(verificationCodeNotifierProvider.notifier)
              .deleteDigitFromKeypad();
        },
      ),
    );
  }
}
