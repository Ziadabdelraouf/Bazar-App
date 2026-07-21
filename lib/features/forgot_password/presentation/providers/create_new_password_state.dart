class CreateNewPasswordState {
  final bool obscureNewPassword;
  final bool obscureConfirmPassword;
  final bool hasMinimumLength;
  final bool hasNumber;
  final bool hasLetter;
  final bool showPasswordRules;

  const CreateNewPasswordState({
    this.obscureNewPassword = true,
    this.obscureConfirmPassword = true,
    this.hasMinimumLength = false,
    this.hasNumber = false,
    this.hasLetter = false,
    this.showPasswordRules = false,
  });

  CreateNewPasswordState copyWith({
    bool? obscureNewPassword,
    bool? obscureConfirmPassword,
    bool? hasMinimumLength,
    bool? hasNumber,
    bool? hasLetter,
    bool? showPasswordRules,
  }) {
    return CreateNewPasswordState(
      obscureNewPassword: obscureNewPassword ?? this.obscureNewPassword,
      obscureConfirmPassword:
          obscureConfirmPassword ?? this.obscureConfirmPassword,
      hasMinimumLength: hasMinimumLength ?? this.hasMinimumLength,
      hasNumber: hasNumber ?? this.hasNumber,
      hasLetter: hasLetter ?? this.hasLetter,
      showPasswordRules: showPasswordRules ?? this.showPasswordRules,
    );
  }
}
