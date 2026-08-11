import 'package:bazar_group_1/core/components/buttons/large_primary_button.dart';
import 'package:bazar_group_1/core/components/inputs/app_text_form_field.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreditCardFormWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController cardHolderController;
  final TextEditingController cardNumberController;
  final TextEditingController expiryDateController;
  final TextEditingController cvvController;
  final VoidCallback onConfirm;

  const CreditCardFormWidget({
    super.key,
    required this.formKey,
    required this.cardHolderController,
    required this.cardNumberController,
    required this.expiryDateController,
    required this.cvvController,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            AppFormTextField(
              label: S.of(context).cardholderNameLabel,
              placeholder: S.of(context).cardholderNamePlaceholder,
              controller: cardHolderController,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return S.of(context).cardholderNameRequired;
                }
                return null;
              },
            ),
            AppFormTextField(
              label: S.of(context).cardNumberLabel,
              placeholder: S.of(context).cardNumberPlaceholder,
              controller: cardNumberController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(16),
              ],
              validator: (value) {
                if (value == null || value.length != 16) {
                  return S.of(context).cardNumberInvalid;
                }
                return null;
              },
            ),
            Row(
              children: [
                Expanded(
                  child: AppFormTextField(
                    label: S.of(context).expiryDateLabel,
                    placeholder: S.of(context).expiryDatePlaceholder,
                    controller: expiryDateController,
                    keyboardType: TextInputType.datetime,
                    inputFormatters: [_ExpiryDateTextInputFormatter()],
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return S.of(context).expiryDateRequired;
                      }
                      final trimmed = value.trim();
                      final regex = RegExp(r'^(0[1-9]|1[0-2])\/(\d{2})$');
                      if (!regex.hasMatch(trimmed)) {
                        return S.of(context).expiryDateFormatInvalid;
                      }
                      final match = regex.firstMatch(trimmed)!;
                      final month = int.parse(match.group(1)!);
                      final year = int.parse('20${match.group(2)}');
                      final now = DateTime.now();
                      final cardExpiry = DateTime(year, month + 1, 0);
                      if (cardExpiry.isBefore(
                        DateTime(now.year, now.month, 1),
                      )) {
                        return S.of(context).cardHasExpired;
                      }
                      return null;
                    },
                  ),
                ),
                Expanded(
                  child: AppFormTextField(
                    label: S.of(context).cvvLabel,
                    placeholder: S.of(context).cvvPlaceholder,
                    controller: cvvController,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                    validator: (value) {
                      if (value == null || value.length != 3) {
                        return S.of(context).cvvInvalid;
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            LargePrimaryButton(
              label: S.of(context).confirmPaymentMethodButton,
              onPressed: onConfirm,
            ),
          ],
        ),
      ),
    );
  }
}

///class to automatically add the "/" in expiry date
class _ExpiryDateTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final oldText = oldValue.text;
    final newText = newValue.text;

    if (newText.length < oldText.length) {
      return newValue;
    }

    var clean = newText.replaceAll(RegExp(r'\D'), '');
    if (clean.isEmpty) {
      return const TextEditingValue(text: '');
    }

    if (clean.length == 1 && int.parse(clean) > 1) {
      clean = '0$clean';
    }

    if (clean.length >= 2) {
      final month = int.tryParse(clean.substring(0, 2)) ?? 0;
      if (month > 12) {
        clean = '12${clean.substring(2)}';
      } else if (month == 0) {
        clean = '01${clean.substring(2)}';
      }
    }

    if (clean.length > 4) {
      clean = clean.substring(0, 4);
    }

    final buffer = StringBuffer();
    for (int i = 0; i < clean.length; i++) {
      if (i == 2) {
        buffer.write('/');
      }
      buffer.write(clean[i]);
    }

    if (clean.length == 2 && !buffer.toString().endsWith('/')) {
      buffer.write('/');
    }

    final string = buffer.toString();
    return TextEditingValue(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}
