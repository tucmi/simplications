import 'package:flutter/material.dart';

enum RiskLevel { low, medium, high }

enum ActionType { social, technical, security }

enum ActionPriority { high, medium, low }

enum QuestionAnswer { yes, no, dontKnow, notApplicable }

extension QuestionAnswerCodec on QuestionAnswer {
  String get wireValue {
    switch (this) {
      case QuestionAnswer.yes:
        return 'yes';
      case QuestionAnswer.no:
        return 'no';
      case QuestionAnswer.dontKnow:
        return 'dontKnow';
      case QuestionAnswer.notApplicable:
        return 'notApplicable';
    }
  }
}

QuestionAnswer? questionAnswerFromStored(dynamic value) {
  if (value == null) {
    return null;
  }
  if (value is bool) {
    return value ? QuestionAnswer.yes : QuestionAnswer.no;
  }
  if (value is String) {
    switch (value) {
      case 'yes':
        return QuestionAnswer.yes;
      case 'no':
        return QuestionAnswer.no;
      case 'dontKnow':
        return QuestionAnswer.dontKnow;
      case 'notApplicable':
        return QuestionAnswer.notApplicable;
    }
  }
  return null;
}

class PrivacyAction {
  final String title;
  final String description;
  final ActionType type;
  final ActionPriority priority;
  final String?
  deviceType; // Null = general action, specific deviceId = device-specific

  const PrivacyAction({
    required this.title,
    required this.description,
    required this.type,
    required this.priority,
    this.deviceType,
  });
}

/// A single factor that contributed to a device's risk score.
class ScoringFactor {
  final String label;
  final int penalty;

  /// True if the user answered "don't know" (partial penalty).
  /// False if answered "no" (full penalty) or this is an inherent base risk.
  final bool isDontKnow;

  /// True if this represents the device type's inherent base risk,
  /// not a specific question answer.
  final bool isBaseRisk;

  const ScoringFactor({
    required this.label,
    required this.penalty,
    required this.isDontKnow,
    this.isBaseRisk = false,
  });
}

class DeviceTemplate {
  final String id;
  final String name;
  final IconData icon;
  final int baseRiskScore;
  final bool hasCamera;
  final bool hasMicrophone;
  final List<String> roomIds;
  final String deviceType; // 'catalog' or 'custom'
  final bool isCustom;

  const DeviceTemplate({
    required this.id,
    required this.name,
    required this.icon,
    required this.baseRiskScore,
    this.hasCamera = false,
    this.hasMicrophone = false,
    required this.roomIds,
    // Default falls back to the generic question set in DeviceInstance.questions.
    this.deviceType = 'general',
    this.isCustom = false,
  });
}

class DeviceQuestion {
  final String id;
  final String text;
  final String hint;

  const DeviceQuestion({
    required this.id,
    required this.text,
    required this.hint,
  });
}

class DeviceInstance {
  static const String _childBedroomRoomId = 'child_bedroom';
  static const int _childBedroomRiskBonus = 10;
  static const Set<String> genericQuestionIds = {
    'password',
    'updates',
    'network',
    'informed',
    'permissions',
  };

