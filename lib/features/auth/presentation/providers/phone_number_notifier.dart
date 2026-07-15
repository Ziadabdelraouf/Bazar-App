import 'package:bazar_group_1/features/auth/domain/country.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/features/auth/domain/phone_validator.dart';
import 'package:bazar_group_1/features/auth/domain/verification_repository.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/verification_code_notifier.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/phone_number_state.dart';

class PhoneNumberNotifier extends StateNotifier<PhoneNumberState> {
  final VerificationRepository _repository;

  PhoneNumberNotifier(this._repository) : super(PhoneNumberState());

  void enterDigit(String digit) {
    state = state.copyWith(digits: state.digits + digit, errorMessage: null);
  }

  void deleteDigit() {
    if (state.digits.isEmpty) return;
    state = state.copyWith(digits: state.digits.substring(0, state.digits.length - 1));
  }

  void selectCountry(Country country) {
  state = state.copyWith(selectedCountry: country);
}

  Future<bool> submitPhoneNumber() async {
    final validationError = validatePhoneNumber(state.digits);
    if (validationError != null) {
      state = state.copyWith(errorMessage: validationError);
      return false;
    }

    state = state.copyWith(isLoading: true, errorMessage: null);
    await _repository.resendCode();
    state = state.copyWith(isLoading: false);
    return true;
  }
}

final phoneNumberNotifierProvider =
    StateNotifierProvider<PhoneNumberNotifier, PhoneNumberState>(
  (ref) => PhoneNumberNotifier(ref.watch(verificationRepositoryProvider)),
);