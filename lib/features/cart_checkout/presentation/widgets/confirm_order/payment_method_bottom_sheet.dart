// ignore_for_file: deprecated_member_use

import 'package:bazar_group_1/core/components/buttons/large_primary_button.dart';
import 'package:bazar_group_1/core/components/inputs/app_text_form_field.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/notifiers/payment_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<void> showPaymentMethodBottomSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Theme.of(context).colorScheme.onSecondary,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) => const _PaymentMethodBottomSheetContent(),
  );
}

class _PaymentMethodBottomSheetContent extends ConsumerStatefulWidget {
  const _PaymentMethodBottomSheetContent();

  @override
  ConsumerState<_PaymentMethodBottomSheetContent> createState() =>
      __PaymentMethodBottomSheetContentState();
}

class __PaymentMethodBottomSheetContentState
    extends ConsumerState<_PaymentMethodBottomSheetContent> {
  final _formKey = GlobalKey<FormState>();

  late PaymentType _selectedType;
  late bool _isCardExpanded;
  late TextEditingController _cardNumberController;
  late TextEditingController _cardHolderController;
  late TextEditingController _expiryDateController;
  late TextEditingController _cvvController;

  @override
  void initState() {
    super.initState();
    final currentState = ref.read(paymentNotifierProvider);
    _selectedType = currentState.type;
    _isCardExpanded = currentState.type == PaymentType.card;
    _cardNumberController = TextEditingController(
      text: currentState.cardNumber,
    );
    _cardHolderController = TextEditingController(
      text: currentState.cardHolderName,
    );
    _expiryDateController = TextEditingController(
      text: currentState.expiryDate,
    );
    _cvvController = TextEditingController(text: currentState.cvv);
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _cardHolderController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  void _onSelectCash() {
    ref.read(paymentNotifierProvider.notifier).selectCash();
    Navigator.pop(context);
  }

  void _onToggleCard() {
    setState(() {
      _selectedType = PaymentType.card;
      _isCardExpanded = !_isCardExpanded;
    });
  }

  void _onConfirmCard() {
    if (_formKey.currentState?.validate() ?? false) {
      ref
          .read(paymentNotifierProvider.notifier)
          .selectCard(
            cardNumber: _cardNumberController.text.trim(),
            cardHolderName: _cardHolderController.text.trim(),
            expiryDate: _expiryDateController.text.trim(),
            cvv: _cvvController.text.trim(),
          );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 12,
          bottom: bottomInset + 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: isDark ? AppColors.grey700 : AppColors.grey300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select Payment Method',
                  style: AppTextStyles.h5.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close, color: theme.colorScheme.onSurface),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Cash Tile
            _PaymentTile(
              title: 'Cash on Delivery',
              subtitle: 'Pay with cash when your order arrives',
              iconPath: AppIcons.walletFill,
              isSelected: _selectedType == PaymentType.cash,
              trailingIcon: AppIcons.chevronRight,
              onTap: _onSelectCash,
            ),
            const SizedBox(height: 12),

            // Card Tile
            _PaymentTile(
              title: 'Credit / Debit Card',
              subtitle: 'Pay securely with your card',
              iconPath: AppIcons.cardOutline,
              isSelected: _selectedType == PaymentType.card,
              trailingIcon: _isCardExpanded
                  ? AppIcons.chevronDown
                  : AppIcons.chevronRight,
              onTap: _onToggleCard,
            ),

            // Expanded Card Form
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 200),
              crossFadeState:
                  (_selectedType == PaymentType.card && _isCardExpanded)
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstChild: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AppFormTextField(
                        label: 'Cardholder Name',
                        placeholder: 'e.g. Ahmed Mohamed',
                        controller: _cardHolderController,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter cardholder name';
                          }
                          return null;
                        },
                      ),
                      AppFormTextField(
                        label: 'Card Number',
                        placeholder: '1234567890123456',
                        controller: _cardNumberController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(16),
                        ],
                        validator: (value) {
                          if (value == null || value.length != 16) {
                            return 'Card number must be 16 digits';
                          }
                          return null;
                        },
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: AppFormTextField(
                              label: 'Expiry Date',
                              placeholder: 'MM/YY',
                              controller: _expiryDateController,
                              keyboardType: TextInputType.datetime,
                              inputFormatters: [
                                _ExpiryDateTextInputFormatter(),
                              ],
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Enter expiry';
                                }
                                final trimmed = value.trim();
                                final regex = RegExp(
                                  r'^(0[1-9]|1[0-2])\/(\d{2})$',
                                );
                                if (!regex.hasMatch(trimmed)) {
                                  return 'Use MM/YY format';
                                }
                                final match = regex.firstMatch(trimmed)!;
                                final month = int.parse(match.group(1)!);
                                final year = int.parse('20${match.group(2)}');
                                final now = DateTime.now();
                                final cardExpiry = DateTime(year, month + 1, 0);
                                if (cardExpiry.isBefore(
                                  DateTime(now.year, now.month, 1),
                                )) {
                                  return 'Card has expired';
                                }
                                return null;
                              },
                            ),
                          ),
                          Expanded(
                            child: AppFormTextField(
                              label: 'CVV',
                              placeholder: '123',
                              controller: _cvvController,
                              keyboardType: TextInputType.number,
                              obscureText: true,
                              textInputAction: TextInputAction.done,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(3),
                              ],
                              validator: (value) {
                                if (value == null || value.length != 3) {
                                  return 'Enter 3 digits';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      LargePrimaryButton(
                        label: 'Confirm Payment Method',
                        onPressed: _onConfirmCard,
                      ),
                    ],
                  ),
                ),
              ),
              secondChild: const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String iconPath;
  final String trailingIcon;
  final bool isSelected;
  final VoidCallback onTap;

  const _PaymentTile({
    required this.title,
    required this.subtitle,
    required this.iconPath,
    required this.trailingIcon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? (isDark
                  ? AppColors.primary900.withValues(alpha: 0.3)
                  : AppColors.primary50)
            : (isDark
                  ? theme.colorScheme.surfaceContainerHighest
                  : AppColors.grey50),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected
              ? theme.colorScheme.primary
              : (isDark ? AppColors.grey700 : AppColors.grey200),
          width: isSelected ? 1.5 : 1.0,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isDark ? AppColors.primary900 : AppColors.primary50,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    iconPath,
                    width: 20,
                    height: 20,
                    colorFilter: ColorFilter.mode(
                      theme.colorScheme.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.body16SemiBold.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: AppTextStyles.body14Regular.copyWith(
                        color: isDark ? AppColors.grey400 : AppColors.grey600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              SvgPicture.asset(
                trailingIcon,
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(
                  isDark ? AppColors.grey400 : AppColors.grey600,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
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
