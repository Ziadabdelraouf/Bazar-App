import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

enum DeliveryDateType { today, tomorrow, custom }

class DeliveryDateTimeState {
  final DeliveryDateType dateType;
  final DateTime selectedDate;
  final String selectedTimeSlot;

  DeliveryDateTimeState({
    required this.dateType,
    required this.selectedDate,
    required this.selectedTimeSlot,
  });

  factory DeliveryDateTimeState.initial() {
    return DeliveryDateTimeState(
      dateType: DeliveryDateType.today,
      selectedDate: DateTime.now(),
      selectedTimeSlot: 'Between 10AM : 1PM',
    );
  }

  String getFormattedDate(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final dateStr = DateFormat('d MMM', locale).format(selectedDate);
    switch (dateType) {
      case DeliveryDateType.today:
        return '${S.of(context).today}, $dateStr';
      case DeliveryDateType.tomorrow:
        return '${S.of(context).tomorrow}, $dateStr';
      case DeliveryDateType.custom:
        return DateFormat('d MMM yyyy', locale).format(selectedDate);
    }
  }

  String get formattedDate {
    final dateStr = DateFormat('d MMM').format(selectedDate);
    switch (dateType) {
      case DeliveryDateType.today:
        return 'Today, $dateStr';
      case DeliveryDateType.tomorrow:
        return 'Tomorrow, $dateStr';
      case DeliveryDateType.custom:
        return DateFormat('d MMM yyyy').format(selectedDate);
    }
  }

  DeliveryDateTimeState copyWith({
    DeliveryDateType? dateType,
    DateTime? selectedDate,
    String? selectedTimeSlot,
  }) {
    return DeliveryDateTimeState(
      dateType: dateType ?? this.dateType,
      selectedDate: selectedDate ?? this.selectedDate,
      selectedTimeSlot: selectedTimeSlot ?? this.selectedTimeSlot,
    );
  }
}

class DeliveryDateTimeNotifier extends Notifier<DeliveryDateTimeState> {
  @override
  DeliveryDateTimeState build() {
    return DeliveryDateTimeState.initial();
  }

  void updateSelection({
    required DeliveryDateType dateType,
    required DateTime selectedDate,
    required String selectedTimeSlot,
  }) {
    state = state.copyWith(
      dateType: dateType,
      selectedDate: selectedDate,
      selectedTimeSlot: selectedTimeSlot,
    );
  }
}
