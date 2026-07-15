class Country {
  final String name;
  final String isoCode;
  final String dialCode;
  final String flagEmoji;

  const Country({
    required this.name,
    required this.isoCode,
    required this.dialCode,
    required this.flagEmoji,
  });
}

const List<Country> kCountries = [
  Country(name: 'Egypt', isoCode: 'EG', dialCode: '+20', flagEmoji: '🇪🇬'),
  Country(name: 'United States', isoCode: 'US', dialCode: '+1', flagEmoji: '🇺🇸'),
  Country(name: 'United Kingdom', isoCode: 'GB', dialCode: '+44', flagEmoji: '🇬🇧'),
  Country(name: 'Saudi Arabia', isoCode: 'SA', dialCode: '+966', flagEmoji: '🇸🇦'),
  Country(name: 'United Arab Emirates', isoCode: 'AE', dialCode: '+971', flagEmoji: '🇦🇪'),
  Country(name: 'Kuwait', isoCode: 'KW', dialCode: '+965', flagEmoji: '🇰🇼'),
  Country(name: 'Qatar', isoCode: 'QA', dialCode: '+974', flagEmoji: '🇶🇦'),
  Country(name: 'Jordan', isoCode: 'JO', dialCode: '+962', flagEmoji: '🇯🇴'),
  Country(name: 'Lebanon', isoCode: 'LB', dialCode: '+961', flagEmoji: '🇱🇧'),
  Country(name: 'India', isoCode: 'IN', dialCode: '+91', flagEmoji: '🇮🇳'),
  Country(name: 'Germany', isoCode: 'DE', dialCode: '+49', flagEmoji: '🇩🇪'),
  Country(name: 'France', isoCode: 'FR', dialCode: '+33', flagEmoji: '🇫🇷'),
  Country(name: 'Canada', isoCode: 'CA', dialCode: '+1', flagEmoji: '🇨🇦'),
];