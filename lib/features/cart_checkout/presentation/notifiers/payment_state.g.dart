// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentMethodState _$PaymentMethodStateFromJson(Map<String, dynamic> json) =>
    _PaymentMethodState(
      type:
          $enumDecodeNullable(_$PaymentTypeEnumMap, json['type']) ??
          PaymentType.cash,
      cardNumber: json['cardNumber'] as String? ?? '',
      cardHolderName: json['cardHolderName'] as String? ?? '',
      expiryDate: json['expiryDate'] as String? ?? '',
      cvv: json['cvv'] as String? ?? '',
    );

Map<String, dynamic> _$PaymentMethodStateToJson(_PaymentMethodState instance) =>
    <String, dynamic>{
      'type': _$PaymentTypeEnumMap[instance.type]!,
      'cardNumber': instance.cardNumber,
      'cardHolderName': instance.cardHolderName,
      'expiryDate': instance.expiryDate,
      'cvv': instance.cvv,
    };

const _$PaymentTypeEnumMap = {
  PaymentType.cash: 'cash',
  PaymentType.card: 'card',
};
