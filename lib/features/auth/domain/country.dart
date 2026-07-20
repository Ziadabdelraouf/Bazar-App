class Country {
  final String name;
  final String isoCode;
  final String dialCode;
  final String flagEmoji;
  final int minDigits;
  final int maxDigits;

  const Country({
    required this.name,
    required this.isoCode,
    required this.dialCode,
    required this.flagEmoji,
    required this.minDigits,
    required this.maxDigits,
  });
}

const List<Country> kCountries = [
  Country(name: 'Egypt', isoCode: 'EG', dialCode: '+20', flagEmoji: '🇪🇬', minDigits: 9, maxDigits: 10),
  Country(name: 'United States', isoCode: 'US', dialCode: '+1', flagEmoji: '🇺🇸', minDigits: 10, maxDigits: 10),
  Country(name: 'United Kingdom', isoCode: 'GB', dialCode: '+44', flagEmoji: '🇬🇧', minDigits: 10, maxDigits: 10),
  Country(name: 'Saudi Arabia', isoCode: 'SA', dialCode: '+966', flagEmoji: '🇸🇦', minDigits: 9, maxDigits: 9),
  Country(name: 'United Arab Emirates', isoCode: 'AE', dialCode: '+971', flagEmoji: '🇦🇪', minDigits: 9, maxDigits: 9),
  Country(name: 'Kuwait', isoCode: 'KW', dialCode: '+965', flagEmoji: '🇰🇼', minDigits: 8, maxDigits: 8),
  Country(name: 'Qatar', isoCode: 'QA', dialCode: '+974', flagEmoji: '🇶🇦', minDigits: 8, maxDigits: 8),
  Country(name: 'Jordan', isoCode: 'JO', dialCode: '+962', flagEmoji: '🇯🇴', minDigits: 9, maxDigits: 9),
  Country(name: 'Lebanon', isoCode: 'LB', dialCode: '+961', flagEmoji: '🇱🇧', minDigits: 7, maxDigits: 8),
  Country(name: 'India', isoCode: 'IN', dialCode: '+91', flagEmoji: '🇮🇳', minDigits: 10, maxDigits: 10),
  Country(name: 'Germany', isoCode: 'DE', dialCode: '+49', flagEmoji: '🇩🇪', minDigits: 10, maxDigits: 11),
  Country(name: 'France', isoCode: 'FR', dialCode: '+33', flagEmoji: '🇫🇷', minDigits: 9, maxDigits: 9),
  Country(name: 'Canada', isoCode: 'CA', dialCode: '+1', flagEmoji: '🇨🇦', minDigits: 10, maxDigits: 10),
];