  static const Map<String, PrivacyAction> _noAnswerActions = {
    'password': PrivacyAction(
      title: 'a_password_title',
      description: 'a_password_desc',
      type: ActionType.security,
      priority: ActionPriority.high,
    ),
    'updates': PrivacyAction(
      title: 'a_updates_title',
      description: 'a_updates_desc',
      type: ActionType.security,
      priority: ActionPriority.high,
    ),
    'network': PrivacyAction(
      title: 'a_network_title',
      description: 'a_network_desc',
      type: ActionType.technical,
      priority: ActionPriority.medium,
    ),
    'informed': PrivacyAction(
      title: 'a_informed_title',
      description: 'a_informed_desc',
      type: ActionType.social,
      priority: ActionPriority.medium,
    ),
    'permissions': PrivacyAction(
      title: 'a_permissions_title',
      description: 'a_permissions_desc',
      type: ActionType.technical,
      priority: ActionPriority.medium,
    ),
    'camera_consent': PrivacyAction(
      title: 'a_camera_consent_title',
      description: 'a_camera_consent_desc',
      type: ActionType.social,
      priority: ActionPriority.high,
    ),
    'mic_active': PrivacyAction(
      title: 'a_mic_active_title',
      description: 'a_mic_active_desc',
      type: ActionType.technical,
      priority: ActionPriority.high,
    ),
    'sensor_frequency': PrivacyAction(
      title: 'a_sensor_frequency_title',
      description: 'a_sensor_frequency_desc',
      type: ActionType.technical,
      priority: ActionPriority.medium,
    ),
    'sensor_data_deletion': PrivacyAction(
      title: 'a_sensor_data_deletion_title',
      description: 'a_sensor_data_deletion_desc',
      type: ActionType.technical,
      priority: ActionPriority.high,
    ),
    'sensor_local': PrivacyAction(
      title: 'a_sensor_local_title',
      description: 'a_sensor_local_desc',
      type: ActionType.technical,
      priority: ActionPriority.high,
    ),
    'voice_history': PrivacyAction(
      title: 'a_voice_history_title',
      description: 'a_voice_history_desc',
      type: ActionType.technical,
      priority: ActionPriority.high,
    ),
    'voice_local': PrivacyAction(
      title: 'a_voice_local_title',
      description: 'a_voice_local_desc',
      type: ActionType.technical,
      priority: ActionPriority.high,
    ),
    'skills_permissions': PrivacyAction(
      title: 'a_skills_permissions_title',
      description: 'a_skills_permissions_desc',
      type: ActionType.technical,
      priority: ActionPriority.medium,
    ),
    'video_encryption': PrivacyAction(
      title: 'a_video_encryption_title',
      description: 'a_video_encryption_desc',
      type: ActionType.security,
      priority: ActionPriority.high,
    ),
    'video_storage': PrivacyAction(
      title: 'a_video_storage_title',
      description: 'a_video_storage_desc',
      type: ActionType.technical,
      priority: ActionPriority.high,
    ),
    'sharing_restrictions': PrivacyAction(
      title: 'a_sharing_restrictions_title',
      description: 'a_sharing_restrictions_desc',
      type: ActionType.social,
      priority: ActionPriority.high,
    ),
    'motion_detection': PrivacyAction(
      title: 'a_motion_detection_title',
      description: 'a_motion_detection_desc',
      type: ActionType.technical,
      priority: ActionPriority.medium,
    ),
    'account_required': PrivacyAction(
      title: 'a_account_required_title',
      description: 'a_account_required_desc',
      type: ActionType.social,
      priority: ActionPriority.medium,
    ),
    'tracking_disabled': PrivacyAction(
      title: 'a_tracking_disabled_title',
      description: 'a_tracking_disabled_desc',
      type: ActionType.technical,
      priority: ActionPriority.high,
    ),
    'local_mode': PrivacyAction(
      title: 'a_local_mode_title',
      description: 'a_local_mode_desc',
      type: ActionType.social,
      priority: ActionPriority.medium,
    ),
    'data_collection': PrivacyAction(
      title: 'a_data_collection_title',
      description: 'a_data_collection_desc',
      type: ActionType.technical,
      priority: ActionPriority.high,
    ),
    'offline_control': PrivacyAction(
      title: 'a_offline_control_title',
      description: 'a_offline_control_desc',
      type: ActionType.technical,
      priority: ActionPriority.medium,
    ),
    'family_access': PrivacyAction(
      title: 'a_family_access_title',
      description: 'a_family_access_desc',
      type: ActionType.social,
      priority: ActionPriority.medium,
    ),
    'local_control': PrivacyAction(
      title: 'a_local_control_title',
      description: 'a_local_control_desc',
      type: ActionType.technical,
      priority: ActionPriority.medium,
    ),
    'usage_tracking': PrivacyAction(
      title: 'a_usage_tracking_title',
      description: 'a_usage_tracking_desc',
      type: ActionType.technical,
      priority: ActionPriority.high,
    ),
    'offline_fallback': PrivacyAction(
      title: 'a_offline_fallback_title',
      description: 'a_offline_fallback_desc',
      type: ActionType.security,
      priority: ActionPriority.medium,
    ),
    'offline_unlock': PrivacyAction(
      title: 'a_offline_unlock_title',
      description: 'a_offline_unlock_desc',
      type: ActionType.security,
      priority: ActionPriority.high,
    ),
    'access_logging': PrivacyAction(
      title: 'a_access_logging_title',
      description: 'a_access_logging_desc',
      type: ActionType.security,
      priority: ActionPriority.medium,
    ),
    'two_factor': PrivacyAction(
      title: 'a_two_factor_title',
      description: 'a_two_factor_desc',
      type: ActionType.security,
      priority: ActionPriority.high,
    ),
    'map_privacy': PrivacyAction(
      title: 'a_map_privacy_title',
      description: 'a_map_privacy_desc',
      type: ActionType.social,
      priority: ActionPriority.high,
    ),
    'cloud_required': PrivacyAction(
      title: 'a_cloud_required_title',
      description: 'a_cloud_required_desc',
      type: ActionType.technical,
      priority: ActionPriority.medium,
    ),
    'vision_data': PrivacyAction(
      title: 'a_vision_data_title',
      description: 'a_vision_data_desc',
      type: ActionType.technical,
      priority: ActionPriority.high,
    ),
    'parental_control': PrivacyAction(
      title: 'a_parental_control_title',
      description: 'a_parental_control_desc',
      type: ActionType.social,
      priority: ActionPriority.high,
    ),
    'child_data_limits': PrivacyAction(
      title: 'a_child_data_limits_title',
      description: 'a_child_data_limits_desc',
      type: ActionType.technical,
      priority: ActionPriority.high,
    ),
    'recording_disable': PrivacyAction(
      title: 'a_recording_disable_title',
      description: 'a_recording_disable_desc',
      type: ActionType.security,
      priority: ActionPriority.high,
    ),
    'health_sharing': PrivacyAction(
      title: 'a_health_sharing_title',
      description: 'a_health_sharing_desc',
      type: ActionType.technical,
      priority: ActionPriority.high,
    ),
    'location_tracking': PrivacyAction(
      title: 'a_location_tracking_title',
      description: 'a_location_tracking_desc',
      type: ActionType.technical,
      priority: ActionPriority.medium,
    ),
    'expert_data_retention_duration': PrivacyAction(
      title: 'a_expert_data_retention_duration_title',
      description: 'a_expert_data_retention_duration_desc',
      type: ActionType.technical,
      priority: ActionPriority.high,
    ),
    'expert_access_control_granular': PrivacyAction(
      title: 'a_expert_access_control_granular_title',
      description: 'a_expert_access_control_granular_desc',
      type: ActionType.security,
      priority: ActionPriority.high,
    ),
    'expert_third_party_sharing_limited': PrivacyAction(
      title: 'a_expert_third_party_sharing_limited_title',
      description: 'a_expert_third_party_sharing_limited_desc',
      type: ActionType.technical,
      priority: ActionPriority.high,
    ),
    'expert_data_sale_disabled': PrivacyAction(
      title: 'a_expert_data_sale_disabled_title',
      description: 'a_expert_data_sale_disabled_desc',
      type: ActionType.social,
      priority: ActionPriority.high,
    ),
    'expert_update_support_window': PrivacyAction(
      title: 'a_expert_update_support_window_title',
      description: 'a_expert_update_support_window_desc',
      type: ActionType.social,
      priority: ActionPriority.medium,
    ),
    'expert_vulnerability_process': PrivacyAction(
      title: 'a_expert_vulnerability_process_title',
      description: 'a_expert_vulnerability_process_desc',
      type: ActionType.social,
      priority: ActionPriority.medium,
    ),
    'expert_offline_functionality': PrivacyAction(
      title: 'a_expert_offline_functionality_title',
      description: 'a_expert_offline_functionality_desc',
      type: ActionType.technical,
      priority: ActionPriority.medium,
    ),
    'expert_bystander_transparency': PrivacyAction(
      title: 'a_expert_bystander_transparency_title',
      description: 'a_expert_bystander_transparency_desc',
      type: ActionType.social,
      priority: ActionPriority.medium,
    ),
    'expert_child_data_protection': PrivacyAction(
      title: 'a_expert_child_data_protection_title',
      description: 'a_expert_child_data_protection_desc',
      type: ActionType.security,
      priority: ActionPriority.high,
    ),
    'expert_access_revocation': PrivacyAction(
      title: 'a_expert_access_revocation_title',
      description: 'a_expert_access_revocation_desc',
      type: ActionType.security,
      priority: ActionPriority.high,
    ),
    'expert_sensitive_inference_controls': PrivacyAction(
      title: 'a_expert_sensitive_inference_controls_title',
      description: 'a_expert_sensitive_inference_controls_desc',
      type: ActionType.technical,
      priority: ActionPriority.high,
    ),
  };

