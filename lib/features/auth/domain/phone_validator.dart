String? validatePhoneNumber(String value) {
  if (value.trim().isEmpty) {
    return 'Please enter your phone number';
  }

  final digitsOnly = value.replaceAll(RegExp(r'[^0-9]'), '');

  if (digitsOnly.length < 7) {
    return 'Please enter a valid phone number';
  }

  return null;
}