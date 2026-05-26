import 'package:flutter_test/flutter_test.dart';

import 'package:simplications/data/catalog_data.dart';

void main() {
  group('CatalogData device ordering', () {
    test('sorts living room devices by popularity', () {
      final deviceIds = CatalogData.devicesForRoom(
        'living',
      ).map((device) => device.id).toList();

      expect(
        deviceIds,
        equals([
          'smart_tv',
          'smart_light',
          'smart_speaker',
          'smart_plug',
          'smart_thermostat',
          'smart_display',
          'indoor_camera',
          'robot_vacuum',
          'simple_sensor',
          'smart_hub',
          'smart_blind',
          'smart_toy',
        ]),
      );
    });

    test('keeps child bedroom inherited devices in popularity order', () {
      final deviceIds = CatalogData.devicesForRoom(
        'child_bedroom',
      ).map((device) => device.id).toList();

      expect(
        deviceIds,
        equals([
          'smart_tv',
          'smart_light',
          'smart_speaker',
          'smart_plug',
          'smart_thermostat',
          'smart_display',
          'indoor_camera',
          'robot_vacuum',
          'simple_sensor',
          'smart_blind',
          'baby_monitor',
          'smart_toy',
        ]),
      );
    });
  });
}