  final String instanceId;
  final DeviceTemplate template;
  final String roomId;
  final String roomName;

  QuestionAnswer? passwordChanged;
  QuestionAnswer? autoUpdatesEnabled;
  QuestionAnswer? separateNetwork;
  QuestionAnswer? householdInformed;
  QuestionAnswer? permissionsReduced;
  QuestionAnswer? cameraConsentGiven;
  QuestionAnswer? micDeactivatedWhenUnused;

  // Store device-specific question answers
  final Map<String, QuestionAnswer> deviceSpecificAnswers = {};
  bool expertModeEnabled;

  DeviceInstance({
    required this.instanceId,
    required this.template,
    required this.roomId,
    required this.roomName,
    this.expertModeEnabled = false,
  });

  List<DeviceQuestion> get questions {
    final baseQuestions = _baseQuestions;
    if (!expertModeEnabled) {
      return baseQuestions;
    }
    return [
      ...baseQuestions,
      ..._expertCommonQuestions,
      ..._expertDeviceTypeQuestions(),
    ];
  }

  List<DeviceQuestion> get _baseQuestions {
    // ── Base question definitions (referenced selectively per device type) ─────
    const qPassword = DeviceQuestion(
      id: 'password',
      text: 'q_password_text',
      hint: 'q_password_hint',
    );
    const qUpdates = DeviceQuestion(
      id: 'updates',
      text: 'q_updates_text',
      hint: 'q_updates_hint',
    );
    const qNetwork = DeviceQuestion(
      id: 'network',
      text: 'q_network_text',
      hint: 'q_network_hint',
    );
    const qInformed = DeviceQuestion(
      id: 'informed',
      text: 'q_informed_text',
      hint: 'q_informed_hint',
    );
    const qPermissions = DeviceQuestion(
      id: 'permissions',
      text: 'q_permissions_text',
      hint: 'q_permissions_hint',
    );
    const qMicActive = DeviceQuestion(
      id: 'mic_active',
      text: 'q_mic_active_text',
      hint: 'q_mic_active_hint',
    );

    // ── Sensor: tailored set – no app/password/update concept ─────────────────
    if (template.deviceType == 'sensor') {
      return const [
        DeviceQuestion(
          id: 'sensor_frequency',
          text: 'q_sensor_frequency_text',
          hint: 'q_sensor_frequency_hint',
        ),
        DeviceQuestion(
          id: 'sensor_data_deletion',
          text: 'q_sensor_data_deletion_text',
          hint: 'q_sensor_data_deletion_hint',
        ),
        DeviceQuestion(
          id: 'sensor_local',
          text: 'q_sensor_local_text',
          hint: 'q_sensor_local_hint',
        ),
      ];
    }

    // ── Speaker ───────────────────────────────────────────────────────────────
    if (template.deviceType == 'speaker') {
      return [
        const DeviceQuestion(
          id: 'voice_history',
          text: 'q_voice_history_text',
          hint: 'q_voice_history_hint',
        ),
        const DeviceQuestion(
          id: 'voice_local',
          text: 'q_voice_local_text',
          hint: 'q_voice_local_hint',
        ),
        const DeviceQuestion(
          id: 'skills_permissions',
          text: 'q_skills_permissions_text',
          hint: 'q_skills_permissions_hint',
        ),
        qMicActive,
      ];
    }

    // ── Camera ────────────────────────────────────────────────────────────────
    if (template.deviceType == 'camera') {
      return const [
        DeviceQuestion(
          id: 'video_encryption',
          text: 'q_video_encryption_text',
          hint: 'q_video_encryption_hint',
        ),
        DeviceQuestion(
          id: 'video_storage',
          text: 'q_video_storage_text',
          hint: 'q_video_storage_hint',
        ),
        DeviceQuestion(
          id: 'sharing_restrictions',
          text: 'q_sharing_restrictions_text',
          hint: 'q_sharing_restrictions_hint',
        ),
        DeviceQuestion(
          id: 'motion_detection',
          text: 'q_motion_detection_text',
          hint: 'q_motion_detection_hint',
        ),
      ];
    }

    // ── Smart TV ──────────────────────────────────────────────────────────────
    if (template.deviceType == 'tv') {
      return [
        qUpdates,
        const DeviceQuestion(
          id: 'account_required',
          text: 'q_account_required_text',
          hint: 'q_account_required_hint',
        ),
        const DeviceQuestion(
          id: 'tracking_disabled',
          text: 'q_tracking_disabled_text',
          hint: 'q_tracking_disabled_hint',
        ),
        const DeviceQuestion(
          id: 'local_mode',
          text: 'q_local_mode_text',
          hint: 'q_local_mode_hint',
        ),
      ];
    }

    // ── Thermostat ────────────────────────────────────────────────────────────
    if (template.deviceType == 'thermostat') {
      return [
        qUpdates,
        const DeviceQuestion(
          id: 'data_collection',
          text: 'q_data_collection_text',
          hint: 'q_data_collection_hint',
        ),
        const DeviceQuestion(
          id: 'offline_control',
          text: 'q_offline_control_text',
          hint: 'q_offline_control_hint',
        ),
        const DeviceQuestion(
          id: 'family_access',
          text: 'q_family_access_text',
          hint: 'q_family_access_hint',
        ),
      ];
    }

    // ── Smart Light / Smart Plug / Motorised Blind ────────────────────────────
    if (template.deviceType == 'light' ||
        template.deviceType == 'plug' ||
        template.deviceType == 'blind') {
      return [
        qUpdates,
        const DeviceQuestion(
          id: 'local_control',
          text: 'q_local_control_text',
          hint: 'q_local_control_hint',
        ),
        const DeviceQuestion(
          id: 'usage_tracking',
          text: 'q_usage_tracking_text',
          hint: 'q_usage_tracking_hint',
        ),
        const DeviceQuestion(
          id: 'offline_fallback',
          text: 'q_offline_fallback_text',
          hint: 'q_offline_fallback_hint',
        ),
      ];
    }

    // ── Smart Lock ────────────────────────────────────────────────────────────
    if (template.deviceType == 'lock') {
      return [
        qPassword,
        const DeviceQuestion(
          id: 'offline_unlock',
          text: 'q_offline_unlock_text',
          hint: 'q_offline_unlock_hint',
        ),
        const DeviceQuestion(
          id: 'access_logging',
          text: 'q_access_logging_text',
          hint: 'q_access_logging_hint',
        ),
        const DeviceQuestion(
          id: 'two_factor',
          text: 'q_two_factor_text',
          hint: 'q_two_factor_hint',
        ),
      ];
    }

    // ── Robot Vacuum ──────────────────────────────────────────────────────────
    if (template.deviceType == 'robot') {
      return [
        qUpdates,
        const DeviceQuestion(
          id: 'map_privacy',
          text: 'q_map_privacy_text',
          hint: 'q_map_privacy_hint',
        ),
        const DeviceQuestion(
          id: 'cloud_required',
          text: 'q_cloud_required_text',
          hint: 'q_cloud_required_hint',
        ),
        const DeviceQuestion(
          id: 'vision_data',
          text: 'q_vision_data_text',
          hint: 'q_vision_data_hint',
        ),
      ];
    }

    // ── Connected Toy ─────────────────────────────────────────────────────────
    if (template.deviceType == 'toy') {
      return [
        qUpdates,
        const DeviceQuestion(
          id: 'parental_control',
          text: 'q_parental_control_text',
          hint: 'q_parental_control_hint',
        ),
        const DeviceQuestion(
          id: 'child_data_limits',
          text: 'q_child_data_limits_text',
          hint: 'q_child_data_limits_hint',
        ),
        const DeviceQuestion(
          id: 'recording_disable',
          text: 'q_recording_disable_text',
          hint: 'q_recording_disable_hint',
        ),
      ];
    }

    // ── Wearable / Fitness Tracker ────────────────────────────────────────────
    if (template.deviceType == 'wearable') {
      return [
        qUpdates,
        qPermissions,
        const DeviceQuestion(
          id: 'health_sharing',
          text: 'q_health_sharing_text',
          hint: 'q_health_sharing_hint',
        ),
        const DeviceQuestion(
          id: 'location_tracking',
          text: 'q_location_tracking_text',
          hint: 'q_location_tracking_hint',
        ),
      ];
    }

    // ── Default / custom device ───────────────────────────────────────────────
    return [qPassword, qUpdates, qNetwork, qInformed];
  }

