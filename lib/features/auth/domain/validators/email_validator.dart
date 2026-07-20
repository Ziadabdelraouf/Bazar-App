String? validateEmail(
  String? value, {
  required String emptyError,
  required String invalidError,
}) {
  final email = value?.trim() ?? '';

  if (email.isEmpty) {
    return emptyError;
  }

  final emailPattern = RegExp(
    r'^[\w\.-]+@[\w\.-]+\.[a-zA-Z]{2,}$',
  );

  if (!emailPattern.hasMatch(email)) {
    return invalidError;
  }

  return null;
}
