import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/catalog_data.dart';
import 'device.dart';
import 'room.dart';

/// Registry of all icon keys used in the app, mapping string keys to const
/// [IconData] values from [Icons].  This allows icons to be persisted as a
/// short string while keeping every [IconData] instance a compile-time constant
/// (required for Flutter's release-build icon tree shaking).
///
/// When adding icons to the app UI, add the corresponding entry here.
const Map<String, IconData> kIconRegistry = {
  'weekend': Icons.weekend,
  'kitchen': Icons.kitchen,
  'hotel': Icons.hotel,
  'bathtub': Icons.bathtub,
  'computer': Icons.computer,
  'meeting_room': Icons.meeting_room,
  'yard': Icons.yard,
  'storage': Icons.storage,
  'home': Icons.home,
  'living': Icons.living,
  'local_library': Icons.local_library,
  'fitness_center': Icons.fitness_center,
  'sports_esports': Icons.sports_esports,
  'roofing': Icons.roofing,
  'food_bank': Icons.food_bank,
  'speaker': Icons.speaker,
  'videocam': Icons.videocam,
  'tv': Icons.tv,
  'thermostat': Icons.thermostat,
  'lightbulb': Icons.lightbulb,
  'lock': Icons.lock,
  'electrical_services': Icons.electrical_services,
  'window': Icons.window,
  'cleaning_services': Icons.cleaning_services,
  'watch': Icons.watch,
  'toys': Icons.toys,
  'router': Icons.router,
  'print': Icons.print,
  'sensors': Icons.sensors,
  'water_drop': Icons.water_drop,
  'light_mode': Icons.light_mode,
  'tablet_android': Icons.tablet_android,
  'camera_outdoor': Icons.camera_outdoor,
  'doorbell': Icons.doorbell,
  'child_care': Icons.child_care,
  'microwave': Icons.microwave,
  'coffee': Icons.coffee,
  'local_laundry_service': Icons.local_laundry_service,
  'hub': Icons.hub,
  'bolt': Icons.bolt,
  'monitor_weight': Icons.monitor_weight,
};

/// Reverse lookup: `'$codePoint:$fontFamily'` → registry key.
/// Built once from [kIconRegistry] for O(1) icon-to-key lookups.
final Map<String, String> _iconKeyByFingerprint = {
  for (final e in kIconRegistry.entries)
    '${e.value.codePoint}:${e.value.fontFamily}': e.key,
};

class SurveyState extends ChangeNotifier {
  static const String _storageKey = 'survey_state_v1';

  final Set<String> completedRoomIds = {};
  final List<DeviceInstance> devices = [];
  final List<Room> customRooms = [];
  final List<DeviceTemplate> customDevices = [];

  void markRoomCompleted(String roomId) {
    if (completedRoomIds.add(roomId)) {
      _changed();
    }
  }

  bool isRoomCompleted(String roomId) => completedRoomIds.contains(roomId);

  void addDevice(DeviceTemplate template, String roomId, String roomName) {
    if (devices.any(
      (d) => d.template.id == template.id && d.roomId == roomId,
    )) {
      return;
    }
    devices.add(
      DeviceInstance(
        instanceId: '${roomId}_${template.id}',
        template: template,
        roomId: roomId,
        roomName: roomName,
      ),
    );
    _changed();
  }

  void removeDevice(String instanceId) {
    final before = devices.length;
    devices.removeWhere((d) => d.instanceId == instanceId);
    if (devices.length != before) {
      _changed();
    }
  }

  bool isDeviceAdded(String roomId, String templateId) =>
      devices.any((d) => d.roomId == roomId && d.template.id == templateId);

  List<DeviceInstance> devicesForRoom(String roomId) =>
      devices.where((d) => d.roomId == roomId).toList();

  /// Add a custom room
  void addCustomRoom(String name, IconData icon) {
    final newRoom = Room(
      id: 'custom_${DateTime.now().millisecondsSinceEpoch}',
      name: name,
      icon: icon,
    );
    customRooms.add(newRoom);
    _changed();
  }

