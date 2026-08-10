import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/features/auth/data/services/auth_service.dart';
import 'package:bazar_group_1/features/auth/domain/verification_repository.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/auth_service_provider.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/repository_providers.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/verification_code_state.dart';

class VerificationCodeNotifier extends StateNotifier<VerificationCodeState> {
  final VerificationRepository _repository;
  final AuthService? _authService;

  VerificationCodeNotifier(this._repository, [this._authService])
      : super(VerificationCodeState());

  void enterDigitFromKeypad(String digit) {
    if (!RegExp(r'^[0-9]$').hasMatch(digit)) return;
    if (state.code.length >= 6) return;
    final newCode = state.code + digit;
    state = state.copyWith(
      code: newCode,
      activeIndex: newCode.length,
      isFocused: true,
      hasError: false,
    );
  }

  void deleteDigitFromKeypad() {
    if (state.code.isEmpty) return;
    final newCode = state.code.substring(0, state.code.length - 1);
    state = state.copyWith(
      code: newCode,
      activeIndex: newCode.length,
      isFocused: true,
      hasError: false,
    );
  }

  void setFocused(bool focused) {
    state = state.copyWith(isFocused: focused);
  }

  Future<void> submitCode() async {
    state = state.copyWith(isLoading: true);

    bool isCorrect = false;
    if (_authService != null) {
      isCorrect = await _authService.verifyPhoneCode(state.code);
    } else {
      isCorrect = await _repository.verifyCode(state.code);
    }

    if (isCorrect) {
      state = state.copyWith(isLoading: false);
    } else {
      state = state.copyWith(isLoading: false, hasError: true);
    }
  }

  Future<void> resendCode({String? phoneNumber}) async {
    await _repository.resendCode();
    try {
      if (phoneNumber != null && phoneNumber.isNotEmpty && _authService != null) {
        await _authService.sendPhoneVerificationCode(phoneNumber);
      } else {
        await _authService?.sendEmailVerification();
      }
    } catch (_) {}
  }
}

final verificationCodeNotifierProvider =
    StateNotifierProvider<VerificationCodeNotifier, VerificationCodeState>(
  (ref) => VerificationCodeNotifier(
    ref.watch(verificationRepositoryProvider),
    ref.watch(authServiceProvider),
  ),
);