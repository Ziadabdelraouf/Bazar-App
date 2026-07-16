import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/phone_number_notifier.dart';
import 'package:bazar_group_1/features/auth/presentation/widgets/phone_number_display.dart';
import 'package:bazar_group_1/features/auth/presentation/widgets/auth_screen_template.dart';

/// Phone number collection screen — used during Sign Up when the user
/// registers with a phone number instead of an email.
///
/// Not used during Forgot Password: that flow collects contact info via
/// a separate screen (owned by another feature), and calls
/// [VerificationCodeScreen] directly with the result.
///
/// Shares its overall layout with [VerificationCodeScreen] via
/// [AuthScreenTemplate] — only the middle content (a single tappable
/// phone display here, 4 code boxes there) differs.
///
/// Usage:
/// ```dart
/// PhoneNumberInputScreen(
///   onSubmitted: (phoneNumber) {
///     // Navigate to VerificationCodeScreen, passing phoneNumber
///     // as contactValue.
///   },
/// )
/// ```

class PhoneNumberInputScreen extends ConsumerStatefulWidget {
  final void Function(String fullPhoneNumber) onSubmitted;

  const PhoneNumberInputScreen({
    super.key,
    required this.onSubmitted,
  });

  @override
  ConsumerState<PhoneNumberInputScreen> createState() => _PhoneNumberInputScreenState();
}

class _PhoneNumberInputScreenState extends ConsumerState<PhoneNumberInputScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(phoneNumberNotifierProvider.notifier).reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final state = ref.watch(phoneNumberNotifierProvider);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        ref.read(phoneNumberNotifierProvider.notifier).setFocused(false);
      },
      child: AuthScreenTemplate(
        title: s.phoneNumberTitle,
        description: Text(
          s.phoneNumberDescription,
          textAlign: TextAlign.center,
          style: AppTextStyles.body16Regular.copyWith(color: AppColors.grey500),
        ),
        middleContent: const PhoneNumberDisplay(),
        errorMessage: state.errorMessage,
        isLoading: state.isLoading,
        onContinuePressed: () async {
          final success = await ref.read(phoneNumberNotifierProvider.notifier).submitPhoneNumber(
                emptyError: s.emptyPhoneNumberError,
                invalidError: s.invalidPhoneNumberError,
              );
          if (success) {
            final fullNumber = '(${state.selectedCountry.dialCode}) ${state.digits}';
            widget.onSubmitted(fullNumber);
          }
        },
        keypadBackgroundColor: AppColors.primary500,
        keypadForegroundColor: AppColors.grey50,
        onDigitPressed: (digit) {
          ref.read(phoneNumberNotifierProvider.notifier).enterDigit(digit);
        },
        onDeletePressed: () {
          ref.read(phoneNumberNotifierProvider.notifier).deleteDigit();
        },
      ),
    );
  }
}