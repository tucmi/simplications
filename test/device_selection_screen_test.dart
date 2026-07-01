import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:simplications/data/catalog_data.dart';
import 'package:simplications/l10n/app_localizations.dart';
import 'package:simplications/models/device.dart';
import 'package:simplications/models/room.dart';
import 'package:simplications/models/survey_state.dart';
import 'package:simplications/screens/device_result_screen.dart';
import 'package:simplications/screens/device_questionnaire_screen.dart';
import 'package:simplications/screens/device_selection_screen.dart';

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

Room _roomById(String id) =>
    CatalogData.allRooms.firstWhere((room) => room.id == id);

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('renders room header and device prompts', (tester) async {
    _configureLargeViewport(tester);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final state = SurveyState();
    final room = _roomById('living');

    await tester.pumpWidget(
      _buildTestApp(DeviceSelectionScreen(state: state, room: room)),
    );
    await tester.pumpAndSettle();

    final context = tester.element(find.byType(Scaffold).first);
    final localizations = AppLocalizations.of(context)!;

    expect(find.text(localizations.roomCheck), findsOneWidget);
    expect(find.text(localizations.deviceQuestion), findsOneWidget);
    expect(find.text(localizations.noDevice), findsOneWidget);
    expect(find.text(localizations.addDevice), findsOneWidget);
  });

  testWidgets(
    'selecting a catalog device adds instance and opens questionnaire',
    (tester) async {
      _configureLargeViewport(tester);
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final state = SurveyState();
      final room = _roomById('living');

      await tester.pumpWidget(
        _buildTestApp(DeviceSelectionScreen(state: state, room: room)),
      );
      await tester.pumpAndSettle();

      final context = tester.element(find.byType(Scaffold).first);
      final localizations = AppLocalizations.of(context)!;
      final tvTemplate = CatalogData.allDeviceTemplates.firstWhere(
        (device) => device.id == 'smart_tv',
      );
      final tvLabel = CatalogData.deviceName(localizations, tvTemplate);

      await tester.tap(find.text(tvLabel).first);
      await tester.pumpAndSettle();

      expect(state.isDeviceAdded(room.id, tvTemplate.id), isTrue);
      expect(find.byType(DeviceQuestionnaireScreen), findsOneWidget);
    },
  );

  testWidgets('same device can be added multiple times in one room', (
    tester,
  ) async {
    _configureLargeViewport(tester);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final state = SurveyState();
    final room = _roomById('living');

    await tester.pumpWidget(
      _buildTestApp(DeviceSelectionScreen(state: state, room: room)),
    );
    await tester.pumpAndSettle();

    final context = tester.element(find.byType(Scaffold).first);
    final localizations = AppLocalizations.of(context)!;
    final tvTemplate = CatalogData.allDeviceTemplates.firstWhere(
      (device) => device.id == 'smart_tv',
    );
    final tvLabel = CatalogData.deviceName(localizations, tvTemplate);

    await tester.tap(find.text(tvLabel).first);
    await tester.pumpAndSettle();
    await tester.pageBack();
    await tester.pumpAndSettle();

    await tester.tap(find.text(tvLabel).first);
    await tester.pumpAndSettle();

    final roomInstances = state.devices
        .where((instance) => instance.roomId == room.id)
        .toList();
    expect(roomInstances, hasLength(2));
    expect(roomInstances[0].instanceId, isNot(roomInstances[1].instanceId));
  });

  testWidgets('finishing questionnaire opens immediate device result screen', (
    tester,
  ) async {
    _configureLargeViewport(tester);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final state = SurveyState();
    final room = _roomById('living');

    await tester.pumpWidget(
      _buildTestApp(DeviceSelectionScreen(state: state, room: room)),
    );
    await tester.pumpAndSettle();

    final context = tester.element(find.byType(Scaffold).first);
    final localizations = AppLocalizations.of(context)!;
    final tvTemplate = CatalogData.allDeviceTemplates.firstWhere(
      (device) => device.id == 'smart_tv',
    );
    final tvLabel = CatalogData.deviceName(localizations, tvTemplate);

    await tester.tap(find.text(tvLabel).first);
    await tester.pumpAndSettle();

    final activeInstance = state.devices.last;
    final yesButtons = find.widgetWithText(OutlinedButton, localizations.yes);
    final yesCount = tester.widgetList(yesButtons).length;
    for (var i = 0; i < yesCount; i++) {
      await tester.tap(yesButtons.at(i));
      await tester.pump();
    }
    for (final question in activeInstance.questions) {
      expect(activeInstance.answerFor(question.id), equals(QuestionAnswer.yes));
    }
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(FilledButton, localizations.done));
    await tester.pumpAndSettle();

    expect(find.byType(DeviceResultScreen), findsOneWidget);
  });

  testWidgets('room overview lists instances and allows resume/result open', (
    tester,
  ) async {
    _configureLargeViewport(tester);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final state = SurveyState();
    final room = _roomById('living');
    final template = CatalogData.allDeviceTemplates.firstWhere(
      (device) => device.id == 'smart_tv',
    );

    final completed = state.addDevice(template, room.id, room.name);
    for (final question in completed.questions) {
      completed.setAnswer(question.id, QuestionAnswer.yes);
    }
    state.addDevice(template, room.id, room.name);
    state.notifyUpdate();

    await tester.pumpWidget(
      _buildTestApp(DeviceSelectionScreen(state: state, room: room)),
    );
    await tester.pumpAndSettle();

    final context = tester.element(find.byType(Scaffold).first);
    final localizations = AppLocalizations.of(context)!;

    expect(find.text(localizations.overview), findsOneWidget);
    expect(find.textContaining('#1'), findsOneWidget);
    expect(find.textContaining('#2'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.play_circle_fill));
    await tester.pumpAndSettle();
    expect(find.byType(DeviceQuestionnaireScreen), findsOneWidget);

    await tester.pageBack();
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.arrow_forward_ios).first);
    await tester.pumpAndSettle();
    expect(find.byType(DeviceResultScreen), findsOneWidget);
  });

  testWidgets('no-device flow marks room without devices after confirm', (
    tester,
  ) async {
    _configureLargeViewport(tester);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final state = SurveyState();
    final room = _roomById('kitchen');

    await tester.pumpWidget(
      _buildTestApp(DeviceSelectionScreen(state: state, room: room)),
    );
    await tester.pumpAndSettle();

    final context = tester.element(find.byType(Scaffold).first);
    final localizations = AppLocalizations.of(context)!;

    await tester.tap(find.text(localizations.noDevice).first);
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(TextButton, localizations.confirm));
    await tester.pumpAndSettle();

    expect(state.noDeviceRoomIds.contains(room.id), isTrue);
    expect(state.completedRoomIds.contains(room.id), isTrue);
    expect(state.devicesForRoom(room.id), isEmpty);
  });

  testWidgets(
    'custom room shows full catalog and supports custom device add/remove',
    (tester) async {
      _configureLargeViewport(tester);
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final state = SurveyState();
      final customRoom = state.addCustomRoom('Studio', Icons.mic);

      await tester.pumpWidget(
        _buildTestApp(DeviceSelectionScreen(state: state, room: customRoom)),
      );
      await tester.pumpAndSettle();

      final context = tester.element(find.byType(Scaffold).first);
      final localizations = AppLocalizations.of(context)!;

      final irrigationTemplate = CatalogData.allDeviceTemplates.firstWhere(
        (device) => device.id == 'smart_irrigation',
      );
      final irrigationLabel = CatalogData.deviceName(
        localizations,
        irrigationTemplate,
      );

      expect(find.text(irrigationLabel), findsOneWidget);

      await tester.tap(find.text(localizations.addDevice).first);
      await tester.pumpAndSettle();

      await tester.enterText(
        find
            .descendant(
              of: find.byType(Dialog),
              matching: find.byType(TextField),
            )
            .first,
        'Custom Hub',
      );
      await tester.pumpAndSettle();

      await tester.tap(find.widgetWithText(ElevatedButton, localizations.add));
      await tester.pumpAndSettle();

      expect(state.customDevicesForRoom(customRoom.id), hasLength(1));

      await tester.tap(find.byIcon(Icons.close).first);
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(TextButton, localizations.delete));
      await tester.pumpAndSettle();

      expect(state.customDevicesForRoom(customRoom.id), isEmpty);
    },
  );

  testWidgets('results button is enabled when room has a finished device', (
    tester,
  ) async {
    _configureLargeViewport(tester);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final state = SurveyState();
    final room = _roomById('living');

    await tester.pumpWidget(
      _buildTestApp(DeviceSelectionScreen(state: state, room: room)),
    );
    await tester.pumpAndSettle();

    final context = tester.element(find.byType(Scaffold).first);
    final localizations = AppLocalizations.of(context)!;

    FilledButton resultsButton() => tester.widget<FilledButton>(
      find.widgetWithText(FilledButton, localizations.results),
    );

    expect(resultsButton().onPressed, isNull);

    final template = CatalogData.allDeviceTemplates.firstWhere(
      (device) => device.id == 'smart_tv',
    );
    state.addDevice(template, room.id, room.name);
    final instance = state.devices.single;
    for (final question in instance.questions) {
      instance.setAnswer(question.id, QuestionAnswer.yes);
    }
    state.notifyUpdate();

    await tester.pumpAndSettle();

    expect(resultsButton().onPressed, isNotNull);
  });

  testWidgets('next-room action marks room completed', (tester) async {
    _configureLargeViewport(tester);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final state = SurveyState();
    final room = _roomById('office');

    await tester.pumpWidget(
      _buildTestApp(DeviceSelectionScreen(state: state, room: room)),
    );
    await tester.pumpAndSettle();

    final context = tester.element(find.byType(Scaffold).first);
    final localizations = AppLocalizations.of(context)!;

    await tester.tap(
      find.widgetWithText(OutlinedButton, localizations.nextRoom),
    );
    await tester.pumpAndSettle();

    expect(state.completedRoomIds.contains(room.id), isTrue);
  });
}
