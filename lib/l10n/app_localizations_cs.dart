// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appTitle => 'Simplications';

  @override
  String get welcomeTitle =>
      'Simplications\nKontrola soukromí\nchytré domácnosti';

  @override
  String get welcomeDescription =>
      'Zaznamenejte svá chytrá zařízení místnost po místnosti a získejte hodnocení soukromí s konkrétními doporučeními.';

  @override
  String get stepSelectRooms => 'Vyberte místnost';

  @override
  String get stepCaptureDevices => 'Zaznamenejte zařízení';

  @override
  String get stepAnswerQuestions => 'Odpovězte na otázky';

  @override
  String get stepGetRisk => 'Získejte rizikový profil a doporučení';

  @override
  String get start => 'Začít';

  @override
  String get resume => 'Pokračovat';

  @override
  String get about => 'O aplikaci';

  @override
  String get faq => 'FAQ';

  @override
  String get roomSelectionTitle => 'Výběr místnosti';

  @override
  String get roomQuestion => 'Kterou místnost chcete nyní zkontrolovat?';

  @override
  String get roomInstruction =>
      'Klepněte na místnost, zaznamenejte v ní zařízení a vraťte se sem, kde vyberete další místnost.';

  @override
  String get results => 'Výsledky';

  @override
  String get alreadyEvaluated => 'Již vyhodnoceno';

  @override
  String get notCompleted => 'Nedokončeno';

  @override
  String get addRoom => 'Přidat místnost';

  @override
  String get deviceTitlePrefix => 'Zařízení';

  @override
  String get roomCheck => 'Kontrola místnosti';

  @override
  String get deviceQuestion =>
      'Která chytrá zařízení používáte v této místnosti?';

  @override
  String get deviceQuestionHint =>
      'Klepněte na zařízení a odpovězte na otázky.';

  @override
  String get noKnownDevices =>
      'Pro tuto místnost nejsou známá žádná zařízení. Můžete přidat vlastní zařízení.';

  @override
  String get addDevice => 'Přidat\nzařízení';

  @override
  String get noDevice => 'Žádné zařízení';

  @override
  String get nextRoom => 'Další místnost';

  @override
  String get deleteDeviceTitle => 'Smazat zařízení?';

  @override
  String get deleteDeviceBody =>
      'Toto vlastní zařízení bude smazáno. Všechny navázané instance budou také odstraněny.';

  @override
  String get delete => 'Smazat';

  @override
  String get cancel => 'Zrušit';

  @override
  String get confirm => 'Potvrdit';

  @override
  String get noDeviceDialogTitle => 'V této místnosti nejsou zařízení?';

  @override
  String get noDeviceDialogBody =>
      'Tato místnost bude uzavřena bez zařízení a neovlivní hodnocení.';

  @override
  String get noDeviceDialogBodyWithExisting =>
      'Existující výběry zařízení pro tuto místnost budou zahozeny. Tato místnost bude uzavřena bez zařízení a neovlivní hodnocení.';

  @override
  String get questionnaireTitle => 'Otázky';

  @override
  String get connectedDevice => 'Připojené zařízení';

  @override
  String get done => 'Hotovo';

  @override
  String get yes => 'Ano';

  @override
  String get no => 'Ne';

  @override
  String get dontKnow => 'Nevím';

  @override
  String get notApplicableForDevice =>
      'Tato otázka se na moje zařízení nevztahuje';

  @override
  String get languageDialogTitle => 'Vyberte jazyk';

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
  String get currentLanguage => 'Aktuální jazyk';

  @override
  String get aboutScreenTitle => 'O aplikaci';

  @override
  String get faqScreenTitle => 'Často kladené otázky';

  @override
  String get aboutSubtitle =>
      'Výzkumný projekt zaměřený na soukromí chytré domácnosti';

  @override
  String get aboutProjectName => 'Simplications';

  @override
  String get aboutPartnerTuChemnitz => 'Technická univerzita v Chemnitzu';

  @override
  String get aboutPartnerHsAnhalt => 'Vysoká škola Anhalt';

  @override
  String get aboutPartnerVzSachsen => 'Spotřebitelské centrum Sasko';

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
  String get faqQuestionWhatIs => 'Co je Simplications?';

  @override
  String get faqAnswerWhatIs =>
      'Simplications je výzkumný projekt zaměřený na soukromí v chytré domácnosti. Tato aplikace je jednou z částí projektu a provede vás místnost po místnosti vašimi zařízeními s praktickými doporučeními na základě vašich odpovědí.';

  @override
  String get faqQuestionHowWorks => 'Jak kontrola funguje?';

  @override
  String get faqAnswerHowWorks =>
      'Vyberete místnost, přidáte chytrá zařízení, odpovíte na otázky pro konkrétní zařízení a získáte profil rizik s prioritizovanými kroky.';

  @override
  String get faqQuestionNoPolicy =>
      'Proč tu není zásada ochrany osobních údajů?';

  @override
  String get faqAnswerNoPolicy => 'Protože neshromažďujeme vaše data.';

  @override
  String get faqQuestionDataStored => 'Kde jsou moje data uložena?';

  @override
  String get faqAnswerDataStored =>
      'Vaše hodnocení je uloženo lokálně ve vašem zařízení. V obrazovce O aplikaci můžete všechna uložená data kdykoli smazat.';

  @override
  String get faqQuestionNoDevice => 'Co když moje zařízení není v seznamu?';

  @override
  String get faqAnswerNoDevice =>
      'Můžete přidat vlastní zařízení a kontrolu dokončit. Doporučení pak vycházejí z vaší konfigurace a odpovědí.';

  @override
  String get faqQuestionRiskMeaning =>
      'Co znamená nízké, střední a vysoké riziko?';

  @override
  String get faqAnswerRiskMeaning =>
      'Tyto úrovně ukazují, jak silně může vaše současné nastavení zvyšovat rizika pro soukromí. Jde o orientační úrovně, ne o právní nebo technickou certifikaci.';

  @override
  String get faqQuestionLegalAdvice => 'Jde o právní poradenství?';

  @override
  String get faqAnswerLegalAdvice =>
      'Ne. Simplications poskytuje praktickou orientaci a doporučení, nenahrazuje však právní nebo profesionální bezpečnostní poradenství.';

  @override
  String get faqQuestionCanShare => 'Mohu sdílet své výsledky?';

  @override
  String get faqAnswerCanShare =>
      'Ano. Na obrazovce výsledků můžete přehled exportovat a sdílet jako text nebo PDF.';

  @override
  String get websiteOpenFailed => 'Web se nepodařilo otevřít.';

  @override
  String get deleteAllDataTitle => 'Smazat všechna data?';

  @override
  String get deleteAllDataBody =>
      'Všechny zaznamenané místnosti, zařízení a odpovědi budou trvale smazány. Tuto akci nelze vrátit zpět.';

  @override
  String get deleteAllDataButton => 'Smazat data';

  @override
  String get allDataDeleted => 'Všechna uložená data byla smazána.';

  @override
  String get projectPartners => 'Projektoví partneři';

  @override
  String get coordinationFunding => 'Koordinace a financování';

  @override
  String get coordination => 'Koordinace';

  @override
  String get platformPrivacy => 'Plattform Privatheit';

  @override
  String get fundingAgency => 'Poskytovatel financování';

  @override
  String get fundingAgencyValue =>
      'Spolkové ministerstvo pro výzkum, technologie a vesmír\nFKZ 16KIS1868K';

  @override
  String get website => 'Web';

  @override
  String get dangerZone => 'Nebezpečná zóna';

  @override
  String get dangerZoneWarning =>
      'Pozor: Tato akce trvale odstraní všechna uložená data aplikace.';

  @override
  String get expertModeTitle => 'Expertní režim';

  @override
  String get expertModeToggleLabel => 'Zapnout podrobný expertní režim';

  @override
  String get expertModeToggleHint =>
      'Stejný postup, ale mnohem podrobnější otázky k zařízením (např. doba uchování, řízení přístupu, sdílení se třetími stranami).';

  @override
  String get expertModeSourcesHint =>
      'Metodicky inspirováno následujícími výzkumnými projekty:';

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
      'Expertní režim: tyto otázky jdou hlouběji do práce s daty a řízení ochrany soukromí (včetně doby uchování, řízení přístupu a sdílení se třetími stranami) na základě přístupů CMU IoT Label a Unboxing.IoT.Privacy.';

  @override
  String get roomDeleteTitle => 'Smazat místnost?';

  @override
  String get roomDeleteBody =>
      'Tato vlastní místnost bude smazána. Všechna propojená zařízení budou také odstraněna.';

  @override
  String get add => 'Přidat';

  @override
  String get addRoomDialogTitle => 'Přidat novou místnost';

  @override
  String get roomName => 'Název místnosti';

  @override
  String get roomNameHint => 'např. Obývací pokoj, Garáž';

  @override
  String get chooseIcon => 'Vyberte ikonu:';

  @override
  String get addDeviceDialogTitle => 'Přidat nové zařízení';

  @override
  String get deviceName => 'Název zařízení';

  @override
  String get deviceNameHint => 'např. Můj chytrý reproduktor';

  @override
  String get baseRiskLabel => 'Základní skóre rizika (0-100)';

  @override
  String get baseRiskHint => 'např. 30 (nízké) až 60 (vysoké)';

  @override
  String get hasCamera => 'Má kameru?';

  @override
  String get hasMicrophone => 'Má mikrofon?';

  @override
  String get camera => 'Kamera';

  @override
  String get microphone => 'Mikrofon';

  @override
  String get summaryTitle => 'Váš výsledek';

  @override
  String get shareResult => 'Sdílet výsledek';

  @override
  String get shareAsText => 'Sdílet jako text';

  @override
  String get shareAsPdf => 'Sdílet jako PDF';

  @override
  String get restart => 'Začít znovu';

  @override
  String get noDevicesCaptured => 'Nebyla zaznamenána žádná zařízení.';

  @override
  String get noDevicesHint =>
      'Spusťte to znovu a přidejte zařízení, abyste získali hodnocení.';

  @override
  String get highRisk => 'Vysoké riziko';

  @override
  String get mediumRisk => 'Střední riziko';

  @override
  String get lowRisk => 'Nízké riziko';

  @override
  String get exportFailed => 'Export se nezdařil';

  @override
  String get summaryShareSubject => 'Výsledek Simplications';

  @override
  String get summarySharePdfText => 'Zpráva Simplications jako PDF';

  @override
  String get summaryPdfFileName => 'simplications-vysledek.pdf';

  @override
  String get overview => 'Přehled';

  @override
  String get evaluatedDevices => 'Vyhodnocená zařízení';

  @override
  String skippedDevicesHint(Object count) {
    return '$count zařízení přeskočeno, protože dotazník nebyl dokončen.';
  }

  @override
  String get overallRisk => 'Celkové riziko';

  @override
  String get generalRecommendations => 'Obecná doporučení';

  @override
  String get generalRecommendationsHint =>
      'Tato opatření platí pro celou vaši chytrou domácnost bez ohledu na jednotlivá zařízení.';

  @override
  String get fullCatalog => 'Úplný katalog opatření';

  @override
  String get catalogButton => 'Otevřít úplný katalog opatření';

  @override
  String get risk => 'Riziko';

  @override
  String get note => 'Poznámka';

  @override
  String get recommendations => 'Doporučení';

  @override
  String get urgent => 'Naléhavé';

  @override
  String get recommended => 'Doporučeno';

  @override
  String get optional => 'Volitelné';

  @override
  String get social => 'Sociální';

  @override
  String get technical => 'Technické';

  @override
  String get security => 'Zabezpečení';

  @override
  String get smartHomePrivacyHeader => 'Vaše soukromí chytré domácnosti';

  @override
  String get devicesRated => 'hodnocených zařízení';

  @override
  String get howRiskCalculated => 'Jak se riziko počítá?';

  @override
  String get totalScore => 'Celkem';

  @override
  String get catalogSnackBarPrefix => 'Katalog';

  @override
  String get reportExportedAt => 'Exportováno';

  @override
  String get noActionLow => 'Vše je v pořádku - nejsou nutná žádná opatření.';

  @override
  String get noActionMedium =>
      'Z vašich odpovědí nyní nelze odvodit konkrétní opatření, ale zůstává střední zbytkové riziko.';

  @override
  String get noActionHigh =>
      'Z vašich odpovědí nyní nelze odvodit konkrétní opatření, ale zůstává vysoké zbytkové riziko.';

  @override
  String get overallLow =>
      'Skvělá práce! Vaše zařízení jsou většinou bezpečně nastavena. Přesto si projděte obecná doporučení.';

  @override
  String get overallMedium =>
      'Je zde prostor ke zlepšení. Projděte si doporučení pro jednotlivá zařízení.';

  @override
  String get overallHigh =>
      'Několik zařízení má významná rizika pro soukromí/ochranu dat. Prosím co nejdříve zaveďte opatření s vysokou prioritou.';

  @override
  String dontKnowHint(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count odpovědi byly označeny jako \"Nevím\" - věnujte čas lepšímu poznání nastavení svých zařízení.',
      one:
          '1 odpověď byla označena jako \"Nevím\" - věnujte čas lepšímu poznání nastavení svých zařízení.',
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
  String get device_fitness_tracker => 'Fitness tracker / smartwatch';

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
  String get device_smart_scale => 'Smart scale';

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
  String get q_health_sharing_text =>
      'Can you control which third parties can access your health data?';

  @override
  String get q_health_sharing_hint =>
      'Health data is sensitive. Only authorized apps should have access.';

  @override
  String get q_location_tracking_text =>
      'Can you disable location tracking when not needed?';

  @override
  String get q_location_tracking_hint =>
      'GPS tracking uses battery and can reveal movement patterns.';

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
  String get q_expert_sensitive_inference_controls_text =>
      'Are features that infer sensitive health or behavior profiles restricted or disableable?';

  @override
  String get q_expert_sensitive_inference_controls_hint =>
      'Inference controls reduce risks from secondary use of sensitive data.';

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
  String get a_health_sharing_title => 'Restrict health data sharing';

  @override
  String get a_health_sharing_desc =>
      'Revoke health data access from unnecessary third-party apps in app and account settings.';

  @override
  String get a_location_tracking_title => 'Reduce location sharing';

  @override
  String get a_location_tracking_desc =>
      'Disable location tracking outside active use or allow it only while the app is in use.';

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
  String get a_expert_sensitive_inference_controls_title =>
      'Restrict inference features';

  @override
  String get a_expert_sensitive_inference_controls_desc =>
      'Disable features that infer sensitive health or behavioral profiles unless strictly necessary.';

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
  String get sl_health_sharing => 'Health data shared with third parties';

  @override
  String get sl_location_tracking => 'Location tracking enabled';

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
  String get sl_expert_sensitive_inference_controls =>
      'Controls against sensitive inference missing';

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
      'Nastavte oddělenou síť Wi-Fi pro zařízení chytré domácnosti (např. síť pro hosty na routeru).';

  @override
  String get gen_rec_1 =>
      'Používejte správce hesel a každému zařízení přiřaďte jedinečné silné heslo.';

  @override
  String get gen_rec_2 =>
      'Zapněte vícefaktorové ověřování (MFA) pro všechny účty u dodavatelů.';

  @override
  String get gen_rec_3 =>
      'Určete, kdo ve vaší domácnosti odpovídá za aktualizace, zálohy a účty.';

  @override
  String get gen_rec_4 =>
      'Pravidelně kontrolujte (alespoň jednou za čtvrt roku) všechna přístupová oprávnění a účty.';

  @override
  String get gen_rec_5 =>
      'Starých zařízení se zbavujte způsobem bezpečným pro soukromí: proveďte tovární reset a odeberte je z cloudových účtů dodavatele.';

  @override
  String get gen_rec_6 =>
      'Před nákupem nových zařízení si v domácnosti potvrďte souhlas a zapojte všechny členy domácnosti.';
}
