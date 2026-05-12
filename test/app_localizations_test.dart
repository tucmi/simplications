import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:simplications/l10n/app_localizations.dart';

void main() {
  group('AppLocalizations.translate', () {
    test('falls back to English when locale is unsupported', () {
      final value = AppLocalizations.translate(
        'start',
        locale: const Locale('xx'),
      );

      expect(value, 'Start');
    });

    test('replaces parameter placeholders', () {
      final value = AppLocalizations.translate(
        'dontKnowHint',
        locale: const Locale('en'),
        params: {'count': '2', 'suffix': 's'},
      );

      expect(value.contains('2 answer'), isTrue);
      expect(value.contains('"I don\'t know"'), isTrue);
    });

    test('uses explicit fallback for unknown keys', () {
      final value = AppLocalizations.translate(
        'missing_key_example',
        locale: const Locale('en'),
        fallback: 'fallback-value',
      );

      expect(value, 'fallback-value');
    });

    test('returns key when unknown key has no fallback', () {
      final value = AppLocalizations.translate(
        'missing_key_example',
        locale: const Locale('en'),
      );

      expect(value, 'missing_key_example');
    });
  });

  group('AppLocalizations.activate', () {
    test('updates active language code', () {
      AppLocalizations.activate(const Locale('pl'));
      expect(AppLocalizations.activeLanguageCode, 'pl');

      AppLocalizations.activate(const Locale('de'));
      expect(AppLocalizations.activeLanguageCode, 'de');
    });
  });
}
