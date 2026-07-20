class SignUpState {
  final bool obscurePassword;
  final bool showPasswordRules;
  final bool hasMinimumLength;
  final bool hasNumber;
  final bool hasLetter;

  const SignUpState({
    this.obscurePassword = true,
    this.showPasswordRules = false,
    this.hasMinimumLength = false,
    this.hasLetter = false,
    this.hasNumber = false,
  });

  bool get isPasswordValid =>
      hasMinimumLength && hasLetter && hasNumber;

  SignUpState copyWith({
    bool? obscurePassword,
    bool? showPasswordRules,
    bool? hasMinimumLength,
    bool? hasNumber,
    bool? hasLetter,
  }) {
    return SignUpState(
      obscurePassword: obscurePassword ?? this.obscurePassword,
      showPasswordRules: showPasswordRules ?? this.showPasswordRules,
      hasMinimumLength: hasMinimumLength ?? this.hasMinimumLength,
      hasNumber: hasNumber ?? this.hasNumber,
      hasLetter: hasLetter ?? this.hasLetter,
    );
  }
}
