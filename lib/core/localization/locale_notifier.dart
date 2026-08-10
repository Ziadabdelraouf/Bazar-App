import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleNotifier extends AsyncNotifier<Locale> {
  static const _key = 'app_locale';

  @override
  Future<Locale> build() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_key) ?? 'en';
    return Locale(code);
  }

  Future<void> toggleLocale() async {
    final current = state.value ?? const Locale('en');
    final newLocale =
        current.languageCode == 'en' ? const Locale('ar') : const Locale('en');

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, newLocale.languageCode);

    state = AsyncValue.data(newLocale);
  }
}

final localeNotifierProvider = AsyncNotifierProvider<LocaleNotifier, Locale>(
  () => LocaleNotifier(),
);