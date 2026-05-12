import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:simplications/l10n/language_controller.dart';

void main() {
  group('LanguageController', () {
    setUp(() {
      SharedPreferences.setMockInitialValues({});
    });

    test('init loads persisted supported locale', () async {
      SharedPreferences.setMockInitialValues({'selected_language_code': 'en'});

      final controller = LanguageController();
      await controller.init();

      expect(controller.locale, const Locale('en'));
    });

    test(
      'setLocale updates locale, notifies listeners, and persists',
      () async {
        final controller = LanguageController();
        await controller.init();

        var notifyCount = 0;
        controller.addListener(() {
          notifyCount += 1;
        });

        await controller.setLocale(const Locale('fr'));

        expect(controller.locale, const Locale('fr'));
        expect(notifyCount, 1);

        final prefs = await SharedPreferences.getInstance();
        expect(prefs.getString('selected_language_code'), 'fr');
      },
    );

    test('setLocale ignores unsupported languages', () async {
      final controller = LanguageController();
      await controller.init();
      final before = controller.locale;

      await controller.setLocale(const Locale('es'));

      expect(controller.locale, before);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('selected_language_code'), isNull);
    });
  });
}
