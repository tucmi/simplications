import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/catalog_data.dart';
import 'device.dart';
import 'room.dart';

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
                  icon: _iconFromJson(
                    Map<String, dynamic>.from(e['icon'] as Map),
                  ),
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
                  icon: _iconFromJson(
                    Map<String, dynamic>.from(e['icon'] as Map),
                  ),
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
              'icon': _iconToJson(room.icon),
            },
          )
          .toList(),
      'customDevices': customDevices
          .map(
            (device) => {
              'id': device.id,
              'name': device.name,
              'icon': _iconToJson(device.icon),
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

  Map<String, dynamic> _iconToJson(IconData icon) {
    return {
      'codePoint': icon.codePoint,
      'fontFamily': icon.fontFamily,
      'fontPackage': icon.fontPackage,
      'matchTextDirection': icon.matchTextDirection,
    };
  }

  IconData _iconFromJson(Map<String, dynamic> json) {
    return IconData(
      (json['codePoint'] as num).toInt(),
      fontFamily: json['fontFamily'] as String?,
      fontPackage: json['fontPackage'] as String?,
      matchTextDirection: json['matchTextDirection'] as bool? ?? false,
    );
  }

  void _changed() {
    unawaited(saveToStorage());
    notifyListeners();
  }
}
