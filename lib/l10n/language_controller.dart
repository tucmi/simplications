import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_localizations.dart';

class LanguageController extends ChangeNotifier {
  static const _storageKey = 'selected_language_code';

  static const Map<String, String> flagsByLanguageCode = {
    'de': 'DE',
    'cs': 'CZ',
    'en': 'EN',
    'pl': 'PL',
    'fr': 'FR',
    'nl': 'NL',
    'da': 'DK',
  };

  static const Map<String, String> nativeNamesByLanguageCode = {
    'de': 'Deutsch',
    'cs': 'Cestina',
    'en': 'English',
    'pl': 'Polski',
    'fr': 'Francais',
    'nl': 'Nederlands',
    'da': 'Dansk',
  };

  Locale _locale = const Locale('de');
  Locale get locale => _locale;

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final storedCode = prefs.getString(_storageKey);
    if (storedCode != null && _isSupportedLanguage(storedCode)) {
      _locale = Locale(storedCode);
      return;
    }

    final deviceLocale = PlatformDispatcher.instance.locale;
    final inferredCode = _isSupportedLanguage(deviceLocale.languageCode)
        ? deviceLocale.languageCode
        : 'de';
    _locale = Locale(inferredCode);
  }

  Future<void> setLocale(Locale locale) async {
    if (!_isSupportedLanguage(locale.languageCode)) {
      return;
    }
    if (_locale.languageCode == locale.languageCode) {
      return;
    }

    _locale = Locale(locale.languageCode);
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_storageKey, locale.languageCode);
  }

  bool _isSupportedLanguage(String languageCode) {
    return AppLocalizations.supportedLocales.any(
      (locale) => locale.languageCode == languageCode,
    );
  }
}
