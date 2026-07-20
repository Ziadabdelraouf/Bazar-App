import 'package:bazar_group_1/features/auth/domain/country.dart';

class PhoneNumberState {
  final String digits;
  final Country selectedCountry;
  final bool isLoading;
  final String? errorMessage;
  final bool isFocused;

  PhoneNumberState({
    this.digits = '',
    this.selectedCountry = const Country(
      name: 'Egypt',
      isoCode: 'EG',
      dialCode: '+20',
      flagEmoji: '🇪🇬',
      minDigits: 10,
      maxDigits: 10,
    ),
    this.isLoading = false,
    this.errorMessage,
    this.isFocused = false,
  });

  PhoneNumberState copyWith({
    String? digits,
    Country? selectedCountry,
    bool? isLoading,
    String? errorMessage,
    bool? isFocused,
  }) {
    return PhoneNumberState(
      digits: digits ?? this.digits,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isFocused: isFocused ?? this.isFocused,
    );
  }
}