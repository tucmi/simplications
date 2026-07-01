import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:simplications/data/catalog_data.dart';
import 'package:simplications/models/device.dart';
import 'package:simplications/models/survey_state.dart';

void main() {
  group('kIconRegistry', () {
    test('contains all expected icon keys', () {
      expect(kIconRegistry['home'], equals(Icons.home));
      expect(kIconRegistry['kitchen'], equals(Icons.kitchen));
      expect(kIconRegistry['tv'], equals(Icons.tv));
      expect(kIconRegistry['weekend'], equals(Icons.weekend));
      expect(kIconRegistry['bathtub'], equals(Icons.bathtub));
    });

    test('every value is a non-null IconData', () {
      for (final entry in kIconRegistry.entries) {
        expect(entry.value, isA<IconData>(), reason: 'key: ${entry.key}');
      }
    });
  });

  group('SurveyState icon serialization', () {
    setUp(() {
      SharedPreferences.setMockInitialValues({});
    });

    test('saving a custom room stores iconKey as a string', () async {
      final state = SurveyState();
      state.addCustomRoom('Test Room', Icons.kitchen);
      // Explicitly flush the save so the mock prefs are populated.
      await state.saveToStorage();

      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString('survey_state_v1');
      expect(raw, isNotNull);

      final data = jsonDecode(raw!) as Map<String, dynamic>;
      final rooms = data['customRooms'] as List<dynamic>;
      expect(rooms, hasLength(1));

      final room = rooms.first as Map<String, dynamic>;
      expect(room['iconKey'], equals('kitchen'));
      expect(
        room.containsKey('icon'),
        isFalse,
        reason: 'legacy icon map must not be written any more',
      );
    });

    test('loading a room saved with iconKey returns expected icon', () async {
      SharedPreferences.setMockInitialValues({
        'survey_state_v1': jsonEncode({
          'completedRoomIds': <String>[],
          'customRooms': [
            {'id': 'custom_1', 'name': 'My Room', 'iconKey': 'kitchen'},
          ],
          'customDevices': <Map>[],
          'devices': <Map>[],
        }),
      });

      final state = SurveyState();
      await state.loadFromStorage();

      expect(state.customRooms, hasLength(1));
      expect(state.customRooms.first.icon, equals(Icons.kitchen));
    });

    test('loading a device saved with iconKey returns expected icon', () async {
      SharedPreferences.setMockInitialValues({
        'survey_state_v1': jsonEncode({
          'completedRoomIds': <String>[],
          'customRooms': <Map>[],
          'customDevices': [
            {
              'id': 'custom_2',
              'name': 'My Speaker',
              'iconKey': 'speaker',
              'baseRiskScore': 30,
              'hasCamera': false,
              'hasMicrophone': false,
            },
          ],
          'devices': <Map>[],
        }),
      });

      final state = SurveyState();
      await state.loadFromStorage();

      expect(state.customDevices, hasLength(1));
      expect(state.customDevices.first.icon, equals(Icons.speaker));
    });

    test(
      'loading legacy icon map (codePoint) returns the matching icon',
      () async {
        SharedPreferences.setMockInitialValues({
          'survey_state_v1': jsonEncode({
            'completedRoomIds': <String>[],
            'customRooms': [
              {
                'id': 'custom_1',
                'name': 'Legacy Room',
                'icon': {
                  'codePoint': Icons.kitchen.codePoint,
                  'fontFamily': Icons.kitchen.fontFamily,
                  'fontPackage': null,
                  'matchTextDirection': false,
                },
              },
            ],
            'customDevices': <Map>[],
            'devices': <Map>[],
          }),
        });

        final state = SurveyState();
        await state.loadFromStorage();

        expect(state.customRooms, hasLength(1));
        expect(state.customRooms.first.icon, equals(Icons.kitchen));
      },
    );

    test(
      'loading legacy icon map with unknown codePoint defaults to Icons.home',
      () async {
        SharedPreferences.setMockInitialValues({
          'survey_state_v1': jsonEncode({
            'completedRoomIds': <String>[],
            'customRooms': [
              {
                'id': 'custom_1',
                'name': 'Unknown Icon Room',
                'icon': {
                  'codePoint': 0xFFFFF, // not in registry
                  'fontFamily': 'MaterialIcons',
                  'fontPackage': null,
                  'matchTextDirection': false,
                },
              },
            ],
            'customDevices': <Map>[],
            'devices': <Map>[],
          }),
        });

        final state = SurveyState();
        await state.loadFromStorage();

        expect(state.customRooms, hasLength(1));
        expect(state.customRooms.first.icon, equals(Icons.home));
      },
    );

    test('unknown iconKey defaults to Icons.home', () async {
      SharedPreferences.setMockInitialValues({
        'survey_state_v1': jsonEncode({
          'completedRoomIds': <String>[],
          'customRooms': [
            {
              'id': 'custom_1',
              'name': 'Future Icon Room',
              'iconKey': 'some_future_icon_not_in_registry',
            },
          ],
          'customDevices': <Map>[],
          'devices': <Map>[],
        }),
      });

      final state = SurveyState();
      await state.loadFromStorage();

      expect(state.customRooms, hasLength(1));
      expect(state.customRooms.first.icon, equals(Icons.home));
    });

    test('results require one completed room with a finished device', () {
      final state = SurveyState();
      final room = CatalogData.allRooms.first;
      final template = CatalogData.devicesForRoom(room.id).first;

      state.addDevice(template, room.id, room.name);
      final device = state.devices.first;
      for (final question in device.questions) {
        device.setAnswer(question.id, QuestionAnswer.yes);
      }
      state.notifyUpdate();

      expect(state.hasFinishedDeviceInRoom(room.id), isTrue);
      expect(state.hasResultsAvailable, isFalse);

      state.markRoomCompleted(room.id);
      expect(state.hasResultsAvailable, isTrue);
    });

    test('same template can be added multiple times to the same room', () {
      final state = SurveyState();
      final room = CatalogData.allRooms.first;
      final template = CatalogData.devicesForRoom(room.id).first;

      final first = state.addDevice(template, room.id, room.name);
      final second = state.addDevice(template, room.id, room.name);

      expect(state.devicesForRoom(room.id), hasLength(2));
      expect(first.instanceId, isNot(second.instanceId));
    });

    test('completed room progress is restored after restart', () async {
      final state = SurveyState();
      final room = CatalogData.allRooms.first;
      final template = CatalogData.devicesForRoom(room.id).first;

      state.addDevice(template, room.id, room.name);
      final device = state.devices.first;
      for (final question in device.questions) {
        device.setAnswer(question.id, QuestionAnswer.yes);
      }
      state.markRoomCompleted(room.id);
      await state.saveToStorage();

      final reloaded = SurveyState();
      await reloaded.loadFromStorage();

      expect(reloaded.completedRoomIds.contains(room.id), isTrue);
      expect(reloaded.hasFinishedDeviceInRoom(room.id), isTrue);
      expect(reloaded.hasResultsAvailable, isTrue);
    });

    test('legacy sensor template ids restore as the merged sensor', () async {
      SharedPreferences.setMockInitialValues({
        'survey_state_v1': jsonEncode({
          'completedRoomIds': <String>[],
          'customRooms': <Map>[],
          'customDevices': <Map>[],
          'devices': [
            {
              'instanceId': 'living_humidity_sensor',
              'templateId': 'humidity_sensor',
              'roomId': 'living',
              'roomName': 'living',
              'deviceSpecificAnswers': {
                'sensor_frequency': 'yes',
                'sensor_data_deletion': 'no',
              },
            },
          ],
        }),
      });

      final state = SurveyState();
      await state.loadFromStorage();

      expect(state.devices, hasLength(1));
      expect(state.devices.single.template.id, equals('simple_sensor'));
      expect(
        state.devices.single.answerFor('sensor_data_deletion'),
        equals(QuestionAnswer.no),
      );
    });
  });
}