  static const List<DeviceQuestion> _expertCommonQuestions = [
    DeviceQuestion(
      id: 'expert_data_retention_duration',
      text: 'q_expert_data_retention_duration_text',
      hint: 'q_expert_data_retention_duration_hint',
    ),
    DeviceQuestion(
      id: 'expert_access_control_granular',
      text: 'q_expert_access_control_granular_text',
      hint: 'q_expert_access_control_granular_hint',
    ),
    DeviceQuestion(
      id: 'expert_third_party_sharing_limited',
      text: 'q_expert_third_party_sharing_limited_text',
      hint: 'q_expert_third_party_sharing_limited_hint',
    ),
    DeviceQuestion(
      id: 'expert_data_sale_disabled',
      text: 'q_expert_data_sale_disabled_text',
      hint: 'q_expert_data_sale_disabled_hint',
    ),
    DeviceQuestion(
      id: 'expert_update_support_window',
      text: 'q_expert_update_support_window_text',
      hint: 'q_expert_update_support_window_hint',
    ),
    DeviceQuestion(
      id: 'expert_vulnerability_process',
      text: 'q_expert_vulnerability_process_text',
      hint: 'q_expert_vulnerability_process_hint',
    ),
    DeviceQuestion(
      id: 'expert_offline_functionality',
      text: 'q_expert_offline_functionality_text',
      hint: 'q_expert_offline_functionality_hint',
    ),
  ];

