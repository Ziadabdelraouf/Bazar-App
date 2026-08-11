import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/providers/cart_providers.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/widgets/confirm_order/credit_card_form_widget.dart';
import 'package:flutter/material.dart';
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
                  S.of(context).selectPaymentMethodTitle,
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

            _PaymentTile(
              title: S.of(context).cashOnDelivery,
              subtitle: S.of(context).payWithCashWhenOrderArrives,
              iconPath: AppIcons.walletFill,
              isSelected: _selectedType == PaymentType.cash,
              trailingIcon: AppIcons.chevronRight,
              onTap: _onSelectCash,
            ),
            const SizedBox(height: 12),

            _PaymentTile(
              title: S.of(context).creditDebitCard,
              subtitle: S.of(context).paySecurelyWithCard,
              iconPath: AppIcons.cardOutline,
              isSelected: _selectedType == PaymentType.card,
              trailingIcon: _isCardExpanded
                  ? AppIcons.chevronDown
                  : AppIcons.chevronRight,
              onTap: _onToggleCard,
            ),

            AnimatedCrossFade(
              duration: const Duration(milliseconds: 200),
              crossFadeState:
                  (_selectedType == PaymentType.card && _isCardExpanded)
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstChild: CreditCardFormWidget(
                formKey: _formKey,
                cardHolderController: _cardHolderController,
                cardNumberController: _cardNumberController,
                expiryDateController: _expiryDateController,
                cvvController: _cvvController,
                onConfirm: _onConfirmCard,
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

