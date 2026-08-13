import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_state.freezed.dart';
part 'payment_state.g.dart';

enum PaymentType { cash, card }

@freezed
abstract class PaymentMethodState with _$PaymentMethodState {
  const PaymentMethodState._();

  const factory PaymentMethodState({
    @Default(PaymentType.cash) PaymentType type,
    @Default('') String cardNumber,
    @Default('') String cardHolderName,
    @Default('') String expiryDate,
    @Default('') String cvv,
  }) = _PaymentMethodState;

  factory PaymentMethodState.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodStateFromJson(json);

  String get maskedCardNumber {
    final cleanCard = cardNumber.replaceAll(' ', '');
    if (cleanCard.length >= 4) {
      final last4 = cleanCard.substring(cleanCard.length - 4);
      return '**** **** **** $last4';
    }
    return cardNumber.isNotEmpty ? cardNumber : 'Credit / Debit Card';
  }
}
