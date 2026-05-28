// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Simplications';

  @override
  String get welcomeTitle => 'Simplications\nSmart Home\nPrivacy Check';

  @override
  String get welcomeDescription =>
      'Capture your smart devices room by room and receive a privacy assessment with concrete recommendations.';

  @override
  String get welcomePrivacyTitle => 'Private by design';

  @override
  String get welcomePrivacyDescription =>
      'We do not collect personal data. Your answers stay on this device and are not sent to the cloud.';

  @override
  String get stepSelectRooms => 'Select room';

  @override
  String get stepCaptureDevices => 'Capture devices';

  @override
  String get stepAnswerQuestions => 'Answer questions';

  @override
  String get stepGetRisk => 'Get risk profile & recommendations';

  @override
  String get start => 'Start';

  @override
  String get resume => 'Resume';

  @override
  String get about => 'About';

  @override
  String get faq => 'FAQ';

  @override
  String get roomSelectionTitle => 'Select room';

  @override
  String get roomQuestion => 'Which room would you like to check now?';

  @override
  String get roomInstruction =>
      'Tap a room, capture your devices there, then return here to choose the next room.';

  @override
  String get results => 'Results';

  @override
  String get alreadyEvaluated => 'Already evaluated';

  @override
  String get notCompleted => 'Not completed';

  @override
  String get addRoom => 'Add room';

  @override
  String get deviceTitlePrefix => 'Devices';

  @override
  String get roomCheck => 'Room check';

  @override
  String get deviceQuestion => 'Which smart devices do you use in this room?';

  @override
  String get deviceQuestionHint => 'Tap a device to answer its questions.';

  @override
  String get noKnownDevices =>
      'No known devices for this room. You can add your own device.';

  @override
  String get addDevice => 'Add\ndevice';

  @override
  String get noDevice => 'No device';

  @override
  String get nextRoom => 'Next room';

  @override
  String get deleteDeviceTitle => 'Delete device?';

  @override
  String get deleteDeviceBody =>
      'This custom device will be deleted. All linked instances will also be removed.';

  @override
  String get delete => 'Delete';

  @override
  String get cancel => 'Cancel';

  @override
  String get confirm => 'Confirm';

  @override
  String get noDeviceDialogTitle => 'No devices in this room?';

  @override
  String get noDeviceDialogBody =>
      'This room will be completed without devices and will not affect scoring.';

  @override
  String get noDeviceDialogBodyWithExisting =>
      'Existing device selections for this room will be discarded. This room will be completed without devices and will not affect scoring.';

  @override
  String get questionnaireTitle => 'Questions';

  @override
  String get connectedDevice => 'Connected device';

  @override
  String get done => 'Done';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get dontKnow => 'I don\'t know';

  @override
  String get notApplicableForDevice =>
      'This question does not apply to my device';

  @override
  String get languageDialogTitle => 'Choose language';

  @override
  String get languageNameDe => 'Deutsch';

  @override
  String get languageNameCs => 'Čeština';

  @override
  String get languageNameEn => 'English';

  @override
  String get languageNamePl => 'Polski';

  @override
  String get languageNameFr => 'Français';

  @override
  String get languageNameNl => 'Nederlands';

  @override
  String get languageNameDa => 'Dansk';

  @override
  String get currentLanguage => 'Current language';

  @override
  String get aboutScreenTitle => 'About the app';

  @override
  String get faqScreenTitle => 'Frequently Asked Questions';

  @override
  String get aboutSubtitle => 'Research project on privacy in the smart home';

  @override
  String get aboutProjectName => 'Simplications';

  @override
  String get aboutPartnerTuChemnitz => 'Chemnitz University of Technology';

  @override
  String get aboutPartnerHsAnhalt => 'Anhalt University of Applied Sciences';

  @override
  String get aboutPartnerVzSachsen => 'Consumer Center Saxony';

  @override
  String get aboutWebsiteSimplicationsLabel => 'simplications.tucmi.de';

  @override
  String get aboutWebsiteSimplicationsUrl => 'https://simplications.tucmi.de';

  @override
  String get aboutWebsiteTuChemnitzLabel => 'tu-chemnitz.de';

  @override
  String get aboutWebsiteTuChemnitzUrl => 'https://www.tu-chemnitz.de';

  @override
  String get aboutWebsiteHsAnhaltLabel => 'hs-anhalt.de';

  @override
  String get aboutWebsiteHsAnhaltUrl => 'https://www.hs-anhalt.de';

  @override
  String get aboutWebsiteVzSachsenLabel => 'verbraucherzentrale-sachsen.de';

  @override
  String get aboutWebsiteVzSachsenUrl =>
      'https://www.verbraucherzentrale-sachsen.de';

  @override
  String get aboutWebsitePlatformPrivacyLabel => 'plattform-privatheit.de';

  @override
  String get aboutWebsitePlatformPrivacyUrl =>
      'https://www.plattform-privatheit.de';

  @override
  String get aboutWebsiteFundingAgencyLabel => 'bmftr.bund.de';

  @override
  String get aboutWebsiteFundingAgencyUrl => 'https://www.bmftr.bund.de';

  @override
  String get faqQuestionWhatIs => 'What is Simplications?';

  @override
  String get faqAnswerWhatIs =>
      'Simplications is a research project on privacy in the smart home. This app is one part of the project and guides you room by room through your devices with practical recommendations based on your answers.';

  @override
  String get faqQuestionHowWorks => 'How does the check work?';

  @override
  String get faqAnswerHowWorks =>
      'You select a room, add your smart devices, answer device-specific questions, and receive a risk profile with prioritized actions.';

  @override
  String get faqQuestionNoPolicy => 'Why is there no data protection policy?';

  @override
  String get faqAnswerNoPolicy => 'Because we do not collect your data.';

  @override
  String get faqQuestionDataStored => 'Where is my data stored?';

  @override
  String get faqAnswerDataStored =>
      'Your assessment data is stored locally on your device. You can delete all stored data at any time in the About screen.';

  @override
  String get faqQuestionNoDevice => 'What if my device is not listed?';

  @override
  String get faqAnswerNoDevice =>
      'You can add custom devices and still complete the check. The recommendations then rely on your provided setup and answers.';

  @override
  String get faqQuestionRiskMeaning =>
      'What do low, medium, and high risk mean?';

  @override
  String get faqAnswerRiskMeaning =>
      'They indicate how strongly your current configuration may expose privacy-related risks. They are guidance levels, not legal or technical certification.';

  @override
  String get faqQuestionLegalAdvice => 'Is this legal advice?';

  @override
  String get faqAnswerLegalAdvice =>
      'No. Simplications provides practical orientation and recommendations, but does not replace legal or professional security consultation.';

  @override
  String get faqQuestionCanShare => 'Can I share my results?';

  @override
  String get faqAnswerCanShare =>
      'Yes. You can export and share your summary as text or PDF directly from the results screen.';

  @override
  String get websiteOpenFailed => 'Could not open website.';

  @override
  String get deleteAllDataTitle => 'Delete all data?';

  @override
  String get deleteAllDataBody =>
      'All captured rooms, devices, and answers will be permanently deleted. This action cannot be undone.';

  @override
  String get deleteAllDataButton => 'Delete data';

  @override
  String get allDataDeleted => 'All saved data has been deleted.';

  @override
  String get projectPartners => 'Project partners';

  @override
  String get coordinationFunding => 'Coordination & Funding';

  @override
  String get coordination => 'Coordination';

  @override
  String get platformPrivacy => 'Platform Privacy';

  @override
  String get fundingAgency => 'Funding body';

  @override
  String get fundingAgencyValue =>
      'German Federal Ministry of Research, Technology and Space\nGrant 16KIS1868K';

  @override
  String get website => 'Website';

  @override
  String get dangerZone => 'Danger zone';

  @override
  String get dangerZoneWarning =>
      'Warning: This action permanently removes all saved app data.';

  @override
  String get expertModeTitle => 'Expert mode';

  @override
  String get expertModeToggleLabel => 'Enable detailed expert mode';

  @override
  String get expertModeToggleHint =>
      'Same workflow, but much more detailed device questions (e.g., retention duration, access control, third-party sharing).';

  @override
  String get expertModeSourcesHint =>
      'Methodologically inspired by the following research projects:';

  @override
  String get expertModeSourceCmuLabel =>
      'CMU IoT Security & Privacy Label (CISPL)';

  @override
  String get expertModeSourceCmuUrl => 'https://iotsecurityprivacy.org/labels';

  @override
  String get expertModeSourceUnboxingLabel =>
      'Unboxing.IoT.Privacy (community platform)';

  @override
  String get expertModeSourceUnboxingUrl => 'https://iot-privacy.info/project/';

  @override
  String get expertModeQuestionnaireHint =>
      'Expert mode: these questions deepen data-practice and governance coverage (including retention, access control, and third-party sharing) based on CMU IoT Label and Unboxing.IoT.Privacy approaches.';

  @override
  String get roomDeleteTitle => 'Delete room?';

  @override
  String get roomDeleteBody =>
      'This custom room will be deleted. All linked devices will also be removed.';

  @override
  String get add => 'Add';

  @override
  String get addRoomDialogTitle => 'Add new room';

  @override
  String get roomName => 'Room name';

  @override
  String get roomNameHint => 'e.g. Living room, Garage';

  @override
  String get chooseIcon => 'Choose icon:';

  @override
  String get addDeviceDialogTitle => 'Add new device';

  @override
  String get deviceName => 'Device name';

  @override
  String get deviceNameHint => 'e.g. My smart speaker';

  @override
  String get baseRiskLabel => 'Base risk score (0-100)';

  @override
  String get baseRiskHint => 'e.g. 30 (low) to 60 (high)';

  @override
  String get hasCamera => 'Has camera?';

  @override
  String get hasMicrophone => 'Has microphone?';

  @override
  String get camera => 'Camera';

  @override
  String get microphone => 'Microphone';

  @override
  String get summaryTitle => 'Your result';

  @override
  String get shareResult => 'Share result';

  @override
  String get shareAsText => 'Share as text';

  @override
  String get shareAsPdf => 'Share as PDF';

  @override
  String get restart => 'Restart';

  @override
  String get noDevicesCaptured => 'No devices captured.';

  @override
  String get noDevicesHint =>
      'Restart and add devices to receive an assessment.';

  @override
  String get highRisk => 'High risk';

  @override
  String get mediumRisk => 'Medium risk';

  @override
  String get lowRisk => 'Low risk';

  @override
  String get exportFailed => 'Export failed';

  @override
  String get summaryShareSubject => 'Simplications result';

  @override
  String get summarySharePdfText => 'Simplications report as PDF';

  @override
  String get summaryPdfFileName => 'simplications-result.pdf';

  @override
  String get overview => 'Overview';

  @override
  String get evaluatedDevices => 'Evaluated devices';

  @override
  String skippedDevicesHint(Object count) {
    return '$count devices skipped because the questionnaire was not completed.';
  }

  @override
  String get overallRisk => 'Overall risk';

  @override
  String get generalRecommendations => 'General recommendations';

  @override
  String get generalRecommendationsHint =>
      'These measures apply to your whole smart home regardless of individual devices.';

  @override
  String get fullCatalog => 'Full action catalog';

  @override
  String get catalogButton => 'Open full action catalog';

  @override
  String get risk => 'Risk';

  @override
  String get note => 'Note';

  @override
  String get recommendations => 'Recommendations';

  @override
  String get urgent => 'Urgent';

  @override
  String get recommended => 'Recommended';

  @override
  String get optional => 'Optional';

  @override
  String get social => 'Social';

  @override
  String get technical => 'Technical';

  @override
  String get security => 'Security';

  @override
  String get smartHomePrivacyHeader => 'Your smart home privacy';

  @override
  String get devicesRated => 'rated devices';

  @override
  String get howRiskCalculated => 'How is risk calculated?';

  @override
  String get totalScore => 'Total';

  @override
  String get catalogSnackBarPrefix => 'Catalog';

  @override
  String get reportExportedAt => 'Exported at';

  @override
  String get noActionLow => 'Everything is fine - no actions required.';

  @override
  String get noActionMedium =>
      'No concrete actions can currently be derived from your answers, but a medium residual risk remains.';

  @override
  String get noActionHigh =>
      'No concrete actions can currently be derived from your answers, but a high residual risk remains.';

  @override
  String get overallLow =>
      'Well done! Your devices are mostly configured securely. Still review the general recommendations.';

  @override
  String get overallMedium =>
      'There is room for improvement. Review the recommendations for each device.';

  @override
  String get overallHigh =>
      'Several devices have significant privacy/data-protection risks. Please implement high-priority measures promptly.';

  @override
  String dontKnowHint(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count answers were marked as \"I don\'t know\" - take time to understand your device settings better.',
      one:
          '1 answer was marked as \"I don\'t know\" - take time to understand your device settings better.',
    );
    return ' $_temp0';
  }

  @override
  String get room_living => 'Living room';

  @override
  String get room_kitchen => 'Kitchen';

  @override
  String get room_bedroom => 'Bedroom';

  @override
  String get room_child_bedroom => 'Child\'s bedroom';

  @override
  String get room_bathroom => 'Bathroom';

  @override
  String get room_office => 'Office';

  @override
  String get room_hallway => 'Hallway / Entrance';

  @override
  String get room_garden => 'Garden / Outdoor area';

  @override
  String get room_basement => 'Basement / Pantry';

  @override
  String get room_whole_home => 'Entire home';

  @override
  String get device_simple_sensor =>
      'Sensor (e.g., door, motion, temperature, humidity, or light sensor)';

  @override
  String get device_humidity_sensor => 'Humidity sensor';

  @override
  String get device_temperature_sensor => 'Temperature sensor';

  @override
  String get device_light_sensor => 'Light sensor';

  @override
  String get device_smart_speaker => 'Smart speaker / voice assistant';

  @override
  String get device_smart_display => 'Smart display (e.g., Nest Hub)';

  @override
  String get device_smart_tv => 'Smart TV';

  @override
  String get device_indoor_camera => 'Smart indoor camera';

  @override
  String get device_outdoor_camera => 'Smart outdoor camera';

  @override
  String get device_doorbell_camera => 'Smart doorbell with camera';

  @override
  String get device_baby_monitor => 'Baby monitor / baby camera';

  @override
  String get device_robot_vacuum => 'Robot vacuum';

  @override
  String get device_smart_fridge => 'Smart fridge';

  @override
  String get device_smart_oven => 'Smart oven / stove';

  @override
  String get device_smart_coffee => 'Smart coffee machine';

  @override
  String get device_smart_washing => 'Smart washer / dryer';

  @override
  String get device_smart_thermostat => 'Smart thermostat / heating control';

  @override
  String get device_smart_plug => 'Smart plug';

  @override
  String get device_smart_light => 'Smart lighting';

  @override
  String get device_smart_lock => 'Smart door lock';

  @override
  String get device_smart_blind => 'Smart blind / shutter';

  @override
  String get device_smart_toy => 'Smart toy';

  @override
  String get device_smart_router => 'Smart router / mesh system';

  @override
  String get device_smart_hub => 'Smart home hub (e.g., Homey, Home Assistant)';

  @override
  String get device_smart_meter =>
      'Intelligent electricity meter / smart meter';

  @override
  String get device_smart_irrigation => 'Smart irrigation system';

  @override
  String get device_smart_printer => 'Smart printer';

  @override
  String get q_password_text =>
      'Have you changed the default password of the device or its linked account?';

  @override
  String get q_password_hint =>
      'Default passwords are often publicly known and easy to crack.';

  @override
  String get q_updates_text =>
      'Are automatic security updates enabled for the device?';

  @override
  String get q_updates_hint =>
      'Updates close known security vulnerabilities promptly.';

  @override
  String get q_network_text =>
      'Is the device connected to a separate smart home or IoT Wi-Fi network?';

  @override
  String get q_network_hint =>
      'A dedicated network for smart devices protects your main home network.';

  @override
  String get q_informed_text =>
      'Are all people in the household informed about this device and its function?';

  @override
  String get q_informed_hint =>
      'All household members should know what data the device captures.';

  @override
  String get q_permissions_text =>
      'Have you disabled unnecessary app permissions (e.g., location, contacts)?';

  @override
  String get q_permissions_hint =>
      'Only permissions that are truly needed should be enabled.';

  @override
  String get q_mic_active_text =>
      'Do you deactivate the microphone when you are not actively using it?';

  @override
  String get q_mic_active_hint =>
      'Smart speakers and devices with microphones can be activated unintentionally.';

  @override
  String get q_camera_consent_text =>
      'Does the camera only record areas for which everyone affected has given their consent?';

  @override
  String get q_camera_consent_hint =>
      'Cameras in communal or private areas require the consent of all residents.';

  @override
  String get q_sensor_frequency_text =>
      'Can you reduce the sensor measurement interval (e.g., measure less frequently)?';

  @override
  String get q_sensor_frequency_hint =>
      'A lower measurement frequency produces less data and limits inferences about your behavior.';

  @override
  String get q_sensor_data_deletion_text =>
      'Are older measurement values deleted automatically or on request?';

  @override
  String get q_sensor_data_deletion_hint =>
      'Old historical data should not be stored permanently. Check retention settings.';

  @override
  String get q_sensor_granularity_text =>
      'Does the system show sensor data only in aggregated form (e.g., daily instead of minute values)?';

  @override
  String get q_sensor_granularity_hint =>
      'Less granular views help prevent inferences about precise presence or behavior patterns.';

  @override
  String get q_sensor_local_text =>
      'Is measurement data processed and stored locally without being transferred to the cloud?';

  @override
  String get q_sensor_local_hint =>
      'Local processing prevents the vendor from accessing your measurement data.';

  @override
  String get q_voice_history_text =>
      'Can you delete voice recordings from device history or disable this feature?';

  @override
  String get q_voice_history_hint =>
      'BSI recommendation: Minimize recording retention or delete recordings regularly.';

  @override
  String get q_voice_local_text =>
      'Is voice processing performed partly on the device locally?';

  @override
  String get q_voice_local_hint =>
      'Local processing reduces the amount of data sent to the cloud.';

  @override
  String get q_skills_permissions_text =>
      'Do you regularly review which skills have access to your account?';

  @override
  String get q_skills_permissions_hint =>
      'Third-party skills can access sensitive data. Enable only necessary skills.';

  @override
  String get q_video_encryption_text =>
      'Is video recording and transmission encrypted end-to-end?';

  @override
  String get q_video_encryption_hint =>
      'BSI recommendation: Encrypted connections prevent interception and data theft in transit.';

  @override
  String get q_video_storage_text =>
      'Are recordings stored locally (not only in the vendor cloud)?';

  @override
  String get q_video_storage_hint =>
      'Local storage gives you more control over your data; cloud-only storage depends on vendor security.';

  @override
  String get q_sharing_restrictions_text =>
      'Can you control who can access live view and recordings?';

  @override
  String get q_sharing_restrictions_hint =>
      'You should be able to precisely control access to video recordings.';

  @override
  String get q_motion_detection_text =>
      'Can you disable or schedule motion detection when you are at home?';

  @override
  String get q_motion_detection_hint =>
      'BSI recommendation: Avoiding unnecessary recordings reduces data volume and misuse risk.';

  @override
  String get q_account_required_text =>
      'Can you use the device without a mandatory online account?';

  @override
  String get q_account_required_hint =>
      'Mandatory accounts enable ad tracking and storage of viewing habits. Account-free use protects privacy.';

  @override
  String get q_tracking_disabled_text =>
      'Can you completely disable advertising and tracking features?';

  @override
  String get q_tracking_disabled_hint =>
      'Smart TVs often collect viewing habit data. Look for privacy settings.';

  @override
  String get q_local_mode_text =>
      'Can you use the device via HDMI or local sources without internet?';

  @override
  String get q_local_mode_hint =>
      'Offline use protects usage data from being sent to the vendor.';

  @override
  String get q_data_collection_text =>
      'Do temperature history and schedules stay on-device (not sent to the vendor)?';

  @override
  String get q_data_collection_hint =>
      'History can reveal presence patterns and habits. Local storage reduces unwanted analysis.';

  @override
  String get q_offline_control_text =>
      'Can you operate the thermostat offline (without internet)?';

  @override
  String get q_offline_control_hint =>
      'Offline operation or local automation protects data from cloud access.';

  @override
  String get q_family_access_text =>
      'Can you control who may adjust heating (e.g., restrict guests)?';

  @override
  String get q_family_access_hint =>
      'Household members should have control without visitors changing everything.';

  @override
  String get q_local_control_text =>
      'Can automations run locally without internet?';

  @override
  String get q_local_control_hint =>
      'Local scenes and schedules protect your privacy better.';

  @override
  String get q_usage_tracking_text =>
      'Have you disabled or limited vendor collection of switching patterns and usage times?';

  @override
  String get q_usage_tracking_hint =>
      'Usage patterns can reveal presence and habits. Check app privacy settings.';

  @override
  String get q_offline_fallback_text =>
      'Do devices still work if internet or app connection fails?';

  @override
  String get q_offline_fallback_hint =>
      'Reliable local operation is important for daily use and privacy.';

  @override
  String get q_offline_unlock_text =>
      'Can you unlock the lock offline (e.g., with code or key)?';

  @override
  String get q_offline_unlock_hint =>
      'Backup options prevent lockout during internet or power outages.';

  @override
  String get q_access_logging_text =>
      'Can you track who opened the lock and when?';

  @override
  String get q_access_logging_hint =>
      'An access log helps you detect suspicious activity.';

  @override
  String get q_two_factor_text =>
      'Is two-factor authentication (2FA) available for the lock account?';

  @override
  String get q_two_factor_hint =>
      'BSI recommendation: 2FA protects your account from unauthorized remote access.';

  @override
  String get q_map_privacy_text =>
      'Are created floor plans stored exclusively on the device locally?';

  @override
  String get q_map_privacy_hint =>
      'Home floor plans are sensitive information and should not be sent to the vendor.';

  @override
  String get q_cloud_required_text =>
      'Does floor-plan navigation work without cloud connection?';

  @override
  String get q_cloud_required_hint =>
      'Devices with local navigation are more privacy-friendly because no room data is uploaded.';

  @override
  String get q_vision_data_text =>
      'If the robot uses cameras: are camera images used locally only for navigation (no storing or transfer)?';

  @override
  String get q_vision_data_hint =>
      'Camera images should be processed locally for navigation and neither stored nor sent to the vendor.';

  @override
  String get q_parental_control_text =>
      'Are there parental control features to manage the toy?';

  @override
  String get q_parental_control_hint =>
      'Parental controls should allow restricting contacts and features.';

  @override
  String get q_child_data_limits_text =>
      'Can you limit which personal data the toy collects?';

  @override
  String get q_child_data_limits_hint =>
      'Child-focused devices should collect and store minimal data.';

  @override
  String get q_recording_disable_text =>
      'Can you disable audio and video recording on the device?';

  @override
  String get q_recording_disable_hint =>
      'BSI recommendation: Recordings of children should only be possible with explicit control.';

  @override
  String get q_expert_data_retention_duration_text =>
      'Is the retention duration for your personal data explicitly defined and limited to what is necessary?';

  @override
  String get q_expert_data_retention_duration_hint =>
      'Inspired by the CMU IoT Security & Privacy Label and Unboxing.IoT.Privacy: short, clear retention periods reduce risk.';

  @override
  String get q_expert_access_control_granular_text =>
      'Can you control access rights granularly (roles, separate accounts, no shared default logins)?';

  @override
  String get q_expert_access_control_granular_hint =>
      'Granular access control reduces the risk of unauthorized access and misuse.';

  @override
  String get q_expert_third_party_sharing_limited_text =>
      'Is third-party sharing disabled or clearly limited to necessary services?';

  @override
  String get q_expert_third_party_sharing_limited_hint =>
      'Check privacy and account settings to see whether data is sent to advertising, analytics, or partner services.';

  @override
  String get q_expert_data_sale_disabled_text =>
      'Is the sale of your data excluded (or actively disabled, where possible)?';

  @override
  String get q_expert_data_sale_disabled_hint =>
      'An explicit \"no data sale\" option is a strong privacy signal.';

  @override
  String get q_expert_update_support_window_text =>
      'Is it known how long the vendor guarantees security updates?';

  @override
  String get q_expert_update_support_window_hint =>
      'A transparent update commitment reduces long-term security and privacy risks.';

  @override
  String get q_expert_vulnerability_process_text =>
      'Is there a documented process for reporting and fixing vulnerabilities?';

  @override
  String get q_expert_vulnerability_process_hint =>
      'Prefer vendors that provide responsible disclosure policies or clear security contact information.';

  @override
  String get q_expert_offline_functionality_text =>
      'Does the device remain meaningfully usable with limited internet connectivity?';

  @override
  String get q_expert_offline_functionality_hint =>
      'More offline functionality often means less continuous data transfer to the cloud.';

  @override
  String get q_expert_bystander_transparency_text =>
      'Are people nearby transparently informed (for example via visibility, notices, clear recording indicators)?';

  @override
  String get q_expert_bystander_transparency_hint =>
      'This addresses bystander privacy and is highlighted in Unboxing.IoT.Privacy as a key challenge.';

  @override
  String get q_expert_child_data_protection_text =>
      'Are child-data protections active (minimization, no profiling, restrictive sharing)?';

  @override
  String get q_expert_child_data_protection_hint =>
      'Devices in child-related contexts require especially strict privacy safeguards.';

  @override
  String get q_expert_access_revocation_text =>
      'Can digital keys/access rights be revoked quickly and individually?';

  @override
  String get q_expert_access_revocation_hint =>
      'Fast revocation is crucial when devices are shared or users change.';

  @override
  String get a_password_title => 'Change default password';

  @override
  String get a_password_desc =>
      'Replace the default password with a strong, unique password. Use a password manager.';

  @override
  String get a_updates_title => 'Enable automatic updates';

  @override
  String get a_updates_desc =>
      'Enable automatic security updates in device or app settings.';

  @override
  String get a_network_title => 'Set up separate IoT Wi-Fi';

  @override
  String get a_network_desc =>
      'Set up a dedicated Wi-Fi network for smart home devices, for example with your router\'s guest network.';

  @override
  String get a_informed_title => 'Inform household members';

  @override
  String get a_informed_desc =>
      'Inform all residents about what data the device collects, who has access, and how it can be disabled.';

  @override
  String get a_permissions_title => 'Restrict app permissions';

  @override
  String get a_permissions_desc =>
      'Check companion-app permissions in phone settings and disable unnecessary ones.';

  @override
  String get a_camera_consent_title =>
      'Align camera positioning with residents';

  @override
  String get a_camera_consent_desc =>
      'Obtain consent from everyone affected. The camera must not record areas without consent.';

  @override
  String get a_mic_active_title => 'Disable microphone when not in use';

  @override
  String get a_mic_active_desc =>
      'Use the physical mute switch or disable the microphone in settings.';

  @override
  String get a_sensor_frequency_title => 'Reduce measurement interval';

  @override
  String get a_sensor_frequency_desc =>
      'If possible, reduce sensor measurement frequency. Less frequent measurements produce fewer behavior data points.';

  @override
  String get a_sensor_data_deletion_title => 'Delete old measurement values';

  @override
  String get a_sensor_data_deletion_desc =>
      'Review retention periods in app or web UI and enable auto deletion, or delete older data manually on a regular basis.';

  @override
  String get a_sensor_granularity_title => 'Show less detailed data';

  @override
  String get a_sensor_granularity_desc =>
      'If possible, switch to less granular display or evaluation, for example daily values instead of minute values.';

  @override
  String get a_sensor_local_title => 'Prefer local processing';

  @override
  String get a_sensor_local_desc =>
      'Check whether cloud sync can be disabled or local storage enabled so measurement data is not sent to the vendor.';

  @override
  String get a_voice_history_title => 'Delete voice recordings';

  @override
  String get a_voice_history_desc =>
      'BSI recommendation: Regularly delete voice recordings and disable voice history storage if the option is available.';

  @override
  String get a_voice_local_title => 'Enable local voice processing';

  @override
  String get a_voice_local_desc =>
      'Enable local voice processing if available. If not, minimize cloud storage of voice data.';

  @override
  String get a_skills_permissions_title => 'Review skills/integrations';

  @override
  String get a_skills_permissions_desc =>
      'Review which third-party skills have access. Disable unnecessary skills.';

  @override
  String get a_video_encryption_title => 'Enable end-to-end video encryption';

  @override
  String get a_video_encryption_desc =>
      'Enable end-to-end encrypted transmission for live view and recordings in your camera app/settings.';

  @override
  String get a_video_storage_title => 'Store recordings locally';

  @override
  String get a_video_storage_desc =>
      'Configure local storage if possible. If cloud-only storage is unavoidable, shorten the retention period and delete recordings regularly.';

  @override
  String get a_sharing_restrictions_title => 'Restrict camera access';

  @override
  String get a_sharing_restrictions_desc =>
      'Remove all unnecessary shares in the app and allow live view/recordings only for required accounts.';

  @override
  String get a_motion_detection_title =>
      'Disable motion detection when at home';

  @override
  String get a_motion_detection_desc =>
      'Disable motion detection when people are home, or set a schedule that activates it only during absence.';

  @override
  String get a_account_required_title =>
      'Minimize privacy impact of required account';

  @override
  String get a_account_required_desc =>
      'If account-free operation is not possible, use a separate account with minimal profile data and disable personalized services.';

  @override
  String get a_tracking_disabled_title => 'Disable tracking and advertising';

  @override
  String get a_tracking_disabled_desc =>
      'Disable tracking, personalized advertising, and optional telemetry in privacy settings.';

  @override
  String get a_local_mode_title => 'Prefer offline use';

  @override
  String get a_local_mode_desc =>
      'Use the device primarily via local sources (e.g., HDMI) to reduce data transfer to the vendor.';

  @override
  String get a_data_collection_title => 'Disable history upload';

  @override
  String get a_data_collection_desc =>
      'Disable transmission of temperature history to the vendor in the thermostat app and shorten the retention period.';

  @override
  String get a_offline_control_title => 'Set up local control';

  @override
  String get a_offline_control_desc =>
      'Configure local schedules and control without cloud dependency if the device supports it.';

  @override
  String get a_family_access_title =>
      'Separate access rights for household members';

  @override
  String get a_family_access_desc =>
      'Set up separate roles/accounts so that only authorized people can adjust the heating.';

  @override
  String get a_local_control_title => 'Enable local automations';

  @override
  String get a_local_control_desc =>
      'Use local scenes/schedules instead of cloud automations where available.';

  @override
  String get a_usage_tracking_title => 'Disable usage tracking';

  @override
  String get a_usage_tracking_desc =>
      'Disable analytics, telemetry, and usage data collection in app settings.';

  @override
  String get a_offline_fallback_title => 'Ensure offline fallback';

  @override
  String get a_offline_fallback_desc =>
      'Check local switches/buttons and set up fallback controls so the device remains usable without internet.';

  @override
  String get a_offline_unlock_title => 'Secure offline access';

  @override
  String get a_offline_unlock_desc =>
      'Set up a physical key or emergency code and test access when internet is unavailable.';

  @override
  String get a_access_logging_title => 'Enable access log';

  @override
  String get a_access_logging_desc =>
      'Enable logging and notifications for lock openings so unauthorized access can be detected.';

  @override
  String get a_two_factor_title => 'Enable two-factor authentication';

  @override
  String get a_two_factor_desc =>
      'BSI recommendation: Enable 2FA for your lock account to protect remote access.';

  @override
  String get a_map_privacy_title => 'Disable cloud floor-plan storage';

  @override
  String get a_map_privacy_desc =>
      'Switch storage to local and disable cloud backups of floor plans if the option is available.';

  @override
  String get a_cloud_required_title => 'Reduce cloud dependency';

  @override
  String get a_cloud_required_desc =>
      'Enable local navigation or offline mode if available. If not, consider switching to a more privacy-friendly model.';

  @override
  String get a_vision_data_title => 'Process camera data locally only';

  @override
  String get a_vision_data_desc =>
      'Disable upload/storage of camera images and use exclusively local navigation processing where possible.';

  @override
  String get a_parental_control_title => 'Set up parental controls';

  @override
  String get a_parental_control_desc =>
      'Enable parental controls with a PIN and restrict contacts, features, and sharing to what is necessary.';

  @override
  String get a_child_data_limits_title => 'Minimize data collection';

  @override
  String get a_child_data_limits_desc =>
      'Disable optional profile data and collect only the child data required for core functionality.';

  @override
  String get a_recording_disable_title => 'Disable audio/video recordings';

  @override
  String get a_recording_disable_desc =>
      'Disable recording features by default and enable them only briefly when specifically needed.';

  @override
  String get a_expert_data_retention_duration_title =>
      'Define retention periods';

  @override
  String get a_expert_data_retention_duration_desc =>
      'Set short, clear retention periods in settings and regularly delete old data.';

  @override
  String get a_expert_access_control_granular_title =>
      'Introduce granular roles and accounts';

  @override
  String get a_expert_access_control_granular_desc =>
      'Use separate accounts instead of shared logins and grant only the minimum necessary permissions.';

  @override
  String get a_expert_third_party_sharing_limited_title =>
      'Limit third-party sharing';

  @override
  String get a_expert_third_party_sharing_limited_desc =>
      'Disable partner, advertising, and analytics sharing in privacy and account settings.';

  @override
  String get a_expert_data_sale_disabled_title => 'Opt out of data sale';

  @override
  String get a_expert_data_sale_disabled_desc =>
      'Enable available \"Do not sell\" options or object to data sharing for commercial purposes.';

  @override
  String get a_expert_update_support_window_title => 'Verify update commitment';

  @override
  String get a_expert_update_support_window_desc =>
      'Review the vendor\'s official update policy and plan a device replacement if no commitment is given.';

  @override
  String get a_expert_vulnerability_process_title =>
      'Review vendor security process';

  @override
  String get a_expert_vulnerability_process_desc =>
      'Prefer vendors with a clear security contact and responsible disclosure process.';

  @override
  String get a_expert_offline_functionality_title =>
      'Prioritize offline functionality';

  @override
  String get a_expert_offline_functionality_desc =>
      'Enable local operating modes and minimize mandatory cloud features where the device allows.';

  @override
  String get a_expert_bystander_transparency_title =>
      'Add transparency notices for bystanders';

  @override
  String get a_expert_bystander_transparency_desc =>
      'Provide visible notices, recording indicators, and clear information for people in the surrounding area.';

  @override
  String get a_expert_child_data_protection_title =>
      'Strengthen child data protection';

  @override
  String get a_expert_child_data_protection_desc =>
      'Enable child-appropriate profiles, minimize data collection, and disable profiling/sharing.';

  @override
  String get a_expert_access_revocation_title =>
      'Set up rapid access revocation';

  @override
  String get a_expert_access_revocation_desc =>
      'Ensure that digital keys can be revoked individually and immediately, e.g., in case of device loss.';

  @override
  String get a_dont_know_title => 'Get to know device settings better';

  @override
  String get a_dont_know_desc =>
      'At least one question was answered with \"I don\'t know\". Review your device settings and documentation to reduce risk more effectively.';

  @override
  String get sl_base_risk => 'Baseline risk of device type';

  @override
  String get sl_child_room_bonus => 'Increased sensitivity: child\'s bedroom';

  @override
  String get sl_password => 'Default password not changed';

  @override
  String get sl_updates => 'Automatic updates not enabled';

  @override
  String get sl_network => 'No separate IoT Wi-Fi configured';

  @override
  String get sl_informed => 'Household members not informed';

  @override
  String get sl_permissions => 'App permissions not reduced';

  @override
  String get sl_camera_consent => 'No consent for camera-covered area';

  @override
  String get sl_mic_active => 'Microphone not disabled when unused';

  @override
  String get sl_sensor_frequency => 'Measurement interval not reduced';

  @override
  String get sl_sensor_data_deletion => 'Old measurement values not deleted';

  @override
  String get sl_sensor_granularity => 'Data stored with too much granularity';

  @override
  String get sl_sensor_local => 'Data transferred to cloud';

  @override
  String get sl_voice_history => 'Voice recordings not deletable';

  @override
  String get sl_voice_local => 'No local voice processing';

  @override
  String get sl_skills_permissions => 'Skills not reviewed regularly';

  @override
  String get sl_video_encryption => 'Video transmission not encrypted';

  @override
  String get sl_video_storage => 'Recordings only in vendor cloud';

  @override
  String get sl_sharing_restrictions => 'Recording access not controlled';

  @override
  String get sl_motion_detection => 'Motion detection always active';

  @override
  String get sl_account_required => 'Mandatory vendor account required';

  @override
  String get sl_tracking_disabled => 'Ad tracking not disabled';

  @override
  String get sl_local_mode => 'No offline operation possible';

  @override
  String get sl_data_collection => 'Temperature history sent to vendor';

  @override
  String get sl_offline_control => 'No offline operation possible';

  @override
  String get sl_family_access => 'Access cannot be restricted';

  @override
  String get sl_local_control => 'Automations require internet connection';

  @override
  String get sl_usage_tracking => 'Switching patterns collected by vendor';

  @override
  String get sl_offline_fallback => 'Device unusable offline';

  @override
  String get sl_offline_unlock => 'No offline unlock possible';

  @override
  String get sl_access_logging => 'No access log available';

  @override
  String get sl_two_factor => 'Two-factor authentication missing';

  @override
  String get sl_map_privacy => 'Floor plan transmitted to vendor';

  @override
  String get sl_cloud_required => 'Navigation only possible via cloud';

  @override
  String get sl_vision_data => 'Camera images stored or transmitted';

  @override
  String get sl_parental_control => 'Parental controls not configured';

  @override
  String get sl_child_data_limits => 'Data collection not limited';

  @override
  String get sl_recording_disable => 'Recording cannot be disabled';

  @override
  String get sl_expert_data_retention_duration =>
      'Retention duration unclear or too long';

  @override
  String get sl_expert_access_control_granular =>
      'Granular access control missing';

  @override
  String get sl_expert_third_party_sharing_limited =>
      'Third-party sharing not limited';

  @override
  String get sl_expert_data_sale_disabled => 'Data sale not excluded';

  @override
  String get sl_expert_update_support_window =>
      'Guaranteed update support window unknown';

  @override
  String get sl_expert_vulnerability_process =>
      'Vulnerability process not documented';

  @override
  String get sl_expert_offline_functionality =>
      'Meaningful offline operation not possible';

  @override
  String get sl_expert_bystander_transparency =>
      'Transparency for nearby bystanders missing';

  @override
  String get sl_expert_child_data_protection =>
      'Child-data protection measures missing';

  @override
  String get sl_expert_access_revocation =>
      'Individual access revocation not possible';

  @override
  String get risk_hint_camera =>
      'You answered all questions positively. However, baseline risk remains higher for cameras because they capture highly sensitive observation data and can be misused for surveillance if misconfigured.';

  @override
  String get risk_hint_mic =>
      'You answered all questions positively. However, baseline risk remains elevated for microphone devices because voice data is highly sensitive and accidental activation or cloud processing still carries risks.';

  @override
  String get risk_hint_lock =>
      'You answered all questions positively. However, smart locks still have elevated baseline risk because misuse directly affects physical access to your home.';

  @override
  String get risk_hint_child_room =>
      'You answered all questions positively. However, baseline risk remains elevated in a child\'s bedroom because especially sensitive data about children and their daily life can be affected there.';

  @override
  String get risk_hint_generic =>
      'You answered all questions positively. The device can still remain medium/high risk because its type may reveal sensitive usage and behavior data.';

  @override
  String get gen_rec_0 =>
      'Set up a separate Wi-Fi network for smart home devices (e.g., your router\'s guest network).';

  @override
  String get gen_rec_1 =>
      'Use a password manager and assign a unique, strong password to each device.';

  @override
  String get gen_rec_2 =>
      'Enable multi-factor authentication (MFA) for all vendor accounts.';

  @override
  String get gen_rec_3 =>
      'Define who in your household is responsible for updates, backups, and accounts.';

  @override
  String get gen_rec_4 =>
      'Regularly review (at least once per quarter) all access permissions and accounts.';

  @override
  String get gen_rec_5 =>
      'Dispose of old devices in a privacy-safe way: perform a factory reset and remove them from vendor cloud accounts.';

  @override
  String get gen_rec_6 =>
      'Use a household consent check before buying new devices and involve all household members.';
}
