import 'package:bazar_group_1/core/responsive/app_responsive_breakpoints.dart';
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
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final screenHeight = MediaQuery.of(context).size.height;
    final keypadHeight = context.responsiveValue<double>(
      mobile: (screenHeight * 0.35).clamp(200.0, 280.0),
      tablet: 260.0,
      desktop: 280.0,
    );

    final formContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppBackButton(),
        SizedBox(height: isLandscape ? 16 : 24),
        Center(
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
        SizedBox(height: isLandscape ? 24 : 40),
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
    );

    final keypadWidget = NumericKeypad(
      backgroundColor: keypadBackgroundColor,
      foregroundColor: keypadForegroundColor,
      onDigitPressed: onDigitPressed,
      onDeletePressed: onDeletePressed,
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: keypadBackgroundColor,
        systemNavigationBarIconBrightness:
            keypadBackgroundColor == AppColors.primary500
            ? Brightness.light
            : Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: isLandscape
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        child: Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth:
                                  AppResponsiveBreakpoints.maxAuthCardWidth,
                            ),
                            child: formContent,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: keypadBackgroundColor,
                        child: Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth:
                                  AppResponsiveBreakpoints.maxAuthCardWidth,
                            ),
                            child: keypadWidget,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth:
                                  AppResponsiveBreakpoints.maxAuthCardWidth,
                            ),
                            child: formContent,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: AppResponsiveBreakpoints.maxAuthCardWidth,
                        ),
                        child: SizedBox(
                          height: keypadHeight,
                          child: keypadWidget,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
