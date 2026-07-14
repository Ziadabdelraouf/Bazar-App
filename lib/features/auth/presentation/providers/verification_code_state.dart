class VerificationCodeState {
  final String code;
  final bool isLoading;
  final String? errorMessage;
  final int resendCooldownSeconds;

  VerificationCodeState({
    this.code = '',
    this.isLoading = false,
    this.errorMessage,
    this.resendCooldownSeconds = 0,
  });

  VerificationCodeState copyWith({
    String? code,
    bool? isLoading,
    String? errorMessage,
    int? resendCooldownSeconds,
  }) {
    return VerificationCodeState(
      code: code ?? this.code,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      resendCooldownSeconds: resendCooldownSeconds ?? this.resendCooldownSeconds,
    );
  }
}