  List<DeviceQuestion> _expertDeviceTypeQuestions() {
    final questions = <DeviceQuestion>[];
    if (template.hasCamera || template.hasMicrophone) {
      questions.add(
        const DeviceQuestion(
          id: 'expert_bystander_transparency',
          text: 'q_expert_bystander_transparency_text',
          hint: 'q_expert_bystander_transparency_hint',
        ),
      );
    }
    if (template.deviceType == 'toy' || roomId == _childBedroomRoomId) {
      questions.add(
        const DeviceQuestion(
          id: 'expert_child_data_protection',
          text: 'q_expert_child_data_protection_text',
          hint: 'q_expert_child_data_protection_hint',
        ),
      );
    }
    if (template.deviceType == 'lock') {
      questions.add(
        const DeviceQuestion(
          id: 'expert_access_revocation',
          text: 'q_expert_access_revocation_text',
          hint: 'q_expert_access_revocation_hint',
        ),
      );
    }
    if (template.deviceType == 'wearable') {
      questions.add(
        const DeviceQuestion(
          id: 'expert_sensitive_inference_controls',
          text: 'q_expert_sensitive_inference_controls_text',
          hint: 'q_expert_sensitive_inference_controls_hint',
        ),
      );
    }
    return questions;
  }

  QuestionAnswer? answerFor(String questionId) {
    if (questionId == 'password') return passwordChanged;
    if (questionId == 'updates') return autoUpdatesEnabled;
    if (questionId == 'network') return separateNetwork;
    if (questionId == 'informed') return householdInformed;
    if (questionId == 'permissions') return permissionsReduced;
    if (questionId == 'camera_consent') return cameraConsentGiven;
    if (questionId == 'mic_active') return micDeactivatedWhenUnused;
    // Check device-specific answers
    return deviceSpecificAnswers[questionId];
  }

