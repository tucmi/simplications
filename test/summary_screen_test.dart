import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:simplications/data/catalog_data.dart';
import 'package:simplications/l10n/app_localizations.dart';
import 'package:simplications/models/device.dart';
import 'package:simplications/models/survey_state.dart';
import 'package:simplications/screens/summary_screen.dart';

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

DeviceTemplate _template(String id) {
  return CatalogData.allDeviceTemplates.firstWhere((t) => t.id == id);
}

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('shows empty-state text when there are no evaluated devices', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1600, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final state = SurveyState();

    await tester.pumpWidget(_buildTestApp(SummaryScreen(state: state)));
    await tester.pumpAndSettle();

    expect(find.text('No devices captured.'), findsOneWidget);
    expect(
      find.text('Restart and add devices to receive an assessment.'),
      findsOneWidget,
    );
  });

  testWidgets('renders risk sections and skipped-device hint', (tester) async {
    tester.view.physicalSize = const Size(1600, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final state = SurveyState();

    final highRiskTemplate = _template('indoor_camera');
    state.addDevice(highRiskTemplate, 'hallway', 'Hallway');
    final highRiskDevice = state.devices.first;
    for (final question in highRiskDevice.questions) {
      highRiskDevice.setAnswer(question.id, QuestionAnswer.no);
    }

    final skippedTemplate = _template('smart_tv');
    state.addDevice(skippedTemplate, 'living', 'Living room');

    await tester.pumpWidget(_buildTestApp(SummaryScreen(state: state)));
    await tester.pumpAndSettle();

    expect(find.text('High risk'), findsAtLeastNWidgets(1));
    expect(
      find.textContaining(
        'skipped because the questionnaire was not completed.',
      ),
      findsOneWidget,
    );
  });

  testWidgets('overview header fits narrow phone width', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final state = SurveyState();

    final highRiskTemplate = _template('indoor_camera');
    state.addDevice(highRiskTemplate, 'hallway', 'Hallway');
    final highRiskDevice = state.devices.first;
    for (final question in highRiskDevice.questions) {
      highRiskDevice.setAnswer(question.id, QuestionAnswer.no);
    }

    final skippedTemplate = _template('smart_tv');
    state.addDevice(skippedTemplate, 'living', 'Living room');

    await tester.pumpWidget(_buildTestApp(SummaryScreen(state: state)));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.byType(SummaryScreen), findsOneWidget);
  });
}
