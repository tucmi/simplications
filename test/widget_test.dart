// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:simplications/l10n/app_localizations.dart';
import 'package:simplications/l10n/language_controller.dart';
import 'package:simplications/main.dart';

void main() {
  testWidgets('App launches smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      SimplicationsApp(languageController: LanguageController()),
    );
    await tester.pumpAndSettle();

    final context = tester.element(find.byType(Scaffold).first);
    final localizations = AppLocalizations.of(context)!;
    final hasStart = find.text(localizations.start).evaluate().isNotEmpty;
    final hasResume = find.text(localizations.resume).evaluate().isNotEmpty;

    expect(hasStart || hasResume, isTrue);
  });
}
