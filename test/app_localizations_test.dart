import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:simplications/l10n/app_localizations.dart';
import 'package:simplications/l10n/app_localizations_key_resolver.dart';

void main() {
  group('AppLocalizations key resolver', () {
    test('resolves runtime device, question, action and result keys', () {
      final localizations = lookupAppLocalizations(const Locale('en'));

      expect(
        localizations.resolveKey('device_simple_sensor'),
        equals(localizations.device_simple_sensor),
      );
      expect(
        localizations.resolveKey('q_sensor_frequency_text'),
        equals(localizations.q_sensor_frequency_text),
      );
      expect(
        localizations.resolveKey('a_password_title'),
        equals(localizations.a_password_title),
      );
      expect(
        localizations.resolveKey('sl_base_risk'),
        equals(localizations.sl_base_risk),
      );
      expect(
        localizations.resolveKey('risk_hint_camera'),
        equals(localizations.risk_hint_camera),
      );
    });

    test('falls back for unknown keys', () {
      final localizations = lookupAppLocalizations(const Locale('en'));

      expect(
        localizations.resolveKey(
          'missing_key_example',
          fallback: 'fallback-value',
        ),
        equals('fallback-value'),
      );
      expect(
        localizations.resolveKey('missing_key_example'),
        equals('missing_key_example'),
      );
    });

    test('supported locales resolve core runtime keys', () {
      for (final locale in AppLocalizations.supportedLocales) {
        final localizations = lookupAppLocalizations(locale);

        expect(
          localizations.resolveKey('device_simple_sensor'),
          isNotEmpty,
          reason: 'Missing device key for ${locale.languageCode}',
        );
        expect(
          localizations.resolveKey('q_sensor_data_deletion_hint'),
          isNotEmpty,
          reason: 'Missing question key for ${locale.languageCode}',
        );
        expect(
          localizations.resolveKey('a_dont_know_desc'),
          isNotEmpty,
          reason: 'Missing action key for ${locale.languageCode}',
        );
        expect(
          localizations.resolveKey('sl_child_room_bonus'),
          isNotEmpty,
          reason: 'Missing scoring key for ${locale.languageCode}',
        );
      }
    });
  });
}
