class MyAccountState {
  final bool obscurePassword;
  final bool isLoading;
  final bool isFetching;
  final String? profileImagePath;
  final bool hasMinimumLength;
  final bool hasNumber;
  final bool hasLetter;
  final bool showPasswordRules;

  const MyAccountState({
    this.obscurePassword = true,
    this.isLoading = false,
    this.isFetching=false,
    this.profileImagePath,
    this.hasMinimumLength = false,
    this.hasNumber = false,
    this.hasLetter = false,
    this.showPasswordRules = false,
  });

  MyAccountState copyWith({
    bool? obscurePassword,
    bool? isLoading,
    bool? isFetching,
    String? profileImagePath,
    bool? hasMinimumLength,
    bool? hasNumber,
    bool? hasLetter,
    bool? showPasswordRules,
  }) {
    return MyAccountState(
      obscurePassword: obscurePassword ?? this.obscurePassword,
      isLoading: isLoading ?? this.isLoading,
      isFetching: isFetching ?? this.isFetching,
      profileImagePath: profileImagePath ?? this.profileImagePath,
      hasMinimumLength: hasMinimumLength ?? this.hasMinimumLength,
      hasNumber: hasNumber ?? this.hasNumber,
      hasLetter: hasLetter ?? this.hasLetter,
      showPasswordRules: showPasswordRules ?? this.showPasswordRules,
    );
  }
}
