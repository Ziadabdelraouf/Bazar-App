String? validatePhoneNumber(String value, {
  required String emptyError,
  required String invalidError,
}) {
  if (value.trim().isEmpty) {
    return emptyError;
  }

  final digitsOnly = value.replaceAll(RegExp(r'[^0-9]'), '');

  if (digitsOnly.length < 7) {
    return invalidError;
  }

  return null;
}