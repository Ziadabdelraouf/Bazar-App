import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/core/utils/firebase_error_utils.dart';
import 'package:bazar_group_1/features/auth/data/services/auth_service.dart';
import 'package:bazar_group_1/features/auth/domain/validators/phone_validator.dart';
import 'package:bazar_group_1/features/auth/domain/verification_repository.dart';
import 'package:bazar_group_1/features/auth/domain/country.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/auth_service_provider.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/repository_providers.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/phone_number_state.dart';

class PhoneNumberNotifier extends StateNotifier<PhoneNumberState> {
  final VerificationRepository _repository;
  final AuthService? _authService;

  PhoneNumberNotifier(this._repository, [this._authService])
    : super(PhoneNumberState());

  void enterDigit(String digit) {
    if (!RegExp(r'^[0-9]$').hasMatch(digit)) return;
    state = state.copyWith(digits: state.digits + digit, errorMessage: null);
  }

  void deleteDigit() {
    if (state.digits.isEmpty) return;
    state = state.copyWith(
      digits: state.digits.substring(0, state.digits.length - 1),
    );
  }

  void selectCountry(Country country) {
    state = state.copyWith(selectedCountry: country);
  }

  void setFocused(bool focused) {
    state = state.copyWith(isFocused: focused);
  }

  Future<bool> submitPhoneNumber({
    required String emptyError,
    required String invalidError,
  }) async {
    final validationError = validatePhoneNumber(
      state.digits,
      state.selectedCountry,
      emptyError: emptyError,
      invalidError: invalidError,
    );
    if (validationError != null) {
      state = state.copyWith(errorMessage: validationError);
      return false;
    }

    state = state.copyWith(isLoading: true, errorMessage: null);
    await _repository.resendCode();
    final cleanDialCode = state.selectedCountry.dialCode.replaceAll(
      RegExp(r'[^\d+]'),
      '',
    );
    final cleanDigits = state.digits.replaceAll(RegExp(r'\D'), '');
    final fullNumber = '$cleanDialCode$cleanDigits';
    try {
      debugPrint('fullNumber: $fullNumber');
      await _authService?.sendPhoneVerificationCode(fullNumber);
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      debugPrint('Error: $e');
      final errorMessage = FirebaseErrorUtils.getErrorMessage(e);
      state = state.copyWith(isLoading: false, errorMessage: errorMessage);
      return false;
    }
  }
}

final phoneNumberNotifierProvider =
    StateNotifierProvider<PhoneNumberNotifier, PhoneNumberState>(
      (ref) => PhoneNumberNotifier(
        ref.watch(verificationRepositoryProvider),
        ref.watch(authServiceProvider),
      ),
    );
