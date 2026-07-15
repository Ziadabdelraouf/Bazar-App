import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/phone_number_notifier.dart';
import 'package:bazar_group_1/features/auth/presentation/widgets/phone_number_display.dart';
import 'package:bazar_group_1/features/auth/presentation/widgets/auth_screen_template.dart';

class PhoneNumberInputScreen extends ConsumerWidget {
  const PhoneNumberInputScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(phoneNumberNotifierProvider);

    return AuthScreenTemplate(
      title: 'Phone Number',
      description: Text(
        'Please enter your phone number, so we can more easily deliver your order',
        textAlign: TextAlign.center,
        style: AppTextStyles.body16Regular.copyWith(color: AppColors.grey500),
      ),
      middleContent: const PhoneNumberDisplay(),
      errorMessage: state.errorMessage,
      isLoading: state.isLoading,
      onContinuePressed: () async {
        final success = await ref.read(phoneNumberNotifierProvider.notifier).submitPhoneNumber();
        if (success) {
          // Navigate to Verification Phone screen, once routing is wired up.
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
    );
  }
}