import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/router/app_routes.dart';
import 'package:bazar_group_1/core/utils/firebase_error_utils.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/phone_number_notifier.dart';
import 'package:bazar_group_1/features/auth/presentation/widgets/phone_number_display.dart';
import 'package:bazar_group_1/features/auth/presentation/widgets/auth_screen_template.dart';

class PhoneNumberInputScreen extends ConsumerStatefulWidget {
  const PhoneNumberInputScreen({super.key});

  @override
  ConsumerState<PhoneNumberInputScreen> createState() => _PhoneNumberInputScreenState();
}

class _PhoneNumberInputScreenState extends ConsumerState<PhoneNumberInputScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.invalidate(phoneNumberNotifierProvider);
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
          style: AppTextStyles.body16Regular.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
        ),
        middleContent: Column(
          children: [
            const PhoneNumberDisplay(),
            const SizedBox(height: 57),
          ],
        ),
        errorMessage: state.errorMessage,
        isLoading: state.isLoading,
        onContinuePressed: () async {
          try {
            final success = await ref
                .read(phoneNumberNotifierProvider.notifier)
                .submitPhoneNumber(
                  emptyError: s.emptyPhoneNumberError,
                  invalidError: s.invalidPhoneNumberError,
                );
            if (success && context.mounted) {
              final cleanDialCode = state.selectedCountry.dialCode
                  .replaceAll(RegExp(r'[^\d+]'), '');
              final cleanDigits = state.digits.replaceAll(RegExp(r'\D'), '');
              final fullNumber = '$cleanDialCode$cleanDigits';
              Navigator.pushNamed(
                context,
                AppRoutes.signUpVerificationPhone,
                arguments: fullNumber,
              );
            }
          } catch (e) {
            if (context.mounted) {
              FirebaseErrorUtils.showErrorSnackBar(context, e);
            }
          }
        },
        keypadBackgroundColor: Theme.of(context).colorScheme.primary,
        keypadForegroundColor: Theme.of(context).colorScheme.onPrimary,
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