  void setAnswer(String questionId, QuestionAnswer? value) {
    if (questionId == 'password') {
      passwordChanged = value;
    } else if (questionId == 'updates') {
      autoUpdatesEnabled = value;
    } else if (questionId == 'network') {
      separateNetwork = value;
    } else if (questionId == 'informed') {
      householdInformed = value;
    } else if (questionId == 'permissions') {
      permissionsReduced = value;
    } else if (questionId == 'camera_consent') {
      cameraConsentGiven = value;
    } else if (questionId == 'mic_active') {
      micDeactivatedWhenUnused = value;
    } else {
      // Store device-specific question answers
      if (value == null) {
        deviceSpecificAnswers.remove(questionId);
      } else {
        deviceSpecificAnswers[questionId] = value;
      }
    }
  }

  bool get isFullyAnswered => questions.every((q) => answerFor(q.id) != null);

  bool get allAnswersPositive =>
      questions.every((q) => answerFor(q.id) == QuestionAnswer.yes);

  int get dontKnowAnswerCount =>
      questions.where((q) => answerFor(q.id) == QuestionAnswer.dontKnow).length;

  bool _hasQuestion(String questionId) =>
      questions.any((question) => question.id == questionId);

  int get riskScore {
    int score = template.baseRiskScore;
    if (roomId == _childBedroomRoomId) {
      score += _childBedroomRiskBonus;
    }
    if (_hasQuestion('password')) {
      score += _riskPenalty(
        passwordChanged,
        noPenalty: 20,
        dontKnowPenalty: 10,
      );
    }
    if (_hasQuestion('updates')) {
      score += _riskPenalty(
        autoUpdatesEnabled,
        noPenalty: 15,
        dontKnowPenalty: 8,
      );
    }
    if (_hasQuestion('network')) {
      score += _riskPenalty(separateNetwork, noPenalty: 10, dontKnowPenalty: 5);
    }
    if (_hasQuestion('informed')) {
      score += _riskPenalty(
        householdInformed,
        noPenalty: 10,
        dontKnowPenalty: 5,
      );
    }
    if (_hasQuestion('permissions')) {
      score += _riskPenalty(
        permissionsReduced,
        noPenalty: 5,
        dontKnowPenalty: 3,
      );
    }
    if (_hasQuestion('camera_consent')) {
      score += _riskPenalty(
        cameraConsentGiven,
        noPenalty: 15,
        dontKnowPenalty: 8,
      );
    }
    if (_hasQuestion('mic_active')) {
      score += _riskPenalty(
        micDeactivatedWhenUnused,
        noPenalty: 10,
        dontKnowPenalty: 5,
      );
    }

    const baseIds = {
      'password',
      'updates',
      'network',
      'informed',
      'permissions',
      'camera_consent',
      'mic_active',
    };

    // Penalties for currently active device-specific questions.
    for (final question in questions) {
      if (baseIds.contains(question.id)) {
        continue;
      }
      score += _riskPenalty(
        answerFor(question.id),
        noPenalty: 8,
        dontKnowPenalty: 4,
      );
    }

    return score.clamp(0, 100);
  }

