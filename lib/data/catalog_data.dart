import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../l10n/app_localizations_key_resolver.dart';
import '../models/room.dart';
import '../models/device.dart';

class CatalogData {
  static const List<String> _devicePopularityOrder = [
    'smart_tv',
    'smart_light',
    'smart_speaker',
    'smart_plug',
    'smart_thermostat',
    'smart_display',
    'smart_router',
    'smart_lock',
    'indoor_camera',
    'doorbell_camera',
    'robot_vacuum',
    'simple_sensor',
    'smart_hub',
    'smart_fridge',
    'smart_printer',
    'smart_oven',
    'smart_washing',
    'smart_blind',
    'fitness_tracker',
    'smart_scale',
    'outdoor_camera',
    'baby_monitor',
    'smart_toy',
    'smart_meter',
    'smart_coffee',
    'smart_irrigation',
  ];

  static final Map<String, int> _devicePopularityRank = {
    for (var index = 0; index < _devicePopularityOrder.length; index++)
      _devicePopularityOrder[index]: index,
  };

  static String roomName(AppLocalizations localizations, Room room) =>
      localizations.resolveKey(room.name, fallback: room.name);

  static String roomNameFromStored(
    AppLocalizations localizations, {
    required String roomId,
    required String storedName,
  }) {
    for (final room in allRooms) {
      if (room.id == roomId) {
        return roomName(localizations, room);
      }
    }
    return localizations.resolveKey(storedName, fallback: storedName);
  }

  static String deviceName(
    AppLocalizations localizations,
    DeviceTemplate template,
  ) => localizations.resolveKey(template.name, fallback: template.name);

  static List<DeviceTemplate> sortedDeviceTemplates(
    Iterable<DeviceTemplate> templates,
  ) {
    final originalIndex = {
      for (var index = 0; index < allDeviceTemplates.length; index++)
        allDeviceTemplates[index].id: index,
    };
    final sortedTemplates = templates.toList();
    sortedTemplates.sort((left, right) {
      final leftRank = _devicePopularityRank[left.id] ?? 1 << 30;
      final rightRank = _devicePopularityRank[right.id] ?? 1 << 30;
      if (leftRank != rightRank) {
        return leftRank.compareTo(rightRank);
      }

      final leftIndex = originalIndex[left.id] ?? 1 << 30;
      final rightIndex = originalIndex[right.id] ?? 1 << 30;
      return leftIndex.compareTo(rightIndex);
    });
    return sortedTemplates;
  }

  static const List<Room> allRooms = [
    Room(id: 'living', name: 'room_living', icon: Icons.weekend),
    Room(id: 'kitchen', name: 'room_kitchen', icon: Icons.kitchen),
    Room(id: 'bedroom', name: 'room_bedroom', icon: Icons.hotel),
    Room(
      id: 'child_bedroom',
      name: 'room_child_bedroom',
      icon: Icons.child_care,
    ),
    Room(id: 'bathroom', name: 'room_bathroom', icon: Icons.bathtub),
    Room(id: 'office', name: 'room_office', icon: Icons.computer),
    Room(id: 'hallway', name: 'room_hallway', icon: Icons.meeting_room),
    Room(id: 'garden', name: 'room_garden', icon: Icons.yard),
    Room(id: 'basement', name: 'room_basement', icon: Icons.food_bank),
    Room(id: 'whole_home', name: 'room_whole_home', icon: Icons.home),
  ];

