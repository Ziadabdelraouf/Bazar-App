class PasswordValidationState {
  final bool hasMinimumLength;
  final bool hasLetter;
  final bool hasNumber;
  final bool showPasswordRules;

  const PasswordValidationState({
    this.hasMinimumLength = false,
    this.hasLetter = false,
    this.hasNumber = false,
    this.showPasswordRules = false,
  });

  bool get isValid => hasMinimumLength && hasLetter && hasNumber;

  PasswordValidationState copyWith({
    bool? hasMinimumLength,
    bool? hasLetter,
    bool? hasNumber,
    bool? showPasswordRules,
  }) {
    return PasswordValidationState(
      hasMinimumLength: hasMinimumLength ?? this.hasMinimumLength,
      hasLetter: hasLetter ?? this.hasLetter,
      hasNumber: hasNumber ?? this.hasNumber,
      showPasswordRules: showPasswordRules ?? this.showPasswordRules,
    );
  }
}
