import 'package:flutter/material.dart';
import 'device.dart';
import 'room.dart';

class SurveyState extends ChangeNotifier {
  final Set<String> completedRoomIds = {};
  final List<DeviceInstance> devices = [];
  final List<Room> customRooms = [];
  final List<DeviceTemplate> customDevices = [];

  void markRoomCompleted(String roomId) {
    completedRoomIds.add(roomId);
    notifyListeners();
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
    notifyListeners();
  }

  void removeDevice(String instanceId) {
    devices.removeWhere((d) => d.instanceId == instanceId);
    notifyListeners();
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
    notifyListeners();
  }

  /// Remove a custom room (and its devices)
  void removeCustomRoom(String roomId) {
    customRooms.removeWhere((r) => r.id == roomId);
    devices.removeWhere((d) => d.roomId == roomId);
    completedRoomIds.remove(roomId);
    notifyListeners();
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
    notifyListeners();
  }

  /// Remove a custom device (and its instances)
  void removeCustomDevice(String deviceId) {
    customDevices.removeWhere((d) => d.id == deviceId);
    devices.removeWhere((d) => d.template.id == deviceId);
    notifyListeners();
  }

  void notifyUpdate() => notifyListeners();
}