  /// Remove a custom room (and its devices)
  void removeCustomRoom(String roomId) {
    final beforeRooms = customRooms.length;
    final beforeDevices = devices.length;
    final hadCompleted = completedRoomIds.contains(roomId);
    customRooms.removeWhere((r) => r.id == roomId);
    devices.removeWhere((d) => d.roomId == roomId);
    completedRoomIds.remove(roomId);
    if (customRooms.length != beforeRooms ||
        devices.length != beforeDevices ||
        hadCompleted) {
      _changed();
    }
  }

  /// Add a custom device
  void addCustomDevice(
    String name,
    IconData icon,
    int baseRiskScore, {
    bool hasCamera = false,
    bool hasMicrophone = false,
  }) {
    final newDevice = DeviceTemplate(
      id: 'custom_${DateTime.now().millisecondsSinceEpoch}',
      name: name,
      icon: icon,
      baseRiskScore: baseRiskScore,
      hasCamera: hasCamera,
      hasMicrophone: hasMicrophone,
      roomIds: [], // Will be determined at add-time
      deviceType: 'custom',
      isCustom: true,
    );
    customDevices.add(newDevice);
    _changed();
  }

  /// Remove a custom device (and its instances)
  void removeCustomDevice(String deviceId) {
    final beforeTemplates = customDevices.length;
    final beforeInstances = devices.length;
    customDevices.removeWhere((d) => d.id == deviceId);
    devices.removeWhere((d) => d.template.id == deviceId);
    if (customDevices.length != beforeTemplates ||
        devices.length != beforeInstances) {
      _changed();
    }
  }

  void notifyUpdate() => _changed();