  static const List<DeviceTemplate> allDeviceTemplates = [
    // ── Sensors ───────────────────────────────────────────────────────
    DeviceTemplate(
      id: 'simple_sensor',
      name: 'device_simple_sensor',
      icon: Icons.sensors,
      baseRiskScore: 20,
      roomIds: [
        'living',
        'kitchen',
        'bedroom',
        'bathroom',
        'office',
        'hallway',
        'garden',
        'basement',
        'whole_home',
      ],
      deviceType: 'sensor',
    ),

    // ── Smart Speaker / Voice ──────────────────────────────────────────
    DeviceTemplate(
      id: 'smart_speaker',
      name: 'device_smart_speaker',
      icon: Icons.speaker,
      baseRiskScore: 50,
      hasMicrophone: true,
      roomIds: ['living', 'kitchen', 'bedroom', 'office', 'hallway'],
      deviceType: 'speaker',
    ),
    DeviceTemplate(
      id: 'smart_display',
      name: 'device_smart_display',
      icon: Icons.tablet_android,
      baseRiskScore: 50,
      hasCamera: true,
      hasMicrophone: true,
      roomIds: ['living', 'kitchen', 'bedroom', 'office'],
      deviceType: 'speaker',
    ),

    // ── TV & Entertainment ────────────────────────────────────────────
    DeviceTemplate(
      id: 'smart_tv',
      name: 'device_smart_tv',
      icon: Icons.tv,
      baseRiskScore: 40,
      roomIds: ['living', 'bedroom'],
      deviceType: 'tv',
    ),

    // ── Cameras ───────────────────────────────────────────────────────
    DeviceTemplate(
      id: 'indoor_camera',
      name: 'device_indoor_camera',
      icon: Icons.videocam,
      baseRiskScore: 60,
      hasCamera: true,
      roomIds: ['living', 'hallway', 'basement', 'bedroom', 'kitchen'],
      deviceType: 'camera',
    ),
    DeviceTemplate(
      id: 'outdoor_camera',
      name: 'device_outdoor_camera',
      icon: Icons.camera_outdoor,
      baseRiskScore: 60,
      hasCamera: true,
      roomIds: ['garden', 'hallway', 'whole_home'],
      deviceType: 'camera',
    ),
    DeviceTemplate(
      id: 'doorbell_camera',
      name: 'device_doorbell_camera',
      icon: Icons.doorbell,
      baseRiskScore: 60,
      hasCamera: true,
      hasMicrophone: true,
      roomIds: ['hallway', 'whole_home'],
      deviceType: 'camera',
    ),
    DeviceTemplate(
      id: 'baby_monitor',
      name: 'device_baby_monitor',
      icon: Icons.child_care,
      baseRiskScore: 60,
      hasCamera: true,
      hasMicrophone: true,
      roomIds: ['bedroom'],
      deviceType: 'camera',
    ),

    // ── Robots & Appliances ───────────────────────────────────────────
    DeviceTemplate(
      id: 'robot_vacuum',
      name: 'device_robot_vacuum',
      icon: Icons.cleaning_services,
      baseRiskScore: 35,
      roomIds: ['living', 'kitchen', 'hallway', 'bedroom', 'whole_home'],
      deviceType: 'robot',
    ),
    DeviceTemplate(
      id: 'smart_fridge',
      name: 'device_smart_fridge',
      icon: Icons.kitchen,
      baseRiskScore: 30,
      roomIds: ['kitchen'],
      deviceType: 'appliance',
    ),
    DeviceTemplate(
      id: 'smart_oven',
      name: 'device_smart_oven',
      icon: Icons.microwave,
      baseRiskScore: 25,
      roomIds: ['kitchen'],
      deviceType: 'appliance',
    ),
    DeviceTemplate(
      id: 'smart_coffee',
      name: 'device_smart_coffee',
      icon: Icons.coffee,
      baseRiskScore: 20,
      roomIds: ['kitchen'],
      deviceType: 'appliance',
    ),
    DeviceTemplate(
      id: 'smart_washing',
      name: 'device_smart_washing',
      icon: Icons.local_laundry_service,
      baseRiskScore: 20,
      roomIds: ['basement', 'bathroom', 'whole_home'],
      deviceType: 'appliance',
    ),

    // ── Smart Home Controls ───────────────────────────────────────────
    DeviceTemplate(
      id: 'smart_thermostat',
      name: 'device_smart_thermostat',
      icon: Icons.thermostat,
      baseRiskScore: 30,
      roomIds: ['living', 'bedroom', 'hallway', 'whole_home'],
      deviceType: 'thermostat',
    ),
    DeviceTemplate(
      id: 'smart_plug',
      name: 'device_smart_plug',
      icon: Icons.electrical_services,
      baseRiskScore: 20,
      roomIds: [
        'living',
        'kitchen',
        'bedroom',
        'office',
        'hallway',
        'garden',
        'basement',
      ],
      deviceType: 'plug',
    ),
    DeviceTemplate(
      id: 'smart_light',
      name: 'device_smart_light',
      icon: Icons.lightbulb,
      baseRiskScore: 15,
      roomIds: [
        'living',
        'kitchen',
        'bedroom',
        'bathroom',
        'office',
        'hallway',
        'garden',
      ],
      deviceType: 'light',
    ),
    DeviceTemplate(
      id: 'smart_lock',
      name: 'device_smart_lock',
      icon: Icons.lock,
      baseRiskScore: 50,
      roomIds: ['hallway', 'whole_home'],
      deviceType: 'lock',
    ),
    DeviceTemplate(
      id: 'smart_blind',
      name: 'device_smart_blind',
      icon: Icons.window,
      baseRiskScore: 20,
      roomIds: ['living', 'bedroom', 'office', 'whole_home'],
      deviceType: 'blind',
    ),

    // ── Wearables ─────────────────────────────────────────────────────
    DeviceTemplate(
      id: 'fitness_tracker',
      name: 'device_fitness_tracker',
      icon: Icons.watch,
      baseRiskScore: 40,
      roomIds: ['bedroom', 'bathroom', 'whole_home'],
      deviceType: 'wearable',
    ),

    // ── Kids ──────────────────────────────────────────────────────────
    DeviceTemplate(
      id: 'smart_toy',
      name: 'device_smart_toy',
      icon: Icons.toys,
      baseRiskScore: 55,
      hasMicrophone: true,
      roomIds: ['bedroom', 'living'],
      deviceType: 'toy',
    ),

    // ── Network & Hub ─────────────────────────────────────────────────
    DeviceTemplate(
      id: 'smart_router',
      name: 'device_smart_router',
      icon: Icons.router,
      baseRiskScore: 40,
      roomIds: ['whole_home', 'office'],
      deviceType: 'router',
    ),
    DeviceTemplate(
      id: 'smart_hub',
      name: 'device_smart_hub',
      icon: Icons.hub,
      baseRiskScore: 35,
      roomIds: ['whole_home', 'living'],
      deviceType: 'hub',
    ),
    DeviceTemplate(
      id: 'smart_meter',
      name: 'device_smart_meter',
      icon: Icons.bolt,
      baseRiskScore: 30,
      roomIds: ['whole_home', 'basement'],
      deviceType: 'meter',
    ),

    // ── Garden ────────────────────────────────────────────────────────
    DeviceTemplate(
      id: 'smart_irrigation',
      name: 'device_smart_irrigation',
      icon: Icons.water_drop,
      baseRiskScore: 15,
      roomIds: ['garden'],
      deviceType: 'outdoor',
    ),

    // ── Health & Bathroom ─────────────────────────────────────────────
    DeviceTemplate(
      id: 'smart_scale',
      name: 'device_smart_scale',
      icon: Icons.monitor_weight,
      baseRiskScore: 35,
      roomIds: ['bathroom', 'bedroom'],
      deviceType: 'wearable',
    ),

    // ── Office ────────────────────────────────────────────────────────
    DeviceTemplate(
      id: 'smart_printer',
      name: 'device_smart_printer',
      icon: Icons.print,
      baseRiskScore: 30,
      roomIds: ['office'],
      deviceType: 'printer',
    ),
  ];

  static List<DeviceTemplate> devicesForRoom(String roomId) {
    if (roomId == 'child_bedroom') {
      return sortedDeviceTemplates(
        allDeviceTemplates.where(
          (d) =>
              d.roomIds.contains('child_bedroom') ||
              d.roomIds.contains('bedroom'),
        ),
      );
    }
    return sortedDeviceTemplates(
      allDeviceTemplates.where((d) => d.roomIds.contains(roomId)),
    );
  }

  // General recommendations always shown on the summary screen
  static List<String> generalRecommendations(AppLocalizations localizations) =>
      [
        localizations.gen_rec_0,
        localizations.gen_rec_1,
        localizations.gen_rec_2,
        localizations.gen_rec_3,
        localizations.gen_rec_4,
        localizations.gen_rec_5,
        localizations.gen_rec_6,
      ];
}
