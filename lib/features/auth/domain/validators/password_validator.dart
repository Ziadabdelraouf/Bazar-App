String? validatePassword(
  // TODO : add to forgot password page
  String? value, {
  required String emptyError,
  required String minimumLengthError,
  required String numberRequiredError,
  required String letterRequiredError,
  bool isSignUp = true,
}) {
  final password = value ?? '';

  if (password.isEmpty) {
    return emptyError;
  }

  if (isSignUp) {
    if (password.length < 8) {
      return minimumLengthError;
    }

    if (!RegExp(r'[0-9]').hasMatch(password)) {
      return numberRequiredError;
    }

    if (!RegExp(r'[a-zA-Z]').hasMatch(password)) {
      return letterRequiredError;
    }
  }

  return null;
}