  Future<void> loadFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_storageKey);
    if (jsonString == null || jsonString.isEmpty) {
      return;
    }

    try {
      final data = jsonDecode(jsonString) as Map<String, dynamic>;

      completedRoomIds
        ..clear()
        ..addAll(
          (data['completedRoomIds'] as List<dynamic>? ?? const [])
              .whereType<String>(),
        );

      customRooms
        ..clear()
        ..addAll(
          (data['customRooms'] as List<dynamic>? ?? const [])
              .whereType<Map>()
              .map((e) => Map<String, dynamic>.from(e))
              .map(
                (e) => Room(
                  id: e['id'] as String,
                  name: e['name'] as String,
                  icon: _resolveIcon(e),
                ),
              ),
        );

      customDevices
        ..clear()
        ..addAll(
          (data['customDevices'] as List<dynamic>? ?? const [])
              .whereType<Map>()
              .map((e) => Map<String, dynamic>.from(e))
              .map(
                (e) => DeviceTemplate(
                  id: e['id'] as String,
                  name: e['name'] as String,
                  icon: _resolveIcon(e),
                  baseRiskScore: (e['baseRiskScore'] as num).toInt(),
                  hasCamera: e['hasCamera'] as bool? ?? false,
                  hasMicrophone: e['hasMicrophone'] as bool? ?? false,
                  roomIds: const [],
                  deviceType: 'custom',
                  isCustom: true,
                ),
              ),
        );

      final templateById = <String, DeviceTemplate>{
        for (final template in CatalogData.allDeviceTemplates)
          template.id: template,
        for (final template in customDevices) template.id: template,
      };

      devices.clear();
      for (final dynamic item
          in (data['devices'] as List<dynamic>? ?? const [])) {
        if (item is! Map) {
          continue;
        }
        final entry = Map<String, dynamic>.from(item);
        final templateId = entry['templateId'] as String?;
        if (templateId == null) {
          continue;
        }
        final template = templateById[templateId];
        if (template == null) {
          continue;
        }

        final instance = DeviceInstance(
          instanceId: entry['instanceId'] as String,
          template: template,
          roomId: entry['roomId'] as String,
          roomName: entry['roomName'] as String,
        );

        instance.passwordChanged = entry['passwordChanged'] as bool?;
        instance.autoUpdatesEnabled = entry['autoUpdatesEnabled'] as bool?;
        instance.separateNetwork = entry['separateNetwork'] as bool?;
        instance.householdInformed = entry['householdInformed'] as bool?;
        instance.permissionsReduced = entry['permissionsReduced'] as bool?;
        instance.cameraConsentGiven = entry['cameraConsentGiven'] as bool?;
        instance.micDeactivatedWhenUnused =
            entry['micDeactivatedWhenUnused'] as bool?;

        final storedSpecific = Map<String, dynamic>.from(
          entry['deviceSpecificAnswers'] as Map? ?? const {},
        );
        instance.deviceSpecificAnswers
          ..clear()
          ..addAll(
            storedSpecific.map((key, value) => MapEntry(key, value as bool)),
          );

        devices.add(instance);
      }

      notifyListeners();
    } catch (_) {
      // Ignore malformed persisted data and continue with a fresh in-memory state.
    }
  }

  Future<void> saveToStorage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_storageKey, jsonEncode(_toJson()));
  }

  Future<void> clearStorage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_storageKey);
  }

  Future<void> reset() async {
    completedRoomIds.clear();
    devices.clear();
    customRooms.clear();
    customDevices.clear();
    await clearStorage();
    notifyListeners();
  }

  Map<String, dynamic> _toJson() {
    return {
      'completedRoomIds': completedRoomIds.toList(),
      'customRooms': customRooms
          .map(
            (room) => {
              'id': room.id,
              'name': room.name,
              'iconKey': _iconToKey(room.icon),
            },
          )
          .toList(),
      'customDevices': customDevices
          .map(
            (device) => {
              'id': device.id,
              'name': device.name,
              'iconKey': _iconToKey(device.icon),
              'baseRiskScore': device.baseRiskScore,
              'hasCamera': device.hasCamera,
              'hasMicrophone': device.hasMicrophone,
            },
          )
          .toList(),
      'devices': devices
          .map(
            (device) => {
              'instanceId': device.instanceId,
              'templateId': device.template.id,
              'roomId': device.roomId,
              'roomName': device.roomName,
              'passwordChanged': device.passwordChanged,
              'autoUpdatesEnabled': device.autoUpdatesEnabled,
              'separateNetwork': device.separateNetwork,
              'householdInformed': device.householdInformed,
              'permissionsReduced': device.permissionsReduced,
              'cameraConsentGiven': device.cameraConsentGiven,
              'micDeactivatedWhenUnused': device.micDeactivatedWhenUnused,
              'deviceSpecificAnswers': device.deviceSpecificAnswers,
            },
          )
          .toList(),
    };
  }

  /// Returns the registry key for [icon], falling back to `'home'` for
  /// any icon that is not in [kIconRegistry].
  String _iconToKey(IconData icon) {
    final fingerprint = '${icon.codePoint}:${icon.fontFamily}';
    return _iconKeyByFingerprint[fingerprint] ?? 'home';
  }

  /// Returns the [IconData] for [key] from [kIconRegistry], defaulting to
  /// [Icons.home] when the key is unknown.
  IconData _iconFromKey(String key) => kIconRegistry[key] ?? Icons.home;

  /// Resolves an icon from a persisted entry map.
  ///
  /// Prefers the new `iconKey` field; falls back to the legacy `icon` map
  /// (which stored `codePoint` / `fontFamily`), mapping it to the closest
  /// registry entry by code-point.  Defaults to [Icons.home] if nothing
  /// matches.
  IconData _resolveIcon(Map<String, dynamic> e) {
    final key = e['iconKey'] as String?;
    if (key != null) {
      return _iconFromKey(key);
    }
    // Legacy path: icon was stored as a map with codePoint/fontFamily/...
    final iconMap = e['icon'];
    if (iconMap is Map) {
      final codePoint = (iconMap['codePoint'] as num?)?.toInt();
      final fontFamily = iconMap['fontFamily'] as String?;
      if (codePoint != null) {
        final fingerprint = '$codePoint:$fontFamily';
        final key = _iconKeyByFingerprint[fingerprint];
        if (key != null) {
          return kIconRegistry[key]!;
        }
      }
    }
    return Icons.home;
  }

  void _changed() {
    unawaited(saveToStorage());
    notifyListeners();
  }
}
