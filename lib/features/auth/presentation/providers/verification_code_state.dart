class VerificationCodeState {
  final String code;
  final bool isLoading;
  final bool hasError;
  final int resendCooldownSeconds;
  final int activeIndex;
  final bool isFocused;

  VerificationCodeState({
    this.code = '',
    this.isLoading = false,
    this.hasError = false,
    this.resendCooldownSeconds = 0,
    this.activeIndex = 0,
    this.isFocused = false,
  });

  VerificationCodeState copyWith({
    String? code,
    bool? isLoading,
    bool? hasError,
    int? resendCooldownSeconds,
    int? activeIndex,
    bool? isFocused,
  }) {
    return VerificationCodeState(
      code: code ?? this.code,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      resendCooldownSeconds: resendCooldownSeconds ?? this.resendCooldownSeconds,
      activeIndex: activeIndex ?? this.activeIndex,
      isFocused: isFocused ?? this.isFocused,
    );
  }
}