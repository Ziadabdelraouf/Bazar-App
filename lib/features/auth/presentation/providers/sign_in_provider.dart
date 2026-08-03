import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/sign_in_state.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/auth_service_provider.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/name_notifier_provider.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/phone_number_notifier.dart';
import 'package:bazar_group_1/features/auth/domain/validators/email_validator.dart';
import 'package:bazar_group_1/features/auth/domain/validators/password_validator.dart';

class SignInNotifier extends Notifier<SignInState> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  SignInState build() {
    ref.onDispose(() {
      emailController.dispose();
      passwordController.dispose();
    });
    return const SignInState();
  }

  void reset() {
    emailController.clear();
    passwordController.clear();
    formKey.currentState?.reset();
    state = const SignInState();
  }

  void togglePasswordVisibility() {
    state = state.copyWith(obscurePassword: !state.obscurePassword);
  }

  void clearEmailError() {
    if (state.emailError != null) {
      state = state.copyWith(clearEmailError: true);
    }
  }

  void clearPasswordError() {
    if (state.passwordError != null) {
      state = state.copyWith(clearPasswordError: true);
    }
  }

  Future<bool> login({
    required String emailRequired,
    required String invalidEmail,
    required String passwordRequired,
    required String passwordMinimumLength,
    required String passwordNumberRequired,
    required String passwordLetterRequired,
  }) async {
    state = state.copyWith(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      clearEmailError: true,
      clearPasswordError: true,
    );

    if (!(formKey.currentState?.validate() ?? false)) {
      return false;
    }

    state = state.copyWith(isLoading: true);

    // Simulate API/auth network request (same delay as original form widget)
    await Future.delayed(const Duration(seconds: 2));

    final email = emailController.text;
    final password = passwordController.text;

    final emailValResult = validateEmail(
      email,
      emptyError: emailRequired,
      invalidError: invalidEmail,
    );
    if (emailValResult != null) {
      state = state.copyWith(emailError: emailValResult, isLoading: false);
      formKey.currentState?.validate();
      return false;
    }

    final passwordValResult = validatePassword(
      password,
      emptyError: passwordRequired,
      minimumLengthError: passwordMinimumLength,
      numberRequiredError: passwordNumberRequired,
      letterRequiredError: passwordLetterRequired,
      isSignUp: false,
    );
    if (passwordValResult != null) {
      state = state.copyWith(
        passwordError: passwordValResult,
        isLoading: false,
      );
      formKey.currentState?.validate();
      return false;
    }

    final authService = ref.read(authServiceProvider);
    final currentName = ref.read(nameNotifierProvider);
    final phoneState = ref.read(phoneNumberNotifierProvider);
    final phoneStr = phoneState.digits.isNotEmpty
        ? '${phoneState.selectedCountry.dialCode} ${phoneState.digits}'
        : null;

    await authService.saveSession(
      email: email,
      password: password,
      name: currentName.isNotEmpty ? currentName : null,
      mobile: phoneStr,
    );

    ref.invalidate(userProfileProvider);

    state = state.copyWith(isLoading: false);
    return true;
  }
}

final signInProvider = NotifierProvider<SignInNotifier, SignInState>(
  SignInNotifier.new,
);
