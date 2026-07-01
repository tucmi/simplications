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
  static const Map<String, String> _legacyTemplateIdAliases = {
    'humidity_sensor': 'simple_sensor',
    'temperature_sensor': 'simple_sensor',
    'light_sensor': 'simple_sensor',
  };

  final Set<String> completedRoomIds = {};
  final Set<String> visitedRoomIds = {};
  final Set<String> noDeviceRoomIds = {};
  final List<DeviceInstance> devices = [];
  final List<Room> customRooms = [];
  final List<DeviceTemplate> customDevices = [];
  bool _expertModeEnabled = false;

  bool get expertModeEnabled => _expertModeEnabled;

  void setExpertModeEnabled(bool enabled) {
    if (_expertModeEnabled == enabled) {
      return;
    }
    _expertModeEnabled = enabled;
    for (final device in devices) {
      device.expertModeEnabled = enabled;
    }
    _changed();
  }

  void markRoomCompleted(String roomId) {
    final changed =
        completedRoomIds.add(roomId) || noDeviceRoomIds.remove(roomId);
    visitedRoomIds.add(roomId);
    if (changed) {
      _changed();
    }
  }

  void markRoomVisited(String roomId) {
    if (visitedRoomIds.add(roomId)) {
      _changed();
    }
  }

  bool hasFinishedDeviceInRoom(String roomId) =>
      devicesForRoom(roomId).any((device) => device.isFullyAnswered);

  bool isRoomCompleted(String roomId) =>
      completedRoomIds.contains(roomId) ||
      noDeviceRoomIds.contains(roomId) ||
      hasFinishedDeviceInRoom(roomId);

  bool isRoomIncomplete(String roomId) =>
      visitedRoomIds.contains(roomId) && !isRoomCompleted(roomId);

  DeviceInstance addDevice(
    DeviceTemplate template,
    String roomId,
    String roomName,
  ) {
    visitedRoomIds.add(roomId);
    noDeviceRoomIds.remove(roomId);
    completedRoomIds.remove(roomId);
    final instance = DeviceInstance(
      instanceId: _nextInstanceId(roomId, template.id),
      template: template,
      roomId: roomId,
      roomName: roomName,
      expertModeEnabled: _expertModeEnabled,
    );
    devices.add(instance);
    _changed();
    return instance;
  }

  String _nextInstanceId(String roomId, String templateId) {
    final base =
        '${roomId}_${templateId}_${DateTime.now().microsecondsSinceEpoch}';
    var candidate = base;
    var suffix = 1;
    while (devices.any((device) => device.instanceId == candidate)) {
      candidate = '${base}_$suffix';
      suffix += 1;
    }
    return candidate;
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

  List<DeviceInstance> evaluatedDevicesForRoom(String roomId) =>
      devicesForRoom(roomId).where((device) => device.isFullyAnswered).toList();

  RiskLevel? worstRiskLevelForRoom(String roomId) {
    final evaluated = evaluatedDevicesForRoom(roomId);
    if (evaluated.isEmpty) {
      return null;
    }
    if (evaluated.any((device) => device.riskLevel == RiskLevel.high)) {
      return RiskLevel.high;
    }
    if (evaluated.any((device) => device.riskLevel == RiskLevel.medium)) {
      return RiskLevel.medium;
    }
    return RiskLevel.low;
  }

  int evaluatedDeviceCountForRoom(String roomId) =>
      evaluatedDevicesForRoom(roomId).length;

  bool get hasAnyData =>
      completedRoomIds.isNotEmpty ||
      visitedRoomIds.isNotEmpty ||
      noDeviceRoomIds.isNotEmpty ||
      devices.isNotEmpty ||
      customRooms.isNotEmpty ||
      customDevices.isNotEmpty;

  bool get hasResultsAvailable => completedRoomIds.any(hasFinishedDeviceInRoom);

  void markRoomWithoutDevices(String roomId) {
    final beforeDevices = devices.length;
    final hadCompleted = completedRoomIds.contains(roomId);
    final hadNoDevices = noDeviceRoomIds.contains(roomId);
    visitedRoomIds.add(roomId);
    completedRoomIds.add(roomId);
    noDeviceRoomIds.add(roomId);
    devices.removeWhere((device) => device.roomId == roomId);
    if (devices.length != beforeDevices || !hadCompleted || !hadNoDevices) {
      _changed();
    }
  }

  /// Add a custom room and return it so callers can navigate immediately.
  Room addCustomRoom(String name, IconData icon) {
    final newRoom = Room(
      id: 'custom_${DateTime.now().millisecondsSinceEpoch}',
      name: name,
      icon: icon,
    );
    customRooms.add(newRoom);
    _changed();
    return newRoom;
  }

  /// Remove a custom room (and its devices)
  void removeCustomRoom(String roomId) {
    final beforeRooms = customRooms.length;
    final removedCustomDeviceIds = customDevices
        .where((d) => d.roomIds.contains(roomId))
        .map((d) => d.id)
        .toSet();
    final beforeTemplates = customDevices.length;
    final beforeDevices = devices.length;
    final hadCompleted = completedRoomIds.contains(roomId);
    final hadVisited = visitedRoomIds.contains(roomId);
    final hadNoDevices = noDeviceRoomIds.contains(roomId);
    customRooms.removeWhere((r) => r.id == roomId);
    customDevices.removeWhere((d) => d.roomIds.contains(roomId));
    devices.removeWhere((d) => d.roomId == roomId);
    if (removedCustomDeviceIds.isNotEmpty) {
      devices.removeWhere(
        (d) => removedCustomDeviceIds.contains(d.template.id),
      );
    }
    completedRoomIds.remove(roomId);
    visitedRoomIds.remove(roomId);
    noDeviceRoomIds.remove(roomId);
    if (customRooms.length != beforeRooms ||
        customDevices.length != beforeTemplates ||
        devices.length != beforeDevices ||
        hadCompleted ||
        hadVisited ||
        hadNoDevices) {
      _changed();
    }
  }

  /// Add a custom device
  void addCustomDevice(
    String roomId,
    String name,
    IconData icon,
    int baseRiskScore, {
    bool hasCamera = false,
    bool hasMicrophone = false,
  }) {
    visitedRoomIds.add(roomId);
    noDeviceRoomIds.remove(roomId);
    completedRoomIds.remove(roomId);
    final newDevice = DeviceTemplate(
      id: 'custom_${DateTime.now().millisecondsSinceEpoch}',
      name: name,
      icon: icon,
      baseRiskScore: baseRiskScore,
      hasCamera: hasCamera,
      hasMicrophone: hasMicrophone,
      roomIds: [roomId],
      deviceType: 'custom',
      isCustom: true,
    );
    customDevices.add(newDevice);
    _changed();
  }

  List<DeviceTemplate> customDevicesForRoom(String roomId) =>
      customDevices.where((device) => device.roomIds.contains(roomId)).toList();

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

      _expertModeEnabled = data['expertModeEnabled'] as bool? ?? false;

      completedRoomIds
        ..clear()
        ..addAll(
          (data['completedRoomIds'] as List<dynamic>? ?? const [])
              .whereType<String>(),
        );

      visitedRoomIds
        ..clear()
        ..addAll(
          (data['visitedRoomIds'] as List<dynamic>? ?? const [])
              .whereType<String>(),
        );

      noDeviceRoomIds
        ..clear()
        ..addAll(
          (data['noDeviceRoomIds'] as List<dynamic>? ?? const [])
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
                  roomIds: (e['roomIds'] as List<dynamic>? ?? const [])
                      .whereType<String>()
                      .toList(),
                  deviceType: 'custom',
                  isCustom: true,
                ),
              ),
        );

      // Backward compatibility: infer room ownership for older saved custom
      // devices that did not persist roomIds.
      final customRoomIdsByTemplate = <String, Set<String>>{};
      for (final dynamic item
          in (data['devices'] as List<dynamic>? ?? const [])) {
        if (item is! Map) {
          continue;
        }
        final entry = Map<String, dynamic>.from(item);
        final templateId = entry['templateId'] as String?;
        final roomId = entry['roomId'] as String?;
        if (templateId == null || roomId == null) {
          continue;
        }
        customRoomIdsByTemplate
            .putIfAbsent(templateId, () => <String>{})
            .add(roomId);
      }
      for (final template in customDevices) {
        if (template.roomIds.isNotEmpty) {
          continue;
        }
        final inferred = customRoomIdsByTemplate[template.id];
        if (inferred != null && inferred.isNotEmpty) {
          template.roomIds.addAll(inferred);
        }
      }

      final templateById = <String, DeviceTemplate>{
        for (final template in CatalogData.allDeviceTemplates)
          template.id: template,
        for (final template in customDevices) template.id: template,
      };

      devices.clear();
      final restoredInstanceIds = <String>{};
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
        final normalizedTemplateId =
            _legacyTemplateIdAliases[templateId] ?? templateId;
        final template = templateById[normalizedTemplateId];
        if (template == null) {
          continue;
        }
        final roomId = entry['roomId'] as String;
        final restoredInstanceId =
            entry['instanceId'] as String? ??
            _nextInstanceId(roomId, template.id);
        if (!restoredInstanceIds.add(restoredInstanceId)) {
          continue;
        }

        final instance = DeviceInstance(
          instanceId: restoredInstanceId,
          template: template,
          roomId: roomId,
          roomName: entry['roomName'] as String,
          expertModeEnabled: _expertModeEnabled,
        );

        instance.passwordChanged = questionAnswerFromStored(
          entry['passwordChanged'],
        );
        instance.autoUpdatesEnabled = questionAnswerFromStored(
          entry['autoUpdatesEnabled'],
        );
        instance.separateNetwork = questionAnswerFromStored(
          entry['separateNetwork'],
        );
        instance.householdInformed = questionAnswerFromStored(
          entry['householdInformed'],
        );
        instance.permissionsReduced = questionAnswerFromStored(
          entry['permissionsReduced'],
        );
        instance.cameraConsentGiven = questionAnswerFromStored(
          entry['cameraConsentGiven'],
        );
        instance.micDeactivatedWhenUnused = questionAnswerFromStored(
          entry['micDeactivatedWhenUnused'],
        );

        final storedSpecific = Map<String, dynamic>.from(
          entry['deviceSpecificAnswers'] as Map? ?? const {},
        );
        instance.deviceSpecificAnswers
          ..clear()
          ..addEntries(
            storedSpecific.entries
                .map(
                  (entry) => MapEntry(
                    entry.key,
                    questionAnswerFromStored(entry.value),
                  ),
                )
                .where((entry) => entry.value != null)
                .map((entry) => MapEntry(entry.key, entry.value!)),
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
    visitedRoomIds.clear();
    noDeviceRoomIds.clear();
    devices.clear();
    customRooms.clear();
    customDevices.clear();
    _expertModeEnabled = false;
    await clearStorage();
    notifyListeners();
  }

  Map<String, dynamic> _toJson() {
    return {
      'expertModeEnabled': _expertModeEnabled,
      'completedRoomIds': completedRoomIds.toList(),
      'visitedRoomIds': visitedRoomIds.toList(),
      'noDeviceRoomIds': noDeviceRoomIds.toList(),
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
              'roomIds': device.roomIds,
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
              'passwordChanged': device.passwordChanged?.wireValue,
              'autoUpdatesEnabled': device.autoUpdatesEnabled?.wireValue,
              'separateNetwork': device.separateNetwork?.wireValue,
              'householdInformed': device.householdInformed?.wireValue,
              'permissionsReduced': device.permissionsReduced?.wireValue,
              'cameraConsentGiven': device.cameraConsentGiven?.wireValue,
              'micDeactivatedWhenUnused':
                  device.micDeactivatedWhenUnused?.wireValue,
              'deviceSpecificAnswers': device.deviceSpecificAnswers.map(
                (key, value) => MapEntry(key, value.wireValue),
              ),
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
