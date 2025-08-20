import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocaleNotifier extends StateNotifier<Locale> {
  LocaleNotifier() : super(const Locale('es', 'ES'));

  void changeLocale(Locale newLocale) {
    state = newLocale;
  }

  void toggleLanguage() {
    if (state.languageCode == 'es') {
      state = const Locale('en', 'US');
    } else {
      state = const Locale('es', 'ES');
    }
  }

  String getCurrentLanguageName() {
    return state.languageCode == 'es' ? 'Español' : 'English';
  }

  String getOtherLanguageName() {
    return state.languageCode == 'es' ? 'English' : 'Español';
  }
}

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  return LocaleNotifier();
});
