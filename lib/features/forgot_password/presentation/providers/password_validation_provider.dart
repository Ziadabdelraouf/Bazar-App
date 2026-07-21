import 'package:flutter_riverpod/flutter_riverpod.dart';

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

class PasswordValidationNotifier extends Notifier<PasswordValidationState> {
  @override
  PasswordValidationState build() {
    return const PasswordValidationState();
  }

  void validatePassword(String password) {
    final hasMinimumLength = password.length >= 8;
    final hasLetter = RegExp(r'[a-zA-Z]').hasMatch(password);
    final hasNumber = RegExp(r'[0-9]').hasMatch(password);
    final isValid = hasMinimumLength && hasLetter && hasNumber;

    state = state.copyWith(
      hasMinimumLength: hasMinimumLength,
      hasLetter: hasLetter,
      hasNumber: hasNumber,
      showPasswordRules: password.isNotEmpty && !isValid,
    );
  }
}

final passwordValidationProvider =
    NotifierProvider<PasswordValidationNotifier, PasswordValidationState>(
      PasswordValidationNotifier.new,
    );
