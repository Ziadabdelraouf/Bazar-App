import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/features/auth/domain/verification_repository.dart';
import 'package:bazar_group_1/features/auth/data/mock_verification_repository.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/verification_code_state.dart';

final verificationRepositoryProvider = Provider<VerificationRepository>(
  (ref) => MockVerificationRepository(),
);

class VerificationCodeNotifier extends StateNotifier<VerificationCodeState> {
  final VerificationRepository _repository;

  VerificationCodeNotifier(this._repository) : super(VerificationCodeState());

  void updateDigit(int index, String value) {
    final digits = state.code.split('');
    while (digits.length < 4) {
      digits.add('');
    }
    digits[index] = value;
    state = state.copyWith(code: digits.join());
  }

  void deleteLastDigit() {
    if (state.code.isEmpty) return;
    state = state.copyWith(code: state.code.substring(0, state.code.length - 1));
  }

  Future<void> submitCode() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final isCorrect = await _repository.verifyCode(state.code);

    if (isCorrect) {
      state = state.copyWith(isLoading: false);
    } else {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Incorrect code, please try again.',
      );
    }
  }

  Future<void> resendCode() async {
    await _repository.resendCode();
  }
}

final verificationCodeNotifierProvider =
    StateNotifierProvider<VerificationCodeNotifier, VerificationCodeState>(
  (ref) => VerificationCodeNotifier(ref.watch(verificationRepositoryProvider)),
);