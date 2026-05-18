import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:simplications/l10n/app_localizations.dart';
import 'package:simplications/l10n/localization_lookup.dart';

void main() {
  group('Localization key coverage', () {
    test('all supported locales keep parity with English keys', () {
      final keyCoverage = LocalizationLookup.localizationKeysByLocale();
      final enKeys = keyCoverage['en'];

      expect(enKeys, isNotNull);
      expect(enKeys, isNotEmpty);

      for (final locale in AppLocalizations.supportedLocales) {
        final languageCode = locale.languageCode;
        final localeKeys = keyCoverage[languageCode];
        expect(
          localeKeys,
          isNotNull,
          reason: 'Missing locale map: $languageCode',
        );
        expect(
          localeKeys,
          equals(enKeys),
          reason:
              'Locale $languageCode must contain exactly the same keys as en',
        );
      }
    });
  });

  group('LocalizationLookup.translate', () {
    test('falls back to English when locale is unsupported', () {
      final value = LocalizationLookup.translate(
        'start',
        locale: const Locale('xx'),
      );

      expect(value, 'Start');
    });

    test('replaces parameter placeholders', () {
      final value = LocalizationLookup.translate(
        'dontKnowHint',
        locale: const Locale('en'),
        params: {'count': '2', 'suffix': 's'},
      );

      expect(value.contains('2 answer'), isTrue);
      expect(value.contains('"I don\'t know"'), isTrue);
    });

    test('uses explicit fallback for unknown keys', () {
      final value = LocalizationLookup.translate(
        'missing_key_example',
        locale: const Locale('en'),
        fallback: 'fallback-value',
      );

      expect(value, 'fallback-value');
    });

    test('returns key when unknown key has no fallback', () {
      final value = LocalizationLookup.translate(
        'missing_key_example',
        locale: const Locale('en'),
      );

      expect(value, 'missing_key_example');
    });
  });

  group('LocalizationLookup.activate', () {
    test('updates active language code', () {
      LocalizationLookup.activate(const Locale('pl'));
      expect(LocalizationLookup.activeLanguageCode, 'pl');

      LocalizationLookup.activate(const Locale('de'));
      expect(LocalizationLookup.activeLanguageCode, 'de');
    });
  });
}
