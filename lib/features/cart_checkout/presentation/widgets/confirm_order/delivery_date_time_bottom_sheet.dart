import 'package:bazar_group_1/core/components/buttons/large_primary_button.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/providers/cart_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

Future<void> showDeliveryDateTimeBottomSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Theme.of(context).colorScheme.onSecondary,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) => const DeliveryDateTimeBottomSheet(),
  );
}

class DeliveryDateTimeBottomSheet extends ConsumerStatefulWidget {
  const DeliveryDateTimeBottomSheet({super.key});

  @override
  ConsumerState<DeliveryDateTimeBottomSheet> createState() =>
      _DeliveryDateTimeBottomSheetState();
}

class _DeliveryDateTimeBottomSheetState
    extends ConsumerState<DeliveryDateTimeBottomSheet> {
  late DeliveryDateType _selectedDateType;
  late DateTime _selectedDate;
  late String _selectedTimeSlot;
  DateTime? _customPickedDate;

  @override
  void initState() {
    super.initState();
    final currentState = ref.read(deliveryDateTimeNotifierProvider);
    _selectedDateType = currentState.dateType;
    _selectedDate = currentState.selectedDate;
    _selectedTimeSlot = currentState.selectedTimeSlot;

    if (_selectedDateType == DeliveryDateType.custom) {
      _customPickedDate = currentState.selectedDate;
    }
  }

  void _onSelectToday() {
    setState(() {
      _selectedDateType = DeliveryDateType.today;
      _selectedDate = DateTime.now();
    });
  }

  void _onSelectTomorrow() {
    setState(() {
      _selectedDateType = DeliveryDateType.tomorrow;
      _selectedDate = DateTime.now().add(const Duration(days: 1));
    });
  }

  Future<void> _onPickCustomDate() async {
    final now = DateTime.now();
    final initialDate = _customPickedDate ?? now.add(const Duration(days: 2));
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate.isBefore(now) ? now : initialDate,
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
      builder: (context, child) {
        final theme = Theme.of(context);
        return Theme(
          data: theme.copyWith(
            colorScheme: theme.colorScheme.copyWith(
              primary: AppColors.primary500,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _customPickedDate = picked;
        _selectedDateType = DeliveryDateType.custom;
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final locale = Localizations.localeOf(context).languageCode;

    final now = DateTime.now();
    final todayStr = DateFormat('d MMM', locale).format(now);
    final tomorrowStr = DateFormat('d MMM', locale).format(now.add(const Duration(days: 1)));

    String customTitle = S.of(context).pickDateTitle;
    String customSubtitle = S.of(context).pickDateSubtitle;
    if (_customPickedDate != null) {
      customTitle = DateFormat('d MMM', locale).format(_customPickedDate!);
      customSubtitle = DateFormat('yyyy', locale).format(_customPickedDate!);
    }

    final slot1 = '${S.of(context).betweenTimeSlot} ${S.of(context).timeSlot10AM1PM}';
    final slot2 = '${S.of(context).betweenTimeSlot} ${S.of(context).timeSlot1PM4PM}';

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
            Text(
              S.of(context).deliveryDateTitle,
              style: AppTextStyles.h5.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _PickerCard(
                    title: S.of(context).today,
                    subtitle: todayStr,
                    isSelected: _selectedDateType == DeliveryDateType.today,
                    onTap: _onSelectToday,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _PickerCard(
                    title: S.of(context).tomorrow,
                    subtitle: tomorrowStr,
                    isSelected: _selectedDateType == DeliveryDateType.tomorrow,
                    onTap: _onSelectTomorrow,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _PickerCard(
                    title: customTitle,
                    subtitle: customSubtitle,
                    isSelected: _selectedDateType == DeliveryDateType.custom,
                    onTap: _onPickCustomDate,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              S.of(context).deliveryTimeTitle,
              style: AppTextStyles.h5.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _PickerCard(
                    title: S.of(context).betweenTimeSlot,
                    subtitle: S.of(context).timeSlot10AM1PM,
                    isSelected:
                        _selectedTimeSlot.contains('10AM') ||
                        _selectedTimeSlot == slot1,
                    onTap: () {
                      setState(() {
                        _selectedTimeSlot = slot1;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _PickerCard(
                    title: S.of(context).betweenTimeSlot,
                    subtitle: S.of(context).timeSlot1PM4PM,
                    isSelected:
                        _selectedTimeSlot.contains('1PM') ||
                        _selectedTimeSlot == slot2,
                    onTap: () {
                      setState(() {
                        _selectedTimeSlot = slot2;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            LargePrimaryButton(
              label: S.of(context).confirmButton,
              onPressed: () {
                ref
                    .read(deliveryDateTimeNotifierProvider.notifier)
                    .updateSelection(
                      dateType: _selectedDateType,
                      selectedDate: _selectedDate,
                      selectedTimeSlot: _selectedTimeSlot.replaceAll('\n', ' '),
                    );
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _PickerCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const _PickerCard({
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final primaryColor = theme.colorScheme.primary;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        constraints: const BoxConstraints(minHeight: 88),
        decoration: BoxDecoration(
          color: isDark
              ? theme.colorScheme.surfaceContainerHighest
              : AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? primaryColor
                : (isDark ? AppColors.grey700 : AppColors.grey200),
            width: isSelected ? 1.5 : 1.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.body14SemiBold.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.body14SemiBold.copyWith(
                color: isSelected
                    ? theme.colorScheme.onSurface
                    : (isDark ? AppColors.grey400 : AppColors.grey600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
