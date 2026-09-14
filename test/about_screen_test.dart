import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:simplications/l10n/app_localizations.dart';
import 'package:simplications/models/survey_state.dart';
import 'package:simplications/screens/about_screen.dart';

Widget _buildTestApp(Widget child) {
  return MaterialApp(
    locale: const Locale('en'),
    supportedLocales: AppLocalizations.supportedLocales,
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    home: child,
  );
}

void _configureLargeViewport(WidgetTester tester) {
  tester.view.physicalSize = const Size(1600, 2400);
  tester.view.devicePixelRatio = 1.0;
}

void main() {
  const channel = MethodChannel('plugins.flutter.io/url_launcher');

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
          if (call.method == 'canLaunch' || call.method == 'canLaunchUrl') {
            return true;
          }
          if (call.method == 'launch' || call.method == 'launchUrl') {
            return false;
          }
          return null;
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  testWidgets('renders key sections and disabled controls with null state', (
    tester,
  ) async {
    _configureLargeViewport(tester);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(_buildTestApp(const AboutScreen(state: null)));
    await tester.pumpAndSettle();

    final context = tester.element(find.byType(Scaffold).first);
    final localizations = AppLocalizations.of(context)!;

    expect(find.text(localizations.aboutScreenTitle), findsOneWidget);
    expect(find.text(localizations.projectPartners), findsOneWidget);
    expect(find.text(localizations.coordinationFunding), findsOneWidget);
    expect(find.text(localizations.expertModeTitle), findsOneWidget);
    expect(find.text(localizations.dangerZone), findsOneWidget);

    final switchWidget = tester.widget<Switch>(find.byType(Switch).first);
    expect(switchWidget.onChanged, isNull);

    final deleteButton = tester.widget<FilledButton>(
      find.widgetWithText(FilledButton, localizations.deleteAllDataButton),
    );
    expect(deleteButton.onPressed, isNull);
  });

  testWidgets('expert mode toggle updates survey state', (tester) async {
    _configureLargeViewport(tester);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final state = SurveyState();

    await tester.pumpWidget(_buildTestApp(AboutScreen(state: state)));
    await tester.pumpAndSettle();

    expect(state.expertModeEnabled, isFalse);

    await tester.tap(find.byType(Switch).first);
    await tester.pumpAndSettle();

    expect(state.expertModeEnabled, isTrue);
  });

  testWidgets('delete all data confirmation clears state and shows snackbar', (
    tester,
  ) async {
    _configureLargeViewport(tester);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final state = SurveyState();
    state.addCustomRoom('Temporary', Icons.home);
    expect(state.hasAnyData, isTrue);

    await tester.pumpWidget(_buildTestApp(AboutScreen(state: state)));
    await tester.pumpAndSettle();

    final context = tester.element(find.byType(Scaffold).first);
    final localizations = AppLocalizations.of(context)!;

    await tester.tap(
      find.widgetWithText(FilledButton, localizations.deleteAllDataButton),
    );
    await tester.pumpAndSettle();

    expect(find.text(localizations.deleteAllDataTitle), findsOneWidget);

    await tester.tap(
      find.widgetWithText(TextButton, localizations.deleteAllDataButton),
    );
    await tester.pumpAndSettle();

    expect(state.hasAnyData, isFalse);
    expect(find.text(localizations.allDataDeleted), findsOneWidget);
  });

  testWidgets('failed website launch shows snackbar message', (tester) async {
    _configureLargeViewport(tester);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final state = SurveyState();

    await tester.pumpWidget(_buildTestApp(AboutScreen(state: state)));
    await tester.pumpAndSettle();

    final context = tester.element(find.byType(Scaffold).first);
    final localizations = AppLocalizations.of(context)!;

    await tester.tap(find.text(localizations.aboutWebsiteSimplicationsLabel));
    await tester.pumpAndSettle();

    expect(find.text(localizations.websiteOpenFailed), findsOneWidget);
  });
}
