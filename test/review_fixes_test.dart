import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pdf/src/pdf/font/ttf_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:simplications/data/catalog_data.dart';
import 'package:simplications/models/device.dart';
import 'package:simplications/models/survey_state.dart';

DeviceInstance _instance(String templateId) => DeviceInstance(
  instanceId: 'i_$templateId',
  template: CatalogData.allDeviceTemplates.firstWhere(
    (t) => t.id == templateId,
  ),
  roomId: 'living',
  roomName: 'room_living',
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('embedded PDF font covers every character of every locale', () async {
    final font = TtfParser(
      await rootBundle.load('assets/fonts/Roboto-Regular.ttf'),
    );
    for (final file in Directory('lib/l10n').listSync().whereType<File>()) {
      if (!file.path.endsWith('.arb')) continue;
      final data = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
      for (final entry in data.entries) {
        final value = entry.value;
        if (entry.key.startsWith('@') || value is! String) continue;
        for (final rune in value.runes) {
          if (rune == 0x0A || rune == 0x20) continue;
          expect(
            font.charToGlyphIndexMap.containsKey(rune),
            isTrue,
            reason: '${file.path} ${entry.key}: U+${rune.toRadixString(16)}',
          );
        }
      }
    }
  });

  test('cameras and locks ask about updates; cameras about password', () {
    final camera = _instance('indoor_camera').questions.map((q) => q.id);
    expect(camera, containsAll(['password', 'updates', 'video_encryption']));
    final lock = _instance('smart_lock').questions.map((q) => q.id);
    expect(lock, containsAll(['password', 'updates']));
  });

  test(
    'malformed custom entries are skipped without losing the rest',
    () async {
      SharedPreferences.setMockInitialValues({
        'survey_state_v1': jsonEncode({
          'completedRoomIds': ['living'],
          'customRooms': [
            {'name': 'no id'},
            {'id': 'custom_1', 'name': 'Good', 'iconKey': 'home'},
          ],
          'customDevices': [
            {'id': 'custom_d'},
            {
              'id': 'custom_d2',
              'name': 'Gadget',
              'baseRiskScore': 10,
              'roomIds': ['custom_1'],
            },
          ],
          'devices': [
            {'templateId': 'custom_d2', 'roomId': 'custom_1'},
          ],
        }),
      });
      final state = SurveyState();
      await state.loadFromStorage();
      expect(state.customRooms.map((r) => r.id), ['custom_1']);
      expect(state.customDevices.map((d) => d.id), ['custom_d2']);
      expect(state.devices, hasLength(1));
      expect(state.completedRoomIds, {'living'});
    },
  );
}