  RiskLevel get riskLevel {
    final s = riskScore;
    if (s <= 33) return RiskLevel.low;
    if (s <= 66) return RiskLevel.medium;
    return RiskLevel.high;
  }

  String? get inherentRiskHint {
    if (!allAnswersPositive || riskLevel == RiskLevel.low) {
      return null;
    }

    if (template.deviceType == 'camera' || template.hasCamera) {
      return 'risk_hint_camera';
    }
    if (template.deviceType == 'speaker' || template.hasMicrophone) {
      return 'risk_hint_mic';
    }
    if (template.deviceType == 'lock') {
      return 'risk_hint_lock';
    }
    if (roomId == _childBedroomRoomId) {
      return 'risk_hint_child_room';
    }

    return 'risk_hint_generic';
  }

  static PrivacyAction? remedyForNegativeAnswer(String questionId) {
    return _noAnswerActions[questionId];
  }

  List<PrivacyAction> get suggestedActions {
    final actions = <PrivacyAction>[];

    for (final question in questions) {
      final answer = answerFor(question.id);
      if (answer != QuestionAnswer.no) {
        continue;
      }
      final action = remedyForNegativeAnswer(question.id);
      if (action != null) {
        actions.add(action);
      }
    }

    if (dontKnowAnswerCount > 0) {
      actions.add(
        const PrivacyAction(
          title: 'a_dont_know_title',
          description: 'a_dont_know_desc',
          type: ActionType.social,
          priority: ActionPriority.medium,
        ),
      );
    }

    return actions;
  }

