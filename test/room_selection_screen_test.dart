import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:simplications/data/catalog_data.dart';
import 'package:simplications/l10n/app_localizations.dart';
import 'package:simplications/models/device.dart';
import 'package:simplications/models/survey_state.dart';
import 'package:simplications/screens/device_selection_screen.dart';
import 'package:simplications/screens/room_selection_screen.dart';
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

void _configureLargeViewport(WidgetTester tester) {
  tester.view.physicalSize = const Size(1600, 2400);
  tester.view.devicePixelRatio = 1.0;
}

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
  });

  tearDown(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  testWidgets('renders catalog rooms and add-room action', (tester) async {
    _configureLargeViewport(tester);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final state = SurveyState();

    await tester.pumpWidget(_buildTestApp(RoomSelectionScreen(state: state)));
    await tester.pumpAndSettle();

    final context = tester.element(find.byType(Scaffold).first);
    final localizations = AppLocalizations.of(context)!;

    expect(find.text(localizations.roomSelectionTitle), findsOneWidget);
    expect(find.text(localizations.addRoom), findsOneWidget);
    expect(find.byIcon(Icons.weekend), findsAtLeastNWidgets(1));
  });

  testWidgets('tapping a room opens device selection and marks room visited', (
    tester,
  ) async {
    _configureLargeViewport(tester);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final state = SurveyState();

    await tester.pumpWidget(_buildTestApp(RoomSelectionScreen(state: state)));
    await tester.pumpAndSettle();

    final context = tester.element(find.byType(Scaffold).first);
    final localizations = AppLocalizations.of(context)!;
    final livingRoom = CatalogData.allRooms.firstWhere(
      (room) => room.id == 'living',
    );
    final livingRoomLabel = CatalogData.roomName(localizations, livingRoom);

    await tester.tap(find.text(livingRoomLabel).first);
    await tester.pumpAndSettle();

    expect(state.visitedRoomIds.contains('living'), isTrue);
    expect(find.byType(DeviceSelectionScreen), findsOneWidget);
  });

  testWidgets('add custom room dialog adds room and navigates into it', (
    tester,
  ) async {
    _configureLargeViewport(tester);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final state = SurveyState();

    await tester.pumpWidget(_buildTestApp(RoomSelectionScreen(state: state)));
    await tester.pumpAndSettle();

    final context = tester.element(find.byType(Scaffold).first);
    final localizations = AppLocalizations.of(context)!;

    await tester.tap(find.text(localizations.addRoom));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField).first, 'Music Room');
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(ElevatedButton, localizations.add));
    await tester.pumpAndSettle();

    expect(state.customRooms, hasLength(1));
    expect(state.customRooms.first.name, 'Music Room');
    expect(find.byType(DeviceSelectionScreen), findsOneWidget);
  });

  testWidgets('deleting a custom room removes it from state', (tester) async {
    _configureLargeViewport(tester);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final state = SurveyState();
    state.addCustomRoom('Temporary Room', Icons.sports_esports);

    await tester.pumpWidget(_buildTestApp(RoomSelectionScreen(state: state)));
    await tester.pumpAndSettle();

    final context = tester.element(find.byType(Scaffold).first);
    final localizations = AppLocalizations.of(context)!;

    expect(state.customRooms, hasLength(1));

    await tester.tap(find.byIcon(Icons.close).first);
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(TextButton, localizations.delete));
    await tester.pumpAndSettle();

    expect(state.customRooms, isEmpty);
  });

  testWidgets('results button enables only when results are available', (
    tester,
  ) async {
    _configureLargeViewport(tester);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final state = SurveyState();

    await tester.pumpWidget(_buildTestApp(RoomSelectionScreen(state: state)));
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
    state.addDevice(template, 'living', 'room_living');
    final instance = state.devices.single;
    for (final question in instance.questions) {
      instance.setAnswer(question.id, QuestionAnswer.yes);
    }
    state.markRoomCompleted('living');
    state.notifyUpdate();

    await tester.pumpAndSettle();

    expect(resultsButton().onPressed, isNotNull);

    await tester.tap(find.widgetWithText(FilledButton, localizations.results));
    await tester.pumpAndSettle();

    expect(find.byType(SummaryScreen), findsOneWidget);
  });
}
