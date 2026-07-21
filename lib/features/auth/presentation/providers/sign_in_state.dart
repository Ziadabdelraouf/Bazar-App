import 'package:flutter/widgets.dart';

class SignInState {
  final bool obscurePassword;
  final bool isLoading;
  final String? emailError;
  final String? passwordError;
  final AutovalidateMode autovalidateMode;

  const SignInState({
    this.obscurePassword = true,
    this.isLoading = false,
    this.emailError,
    this.passwordError,
    this.autovalidateMode = AutovalidateMode.onUserInteractionIfError,
  });

  SignInState copyWith({
    bool? obscurePassword,
    bool? isLoading,
    String? emailError,
    String? passwordError,
    bool clearEmailError = false,
    bool clearPasswordError = false,
    AutovalidateMode? autovalidateMode,
  }) {
    return SignInState(
      obscurePassword: obscurePassword ?? this.obscurePassword,
      isLoading: isLoading ?? this.isLoading,
      emailError: clearEmailError ? null : (emailError ?? this.emailError),
      passwordError: clearPasswordError ? null : (passwordError ?? this.passwordError),
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
    );
  }
}
