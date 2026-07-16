import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/components/navigation/app_back_button.dart';
import 'package:bazar_group_1/core/components/buttons/large_primary_button.dart';
import 'package:bazar_group_1/features/auth/presentation/widgets/numeric_keypad.dart';

class AuthScreenTemplate extends StatelessWidget {
  final String title;
  final Widget description;
  final Widget middleContent;
  final String? errorMessage;
  final bool isLoading;
  final VoidCallback onContinuePressed;
  final Color keypadBackgroundColor;
  final Color keypadForegroundColor;
  final void Function(String digit) onDigitPressed;
  final VoidCallback onDeletePressed;

  const AuthScreenTemplate({
    super.key,
    required this.title,
    required this.description,
    required this.middleContent,
    this.errorMessage,
    required this.isLoading,
    required this.onContinuePressed,
    required this.keypadBackgroundColor,
    required this.keypadForegroundColor,
    required this.onDigitPressed,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: keypadBackgroundColor,
        systemNavigationBarIconBrightness:
            keypadBackgroundColor == AppColors.primary500
                ? Brightness.light
                : Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
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
                                title,
                                textAlign: TextAlign.center,
                                style: AppTextStyles.h3.copyWith(color: AppColors.grey900),
                              ),
                              const SizedBox(height: 8),
                              description,
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      middleContent,
                      if (errorMessage != null) ...[
                        const SizedBox(height: 8),
                        Center(
                          child: Text(
                            errorMessage!,
                            style: AppTextStyles.body14Regular.copyWith(color: AppColors.red),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                      const SizedBox(height: 24),
                      isLoading
                          ? const Center(
                              child: SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              ),
                            )
                          : LargePrimaryButton(
                              label: s.continueButton,
                              onPressed: onContinuePressed,
                            ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
              NumericKeypad(
                backgroundColor: keypadBackgroundColor,
                foregroundColor: keypadForegroundColor,
                onDigitPressed: onDigitPressed,
                onDeletePressed: onDeletePressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}