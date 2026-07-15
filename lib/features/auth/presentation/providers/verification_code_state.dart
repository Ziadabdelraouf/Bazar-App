class VerificationCodeState {
  final String code;
  final bool isLoading;
  final String? errorMessage;
  final int resendCooldownSeconds;
  final int activeIndex;

  VerificationCodeState({
    this.code = '',
    this.isLoading = false,
    this.errorMessage,
    this.resendCooldownSeconds = 0,
    this.activeIndex = 0,
  });

  VerificationCodeState copyWith({
    String? code,
    bool? isLoading,
    String? errorMessage,
    int? resendCooldownSeconds,
    int? activeIndex,
  }) {
    return VerificationCodeState(
      code: code ?? this.code,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      resendCooldownSeconds: resendCooldownSeconds ?? this.resendCooldownSeconds,
      activeIndex: activeIndex ?? this.activeIndex,
    );
  }
}