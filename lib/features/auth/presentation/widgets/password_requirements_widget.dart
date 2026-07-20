import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:flutter/material.dart';

class PasswordRequirementsWidget extends StatelessWidget {
  final bool hasMinimumLength;
  final bool hasNumber;
  final bool hasLetter;

  const PasswordRequirementsWidget({
    super.key,
    required this.hasMinimumLength,
    required this.hasNumber,
    required this.hasLetter,
  });

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
      return Column(
        children: [
          PasswordRequirementItem(
            text: localization.minimumEightCharacters,
            isValid: hasMinimumLength,
          ),
          const SizedBox(height: 8),
          PasswordRequirementItem(
            text: localization.atLeastOneNumber,
            isValid: hasNumber,
          ),
          const SizedBox(height: 8),
          PasswordRequirementItem(
            text: localization.atLeastOneLetter,
            isValid: hasLetter,
          ),
        ],
    );
  }
}

class PasswordRequirementItem extends StatelessWidget {
  final String text;
  final bool isValid;

  const PasswordRequirementItem({
    super.key,
    required this.text,
    required this.isValid,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check : Icons.close,
          size: 16,
          color: isValid ? AppColors.primary500 : Colors.red,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.body14Medium.copyWith(
              color: AppColors.grey500,
            ),
          ),
        ),
      ],
    );
  }
}
