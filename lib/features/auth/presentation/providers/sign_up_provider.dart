import 'package:bazar_group_1/features/auth/presentation/providers/sign_up_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpNotifier extends Notifier<SignUpState> {
  @override
  SignUpState build() {
    return SignUpState();
  }

  void togglePasswordVisibility() {
    state = state.copyWith(
      obscurePassword: !state.obscurePassword,
    );
  }

  void validatePassword(String password) {
    final hasMinimumLength = password.length >= 8;
    final hasLetter = RegExp(r'[a-zA-Z]').hasMatch(password);
    final hasNumber = RegExp(r'[0-9]').hasMatch(password);
    final isValid = hasMinimumLength && hasLetter && hasNumber;

    state = state.copyWith(
      hasMinimumLength: hasMinimumLength,
      hasNumber: hasNumber,
      hasLetter: hasLetter,
      showPasswordRules: password.isNotEmpty && !isValid,
    );
  }
}

final signUpProvider = NotifierProvider<SignUpNotifier, SignUpState>(
  SignUpNotifier.new,
);
