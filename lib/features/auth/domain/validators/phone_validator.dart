import 'package:bazar_group_1/features/auth/domain/country.dart';

String? validatePhoneNumber(
  String value,
  Country country, {
  required String emptyError,
  required String invalidError,
}) {
  if (value.trim().isEmpty) {
    return emptyError;
  }

  final digitsOnly = value.replaceAll(RegExp(r'[^0-9]'), '');

  if (digitsOnly.length < country.minDigits || digitsOnly.length > country.maxDigits) {
    return invalidError;
  }

  return null;
}