  /// Returns each factor that contributed to the risk score —
  /// the base device risk plus every negatively-answered question.
  List<ScoringFactor> get scoringFactors {
    final factors = <ScoringFactor>[];

    // Inherent device-type risk
    if (template.baseRiskScore > 0) {
      factors.add(
        ScoringFactor(
          label: 'sl_base_risk',
          penalty: template.baseRiskScore,
          isDontKnow: false,
          isBaseRisk: true,
        ),
      );
    }
    if (roomId == _childBedroomRoomId) {
      factors.add(
        const ScoringFactor(
          label: 'sl_child_room_bonus',
          penalty: _childBedroomRiskBonus,
          isDontKnow: false,
          isBaseRisk: true,
        ),
      );
    }

    void check(
      String questionId,
      String shortLabel,
      int noPenalty,
      int dontKnowPenalty,
    ) {
      if (!_hasQuestion(questionId)) {
        return;
      }
      final answer = answerFor(questionId);
      if (answer == QuestionAnswer.no) {
        factors.add(
          ScoringFactor(
            label: shortLabel,
            penalty: noPenalty,
            isDontKnow: false,
          ),
        );
      } else if (answer == QuestionAnswer.dontKnow) {
        factors.add(
          ScoringFactor(
            label: shortLabel,
            penalty: dontKnowPenalty,
            isDontKnow: true,
          ),
        );
      }
    }

    check('password', 'sl_password', 20, 10);
    check('updates', 'sl_updates', 15, 8);
    check('network', 'sl_network', 10, 5);
    check('informed', 'sl_informed', 10, 5);
    check('permissions', 'sl_permissions', 5, 3);
    if (template.hasCamera) {
      check('camera_consent', 'sl_camera_consent', 15, 8);
    }
    if (template.hasMicrophone) {
      check('mic_active', 'sl_mic_active', 10, 5);
    }

    // Device-specific questions — use short labels instead of full question text.
    const Map<String, String> shortLabels = {
      // Sensor
      'sensor_frequency': 'sl_sensor_frequency',
      'sensor_data_deletion': 'sl_sensor_data_deletion',
      'sensor_local': 'sl_sensor_local',
      // Speaker
      'voice_history': 'sl_voice_history',
      'voice_local': 'sl_voice_local',
      'skills_permissions': 'sl_skills_permissions',
      // Camera
      'video_encryption': 'sl_video_encryption',
      'video_storage': 'sl_video_storage',
      'sharing_restrictions': 'sl_sharing_restrictions',
      'motion_detection': 'sl_motion_detection',
      // TV
      'account_required': 'sl_account_required',
      'tracking_disabled': 'sl_tracking_disabled',
      'local_mode': 'sl_local_mode',
      // Thermostat
      'data_collection': 'sl_data_collection',
      'offline_control': 'sl_offline_control',
      'family_access': 'sl_family_access',
      // Light / Plug / Blind
      'local_control': 'sl_local_control',
      'usage_tracking': 'sl_usage_tracking',
      'offline_fallback': 'sl_offline_fallback',
      // Lock
      'offline_unlock': 'sl_offline_unlock',
      'access_logging': 'sl_access_logging',
      'two_factor': 'sl_two_factor',
      // Robot
      'map_privacy': 'sl_map_privacy',
      'cloud_required': 'sl_cloud_required',
      'vision_data': 'sl_vision_data',
      // Toy
      'parental_control': 'sl_parental_control',
      'child_data_limits': 'sl_child_data_limits',
      'recording_disable': 'sl_recording_disable',
      // Wearable
      'health_sharing': 'sl_health_sharing',
      'location_tracking': 'sl_location_tracking',
      // Expert mode
      'expert_data_retention_duration': 'sl_expert_data_retention_duration',
      'expert_access_control_granular': 'sl_expert_access_control_granular',
      'expert_third_party_sharing_limited':
          'sl_expert_third_party_sharing_limited',
      'expert_data_sale_disabled': 'sl_expert_data_sale_disabled',
      'expert_update_support_window': 'sl_expert_update_support_window',
      'expert_vulnerability_process': 'sl_expert_vulnerability_process',
      'expert_offline_functionality': 'sl_expert_offline_functionality',
      'expert_bystander_transparency': 'sl_expert_bystander_transparency',
      'expert_child_data_protection': 'sl_expert_child_data_protection',
      'expert_access_revocation': 'sl_expert_access_revocation',
      'expert_sensitive_inference_controls':
          'sl_expert_sensitive_inference_controls',
    };
    const baseIds = {
      'password',
      'updates',
      'network',
      'informed',
      'permissions',
      'camera_consent',
      'mic_active',
    };
    for (final q in questions) {
      if (baseIds.contains(q.id)) continue;
      final answer = answerFor(q.id);
      final label = shortLabels[q.id] ?? q.text;
      if (answer == QuestionAnswer.no) {
        factors.add(ScoringFactor(label: label, penalty: 8, isDontKnow: false));
      } else if (answer == QuestionAnswer.dontKnow) {
        factors.add(ScoringFactor(label: label, penalty: 4, isDontKnow: true));
      }
    }

    return factors;
  }

  int _riskPenalty(
    QuestionAnswer? answer, {
    required int noPenalty,
    required int dontKnowPenalty,
  }) {
    if (answer == QuestionAnswer.no) {
      return noPenalty;
    }
    if (answer == QuestionAnswer.dontKnow) {
      return dontKnowPenalty;
    }
    return 0;
  }
}
