import 'package:flutter/widgets.dart';

class AppLocalizations {
  final Locale locale;
  static Locale _activeLocale = const Locale('de');

  AppLocalizations(this.locale);

  static const supportedLocales = <Locale>[
    Locale('de'),
    Locale('cs'),
    Locale('en'),
    Locale('pl'),
    Locale('fr'),
    Locale('nl'),
    Locale('da'),
  ];

  static AppLocalizations of(BuildContext context) {
    final localizations = Localizations.of<AppLocalizations>(
      context,
      AppLocalizations,
    );
    final resolved = localizations ?? AppLocalizations(const Locale('de'));
    _activeLocale = resolved.locale;
    return resolved;
  }

  static String get activeLanguageCode => _activeLocale.languageCode;

  static String translate(
    String key, {
    String? fallback,
    Locale? locale,
    Map<String, String>? params,
  }) {
    final lang = (locale ?? _activeLocale).languageCode;
    final langMap = _localizedValues[lang];
    final enMap = _localizedValues['en'];
    final deMap = _localizedValues['de'];

    var value = langMap?[key] ?? enMap?[key] ?? deMap?[key] ?? fallback ?? key;
    if (params != null && params.isNotEmpty) {
      params.forEach((paramKey, paramValue) {
        value = value.replaceAll('{$paramKey}', paramValue);
      });
    }
    return value;
  }

  static AppLocalizations activate(Locale locale) {
    _activeLocale = locale;
    return AppLocalizations(locale);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static const Map<String, Map<String, String>> _localizedValues = {
    'de': {
      'appTitle': 'Simplications',
      'welcomeTitle': 'Der Simplications\nSmart Home\nPrivatsphäre-Check',
      'welcomeDescription':
          'Erfassen Sie Raum für Raum Ihre smarten Geräte und erhalten Sie eine Privatsphärebewertung mit konkreten Empfehlungen.',
      'stepSelectRooms': 'Raum auswählen',
      'stepCaptureDevices': 'Geräte erfassen',
      'stepAnswerQuestions': 'Fragen beantworten',
      'stepGetRisk': 'Risikoprofil & Empfehlungen erhalten',
      'start': 'Starten',
      'resume': 'Fortsetzen',
      'about': 'Über',
      'faq': 'FAQ',
      'roomSelectionTitle': 'Raum auswählen',
      'roomQuestion': 'Welchen Raum möchten Sie jetzt prüfen?',
      'roomInstruction':
          'Tippen Sie auf einen Raum, erfassen Sie dort Ihre Geräte und kehren Sie dann hierher zurück, um den nächsten Raum zu wählen.',
      'results': 'Ergebnisse',
      'alreadyEvaluated': 'Bereits ausgewertet',
      'notCompleted': 'Nicht abgeschlossen',
      'addRoom': 'Raum hinzufügen',
      'deviceTitlePrefix': 'Geräte',
      'roomCheck': 'Raum-Check',
      'deviceQuestion': 'Welche smarten Geräte nutzen Sie in diesem Raum?',
      'deviceQuestionHint':
          'Tippen Sie auf ein Gerät, um die Fragen dafür zu beantworten.',
      'noKnownDevices':
          'Keine bekannten Geräte für diesen Raum. Sie können ein eigenes Gerät hinzufügen.',
      'addDevice': 'Gerät\nhinzufügen',
      'noDevice': 'Kein Gerät',
      'nextRoom': 'Nächster Raum',
      'deleteDeviceTitle': 'Gerät löschen?',
      'deleteDeviceBody':
          'Dieses benutzerdefinierte Gerät wird gelöscht. Alle verknüpften Instanzen werden auch entfernt.',
      'delete': 'Löschen',
      'cancel': 'Abbrechen',
      'confirm': 'Bestätigen',
      'noDeviceDialogTitle': 'Keine Geräte in diesem Raum?',
      'noDeviceDialogBody':
          'Dieser Raum wird ohne Geräte abgeschlossen und fließt nicht in die Bewertung ein.',
      'noDeviceDialogBodyWithExisting':
          'Vorhandene Geräteauswahlen für diesen Raum werden verworfen. Dieser Raum wird ohne Geräte abgeschlossen und fließt nicht in die Bewertung ein.',
      'questionnaireTitle': 'Fragen',
      'connectedDevice': 'Verbundenes Gerät',
      'done': 'Fertig',
      'yes': 'Ja',
      'no': 'Nein',
      'dontKnow': 'Weiß ich nicht',
      'notApplicableForDevice': 'Diese Frage trifft auf mein Gerät nicht zu',
      'languageDialogTitle': 'Sprache wählen',
      'currentLanguage': 'Aktuelle Sprache',
      'aboutScreenTitle': 'Über die App',
      'faqScreenTitle': 'Häufige Fragen',
      'aboutSubtitle': 'Forschungsprojekt Smart Home Privatsphäre',
      'aboutProjectName': 'Simplications',
      'aboutPartnerTuChemnitz': 'Technische Universität Chemnitz',
      'aboutPartnerHsAnhalt': 'Hochschule Anhalt',
      'aboutPartnerVzSachsen': 'Verbraucherzentrale Sachsen e.V.',
      'aboutWebsiteSimplicationsLabel': 'simplications.tucmi.de',
      'aboutWebsiteSimplicationsUrl': 'https://simplications.tucmi.de',
      'aboutWebsiteTuChemnitzLabel': 'tu-chemnitz.de',
      'aboutWebsiteTuChemnitzUrl': 'https://www.tu-chemnitz.de',
      'aboutWebsiteHsAnhaltLabel': 'hs-anhalt.de',
      'aboutWebsiteHsAnhaltUrl': 'https://www.hs-anhalt.de',
      'aboutWebsiteVzSachsenLabel': 'verbraucherzentrale-sachsen.de',
      'aboutWebsiteVzSachsenUrl': 'https://www.verbraucherzentrale-sachsen.de',
      'aboutWebsitePlatformPrivacyLabel': 'plattform-privatheit.de',
      'aboutWebsitePlatformPrivacyUrl': 'https://www.plattform-privatheit.de',
      'aboutWebsiteFundingAgencyLabel': 'bmftr.bund.de',
      'aboutWebsiteFundingAgencyUrl': 'https://www.bmftr.bund.de',
      'faqQuestionWhatIs': 'Was ist Simplications?',
      'faqAnswerWhatIs':
          'Simplications ist ein Forschungsprojekt zum Smart-Home-Datenschutz. Diese App ist ein Teil des Projekts und führt Sie Raum für Raum durch Ihre Geräte mit praktischen Empfehlungen auf Basis Ihrer Antworten.',
      'faqQuestionHowWorks': 'Wie funktioniert der Check?',
      'faqAnswerHowWorks':
          'Sie wählen einen Raum, erfassen Ihre smarten Geräte, beantworten gerätespezifische Fragen und erhalten ein Risikoprofil mit priorisierten Maßnahmen.',
      'faqQuestionNoPolicy': 'Warum gibt es keine Datenschutzerklärung?',
      'faqAnswerNoPolicy': 'Weil wir keine Daten von Ihnen erheben.',
      'faqQuestionDataStored': 'Wo werden meine Daten gespeichert?',
      'faqAnswerDataStored':
          'Ihre Eingaben werden lokal auf Ihrem Gerät gespeichert. In der Über-Seite können Sie alle gespeicherten Daten jederzeit löschen.',
      'faqQuestionNoDevice': 'Was ist, wenn mein Gerät nicht in der Liste ist?',
      'faqAnswerNoDevice':
          'Sie können eigene Geräte hinzufügen und den Check trotzdem durchführen. Die Empfehlungen basieren dann auf Ihrer Konfiguration und Ihren Antworten.',
      'faqQuestionRiskMeaning':
          'Was bedeuten niedriges, mittleres und hohes Risiko?',
      'faqAnswerRiskMeaning':
          'Diese Stufen zeigen, wie stark Ihre aktuelle Konfiguration Privatsphäre-Risiken begünstigen kann. Sie sind eine Orientierung und keine rechtliche oder technische Zertifizierung.',
      'faqQuestionLegalAdvice': 'Ist das eine Rechtsberatung?',
      'faqAnswerLegalAdvice':
          'Nein. Simplications bietet praktische Orientierung und Empfehlungen, ersetzt aber keine rechtliche oder professionelle Sicherheitsberatung.',
      'faqQuestionCanShare': 'Kann ich mein Ergebnis teilen?',
      'faqAnswerCanShare':
          'Ja. Im Ergebnisbildschirm können Sie Ihre Zusammenfassung direkt als Text oder PDF exportieren und teilen.',
      'websiteOpenFailed': 'Website konnte nicht geöffnet werden.',
      'deleteAllDataTitle': 'Alle Daten löschen?',
      'deleteAllDataBody':
          'Alle erfassten Räume, Geräte und Antworten werden dauerhaft gelöscht. Diese Aktion kann nicht rückgängig gemacht werden.',
      'deleteAllDataButton': 'Daten löschen',
      'allDataDeleted': 'Alle gespeicherten Daten wurden gelöscht.',
      'projectPartners': 'Projektpartner',
      'coordinationFunding': 'Koordination & Förderung',
      'coordination': 'Koordination',
      'platformPrivacy': 'Plattform Privatheit',
      'fundingAgency': 'Fördermittelgeber',
      'fundingAgencyValue':
          'Bundesministerium für Forschung, Technologie und Raumfahrt\nFKZ 16KIS1868K',
      'website': 'Website',
      'dangerZone': 'Gefahrenbereich',
      'dangerZoneWarning':
          'Achtung: Diese Aktion entfernt alle gespeicherten App-Daten dauerhaft.',
      'expertModeTitle': 'Expertenmodus',
      'expertModeToggleLabel': 'Detaillierten Expertenmodus aktivieren',
      'expertModeToggleHint':
          'Gleicher Ablauf, aber deutlich detailliertere Fragen pro Gerät (z. B. Aufbewahrungsdauer, Zugriffskontrolle, Drittweitergabe).',
      'expertModeSourcesHint':
          'Methodisch angelehnt an folgende Forschungsprojekte:',
      'expertModeSourceCmuLabel': 'CMU IoT Security & Privacy Label (CISPL)',
      'expertModeSourceCmuUrl': 'https://iotsecurityprivacy.org/labels',
      'expertModeSourceUnboxingLabel':
          'Unboxing.IoT.Privacy (Community-Plattform)',
      'expertModeSourceUnboxingUrl': 'https://iot-privacy.info/project/',
      'expertModeQuestionnaireHint':
          'Expertenmodus: Diese Fragen vertiefen Datenpraktiken und Governance (u. a. Speicherfristen, Zugriffskontrolle, Drittweitergabe) nach Ansätzen aus CMU IoT Label und Unboxing.IoT.Privacy.',
      'roomDeleteTitle': 'Raum löschen?',
      'roomDeleteBody':
          'Dieser benutzerdefinierte Raum wird gelöscht. Alle verknüpften Geräte werden auch entfernt.',
      'add': 'Hinzufügen',
      'addRoomDialogTitle': 'Neuen Raum hinzufügen',
      'roomName': 'Raumname',
      'roomNameHint': 'z. B. Wohnzimmer, Garage',
      'chooseIcon': 'Symbol wählen:',
      'addDeviceDialogTitle': 'Neues Gerät hinzufügen',
      'deviceName': 'Gerätename',
      'deviceNameHint': 'z. B. Mein Smart Speaker',
      'baseRiskLabel': 'Basis-Risiko-Punktzahl (0-100)',
      'baseRiskHint': 'z. B. 30 (niedrig) bis 60 (hoch)',
      'hasCamera': 'Hat Kamera?',
      'hasMicrophone': 'Hat Mikrofon?',
      'camera': 'Kamera',
      'microphone': 'Mikrofon',
      'summaryTitle': 'Ihr Ergebnis',
      'shareResult': 'Ergebnis teilen',
      'shareAsText': 'Als Text teilen',
      'shareAsPdf': 'Als PDF teilen',
      'restart': 'Neu starten',
      'noDevicesCaptured': 'Keine Geräte erfasst.',
      'noDevicesHint':
          'Starten Sie erneut und fügen Sie Geräte hinzu, um eine Bewertung zu erhalten.',
      'highRisk': 'Hohes Risiko',
      'mediumRisk': 'Mittleres Risiko',
      'lowRisk': 'Niedriges Risiko',
      'exportFailed': 'Export fehlgeschlagen',
      'summaryShareSubject': 'Simplications Ergebnis',
      'summarySharePdfText': 'Simplications Ergebnisbericht als PDF',
      'overview': 'Übersicht',
      'evaluatedDevices': 'Bewertete Geräte',
      'overallRisk': 'Gesamtrisiko',
      'generalRecommendations': 'Allgemeine Empfehlungen',
      'generalRecommendationsHint':
          'Diese Maßnahmen gelten unabhängig von einzelnen Geräten für Ihr gesamtes Smart Home.',
      'fullCatalog': 'Vollständiger Maßnahmenkatalog',
      'catalogButton': 'Zum vollständigen Maßnahmenkatalog',
      'risk': 'Risiko',
      'note': 'Hinweis',
      'recommendations': 'Empfehlungen',
      'urgent': 'Dringend',
      'recommended': 'Empfohlen',
      'optional': 'Optional',
      'social': 'Sozial',
      'technical': 'Technisch',
      'security': 'Sicherheit',
      'smartHomePrivacyHeader': 'Ihr Smart-Home-Datenschutz',
      'devicesRated': 'bewertete Geräte',
      'howRiskCalculated': 'Wie wird das Risiko berechnet?',
      'totalScore': 'Gesamt',
      'catalogSnackBarPrefix': 'Maßnahmenkatalog',
      'reportExportedAt': 'Exportiert am',
      'noActionLow': 'Alles in Ordnung - keine Maßnahmen erforderlich.',
      'noActionMedium':
          'Aktuell keine konkreten Maßnahmen aus Ihren Antworten ableitbar, aber es bleibt ein mittleres Restrisiko.',
      'noActionHigh':
          'Aktuell keine konkreten Maßnahmen aus Ihren Antworten ableitbar, aber es bleibt ein hohes Restrisiko.',
      'overallLow':
          'Gut gemacht! Ihre Geräte sind überwiegend sicher konfiguriert. Schauen Sie trotzdem in die allgemeinen Empfehlungen.',
      'overallMedium':
          'Es gibt Verbesserungspotenzial. Schauen Sie sich die Empfehlungen zu den einzelnen Geräten an.',
      'overallHigh':
          'Mehrere Geräte haben erhebliche Privatsphäre-/Datenschutzrisiken. Bitte setzen Sie die Maßnahmen mit hoher Priorität zeitnah um.',
      'dontKnowHint':
          ' Es wurden {count} Antwort{suffix} mit "Weiß ich nicht" gegeben - nehmen Sie sich Zeit, die Einstellungen Ihrer Geräte besser kennenzulernen.',
    },
    'en': {
      'appTitle': 'Simplications',
      'welcomeTitle': 'Simplications\nSmart Home\nPrivacy Check',
      'welcomeDescription':
          'Capture your smart devices room by room and receive a privacy assessment with concrete recommendations.',
      'stepSelectRooms': 'Select room',
      'stepCaptureDevices': 'Capture devices',
      'stepAnswerQuestions': 'Answer questions',
      'stepGetRisk': 'Get risk profile & recommendations',
      'start': 'Start',
      'resume': 'Resume',
      'about': 'About',
      'faq': 'FAQ',
      'roomSelectionTitle': 'Select room',
      'roomQuestion': 'Which room would you like to check now?',
      'roomInstruction':
          'Tap a room, capture your devices there, then return here to choose the next room.',
      'results': 'Results',
      'alreadyEvaluated': 'Already evaluated',
      'notCompleted': 'Not completed',
      'addRoom': 'Add room',
      'deviceTitlePrefix': 'Devices',
      'roomCheck': 'Room check',
      'deviceQuestion': 'Which smart devices do you use in this room?',
      'deviceQuestionHint': 'Tap a device to answer its questions.',
      'noKnownDevices':
          'No known devices for this room. You can add your own device.',
      'addDevice': 'Add\ndevice',
      'noDevice': 'No device',
      'nextRoom': 'Next room',
      'deleteDeviceTitle': 'Delete device?',
      'deleteDeviceBody':
          'This custom device will be deleted. All linked instances will also be removed.',
      'delete': 'Delete',
      'cancel': 'Cancel',
      'confirm': 'Confirm',
      'noDeviceDialogTitle': 'No devices in this room?',
      'noDeviceDialogBody':
          'This room will be completed without devices and will not affect scoring.',
      'noDeviceDialogBodyWithExisting':
          'Existing device selections for this room will be discarded. This room will be completed without devices and will not affect scoring.',
      'questionnaireTitle': 'Questions',
      'connectedDevice': 'Connected device',
      'done': 'Done',
      'yes': 'Yes',
      'no': 'No',
      'dontKnow': "I don't know",
      'notApplicableForDevice': 'This question does not apply to my device',
      'languageDialogTitle': 'Choose language',
      'currentLanguage': 'Current language',
      'aboutScreenTitle': 'About the app',
      'faqScreenTitle': 'Frequently Asked Questions',
      'aboutSubtitle': 'Research project on smart home privacy',
      'aboutProjectName': 'Simplications',
      'aboutPartnerTuChemnitz': 'Chemnitz University of Technology',
      'aboutPartnerHsAnhalt': 'Anhalt University of Applied Sciences',
      'aboutPartnerVzSachsen': 'Consumer Center Saxony',
      'aboutWebsiteSimplicationsLabel': 'simplications.tucmi.de',
      'aboutWebsiteSimplicationsUrl': 'https://simplications.tucmi.de',
      'aboutWebsiteTuChemnitzLabel': 'tu-chemnitz.de',
      'aboutWebsiteTuChemnitzUrl': 'https://www.tu-chemnitz.de',
      'aboutWebsiteHsAnhaltLabel': 'hs-anhalt.de',
      'aboutWebsiteHsAnhaltUrl': 'https://www.hs-anhalt.de',
      'aboutWebsiteVzSachsenLabel': 'verbraucherzentrale-sachsen.de',
      'aboutWebsiteVzSachsenUrl': 'https://www.verbraucherzentrale-sachsen.de',
      'aboutWebsitePlatformPrivacyLabel': 'plattform-privatheit.de',
      'aboutWebsitePlatformPrivacyUrl': 'https://www.plattform-privatheit.de',
      'aboutWebsiteFundingAgencyLabel': 'bmftr.bund.de',
      'aboutWebsiteFundingAgencyUrl': 'https://www.bmftr.bund.de',
      'faqQuestionWhatIs': 'What is Simplications?',
      'faqAnswerWhatIs':
          'Simplications is a research project on smart-home privacy. This app is one part of the project and guides you room by room through your devices with practical recommendations based on your answers.',
      'faqQuestionHowWorks': 'How does the check work?',
      'faqAnswerHowWorks':
          'You select a room, add your smart devices, answer device-specific questions, and receive a risk profile with prioritized actions.',
      'faqQuestionNoPolicy': 'Why is there no data protection policy?',
      'faqAnswerNoPolicy': 'Because we do not collect your data.',
      'faqQuestionDataStored': 'Where is my data stored?',
      'faqAnswerDataStored':
          'Your assessment data is stored locally on your device. You can delete all stored data at any time in the About screen.',
      'faqQuestionNoDevice': 'What if my device is not listed?',
      'faqAnswerNoDevice':
          'You can add custom devices and still complete the check. The recommendations then rely on your provided setup and answers.',
      'faqQuestionRiskMeaning': 'What do low, medium, and high risk mean?',
      'faqAnswerRiskMeaning':
          'They indicate how strongly your current configuration may expose privacy-related risks. They are guidance levels, not legal or technical certification.',
      'faqQuestionLegalAdvice': 'Is this legal advice?',
      'faqAnswerLegalAdvice':
          'No. Simplications provides practical orientation and recommendations, but does not replace legal or professional security consultation.',
      'faqQuestionCanShare': 'Can I share my results?',
      'faqAnswerCanShare':
          'Yes. You can export and share your summary as text or PDF directly from the results screen.',
      'websiteOpenFailed': 'Could not open website.',
      'deleteAllDataTitle': 'Delete all data?',
      'deleteAllDataBody':
          'All captured rooms, devices, and answers will be permanently deleted. This action cannot be undone.',
      'deleteAllDataButton': 'Delete data',
      'allDataDeleted': 'All saved data has been deleted.',
      'projectPartners': 'Project partners',
      'coordinationFunding': 'Coordination & Funding',
      'coordination': 'Coordination',
      'platformPrivacy': 'Platform Privacy',
      'fundingAgency': 'Funding body',
      'fundingAgencyValue':
          'German Federal Ministry of Research, Technology and Space\nGrant 16KIS1868K',
      'website': 'Website',
      'dangerZone': 'Danger zone',
      'dangerZoneWarning':
          'Warning: This action permanently removes all saved app data.',
      'expertModeTitle': 'Expert mode',
      'expertModeToggleLabel': 'Enable detailed expert mode',
      'expertModeToggleHint':
          'Same workflow, but much more detailed device questions (e.g., retention duration, access control, third-party sharing).',
      'expertModeSourcesHint':
          'Methodologically inspired by the following research projects:',
      'expertModeSourceCmuLabel': 'CMU IoT Security & Privacy Label (CISPL)',
      'expertModeSourceCmuUrl': 'https://iotsecurityprivacy.org/labels',
      'expertModeSourceUnboxingLabel':
          'Unboxing.IoT.Privacy (community platform)',
      'expertModeSourceUnboxingUrl': 'https://iot-privacy.info/project/',
      'expertModeQuestionnaireHint':
          'Expert mode: these questions deepen data-practice and governance coverage (including retention, access control, and third-party sharing) based on CMU IoT Label and Unboxing.IoT.Privacy approaches.',
      'roomDeleteTitle': 'Delete room?',
      'roomDeleteBody':
          'This custom room will be deleted. All linked devices will also be removed.',
      'add': 'Add',
      'addRoomDialogTitle': 'Add new room',
      'roomName': 'Room name',
      'roomNameHint': 'e.g. Living room, Garage',
      'chooseIcon': 'Choose icon:',
      'addDeviceDialogTitle': 'Add new device',
      'deviceName': 'Device name',
      'deviceNameHint': 'e.g. My smart speaker',
      'baseRiskLabel': 'Base risk score (0-100)',
      'baseRiskHint': 'e.g. 30 (low) to 60 (high)',
      'hasCamera': 'Has camera?',
      'hasMicrophone': 'Has microphone?',
      'camera': 'Camera',
      'microphone': 'Microphone',
      'summaryTitle': 'Your result',
      'shareResult': 'Share result',
      'shareAsText': 'Share as text',
      'shareAsPdf': 'Share as PDF',
      'restart': 'Restart',
      'noDevicesCaptured': 'No devices captured.',
      'noDevicesHint': 'Restart and add devices to receive an assessment.',
      'highRisk': 'High risk',
      'mediumRisk': 'Medium risk',
      'lowRisk': 'Low risk',
      'exportFailed': 'Export failed',
      'summaryShareSubject': 'Simplications result',
      'summarySharePdfText': 'Simplications report as PDF',
      'overview': 'Overview',
      'evaluatedDevices': 'Evaluated devices',
      'overallRisk': 'Overall risk',
      'generalRecommendations': 'General recommendations',
      'generalRecommendationsHint':
          'These measures apply to your whole smart home regardless of individual devices.',
      'fullCatalog': 'Full action catalog',
      'catalogButton': 'Open full action catalog',
      'risk': 'Risk',
      'note': 'Note',
      'recommendations': 'Recommendations',
      'urgent': 'Urgent',
      'recommended': 'Recommended',
      'optional': 'Optional',
      'social': 'Social',
      'technical': 'Technical',
      'security': 'Security',
      'smartHomePrivacyHeader': 'Your smart home privacy',
      'devicesRated': 'rated devices',
      'howRiskCalculated': 'How is risk calculated?',
      'totalScore': 'Total',
      'catalogSnackBarPrefix': 'Catalog',
      'reportExportedAt': 'Exported at',
      'noActionLow': 'Everything is fine - no actions required.',
      'noActionMedium':
          'No concrete actions can currently be derived from your answers, but a medium residual risk remains.',
      'noActionHigh':
          'No concrete actions can currently be derived from your answers, but a high residual risk remains.',
      'overallLow':
          'Well done! Your devices are mostly configured securely. Still review the general recommendations.',
      'overallMedium':
          'There is room for improvement. Review the recommendations for each device.',
      'overallHigh':
          'Several devices have significant privacy/data-protection risks. Please implement high-priority measures promptly.',
      'dontKnowHint':
          ' {count} answer{suffix} were marked as "I don\'t know" - take time to understand your device settings better.',
    },
    'cs': {
      'appTitle': 'Simplications',
      'welcomeTitle': 'Simplications\nKontrola soukromí\nchytré domácnosti',
      'welcomeDescription':
          'Zaznamenejte svá chytrá zařízení místnost po místnosti a získejte hodnocení soukromí s konkrétními doporučeními.',
      'stepSelectRooms': 'Vyberte místnost',
      'stepCaptureDevices': 'Zaznamenejte zařízení',
      'stepAnswerQuestions': 'Odpovězte na otázky',
      'stepGetRisk': 'Získejte rizikový profil a doporučení',
      'start': 'Začít',
      'resume': 'Pokračovat',
      'about': 'O aplikaci',
      'faq': 'FAQ',
      'roomSelectionTitle': 'Výběr místnosti',
      'roomQuestion': 'Kterou místnost chcete nyní zkontrolovat?',
      'roomInstruction':
          'Klepněte na místnost, zaznamenejte v ní zařízení a vraťte se sem, kde vyberete další místnost.',
      'results': 'Výsledky',
      'alreadyEvaluated': 'Již vyhodnoceno',
      'notCompleted': 'Nedokončeno',
      'addRoom': 'Přidat místnost',
      'deviceTitlePrefix': 'Zařízení',
      'roomCheck': 'Kontrola místnosti',
      'deviceQuestion': 'Která chytrá zařízení používáte v této místnosti?',
      'deviceQuestionHint': 'Klepněte na zařízení a odpovězte na otázky.',
      'noKnownDevices':
          'Pro tuto místnost nejsou známá žádná zařízení. Můžete přidat vlastní zařízení.',
      'addDevice': 'Přidat\nzařízení',
      'noDevice': 'Žádné zařízení',
      'nextRoom': 'Další místnost',
      'deleteDeviceTitle': 'Smazat zařízení?',
      'deleteDeviceBody':
          'Toto vlastní zařízení bude smazáno. Všechny navázané instance budou také odstraněny.',
      'delete': 'Smazat',
      'cancel': 'Zrušit',
      'confirm': 'Potvrdit',
      'noDeviceDialogTitle': 'V této místnosti nejsou zařízení?',
      'noDeviceDialogBody':
          'Tato místnost bude uzavřena bez zařízení a neovlivní hodnocení.',
      'noDeviceDialogBodyWithExisting':
          'Existující výběry zařízení pro tuto místnost budou zahozeny. Tato místnost bude uzavřena bez zařízení a neovlivní hodnocení.',
      'questionnaireTitle': 'Otázky',
      'connectedDevice': 'Připojené zařízení',
      'done': 'Hotovo',
      'yes': 'Ano',
      'no': 'Ne',
      'dontKnow': 'Nevím',
      'notApplicableForDevice': 'Tato otázka se na moje zařízení nevztahuje',
      'languageDialogTitle': 'Vyberte jazyk',
      'currentLanguage': 'Aktuální jazyk',
      'aboutScreenTitle': 'O aplikaci',
      'aboutSubtitle':
          'Výzkumný projekt zaměřený na soukromí chytré domácnosti',
      'aboutProjectName': 'Simplications',
      'aboutPartnerTuChemnitz': 'Technická univerzita v Chemnitzu',
      'aboutPartnerHsAnhalt': 'Vysoká škola Anhalt',
      'aboutPartnerVzSachsen': 'Spotřebitelské centrum Sasko',
      'aboutWebsiteSimplicationsLabel': 'simplications.tucmi.de',
      'aboutWebsiteSimplicationsUrl': 'https://simplications.tucmi.de',
      'aboutWebsiteTuChemnitzLabel': 'tu-chemnitz.de',
      'aboutWebsiteTuChemnitzUrl': 'https://www.tu-chemnitz.de',
      'aboutWebsiteHsAnhaltLabel': 'hs-anhalt.de',
      'aboutWebsiteHsAnhaltUrl': 'https://www.hs-anhalt.de',
      'aboutWebsiteVzSachsenLabel': 'verbraucherzentrale-sachsen.de',
      'aboutWebsiteVzSachsenUrl': 'https://www.verbraucherzentrale-sachsen.de',
      'aboutWebsitePlatformPrivacyLabel': 'plattform-privatheit.de',
      'aboutWebsitePlatformPrivacyUrl': 'https://www.plattform-privatheit.de',
      'aboutWebsiteFundingAgencyLabel': 'bmftr.bund.de',
      'aboutWebsiteFundingAgencyUrl': 'https://www.bmftr.bund.de',
      'websiteOpenFailed': 'Web se nepodařilo otevřít.',
      'deleteAllDataTitle': 'Smazat všechna data?',
      'deleteAllDataBody':
          'Všechny zaznamenané místnosti, zařízení a odpovědi budou trvale smazány. Tuto akci nelze vrátit zpět.',
      'deleteAllDataButton': 'Smazat data',
      'allDataDeleted': 'Všechna uložená data byla smazána.',
      'projectPartners': 'Projektoví partneři',
      'coordinationFunding': 'Koordinace a financování',
      'coordination': 'Koordinace',
      'platformPrivacy': 'Plattform Privatheit',
      'fundingAgency': 'Poskytovatel financování',
      'fundingAgencyValue':
          'Spolkové ministerstvo pro výzkum, technologie a vesmír\nFKZ 16KIS1868K',
      'website': 'Web',
      'dangerZone': 'Nebezpečná zóna',
      'dangerZoneWarning':
          'Pozor: Tato akce trvale odstraní všechna uložená data aplikace.',
      'faqScreenTitle': 'Často kladené otázky',
      'faqQuestionWhatIs': 'Co je Simplications?',
      'faqAnswerWhatIs':
          'Simplications je výzkumný projekt zaměřený na soukromí v chytré domácnosti. Tato aplikace je jednou z částí projektu a provede vás místnost po místnosti vašimi zařízeními s praktickými doporučeními na základě vašich odpovědí.',
      'faqQuestionHowWorks': 'Jak kontrola funguje?',
      'faqAnswerHowWorks':
          'Vyberete místnost, přidáte chytrá zařízení, odpovíte na otázky pro konkrétní zařízení a získáte profil rizik s prioritizovanými kroky.',
      'faqQuestionNoPolicy': 'Proč tu není zásada ochrany osobních údajů?',
      'faqAnswerNoPolicy': 'Protože neshromažďujeme vaše data.',
      'faqQuestionDataStored': 'Kde jsou moje data uložena?',
      'faqAnswerDataStored':
          'Vaše hodnocení je uloženo lokálně ve vašem zařízení. V obrazovce O aplikaci můžete všechna uložená data kdykoli smazat.',
      'faqQuestionNoDevice': 'Co když moje zařízení není v seznamu?',
      'faqAnswerNoDevice':
          'Můžete přidat vlastní zařízení a kontrolu dokončit. Doporučení pak vycházejí z vaší konfigurace a odpovědí.',
      'faqQuestionRiskMeaning': 'Co znamená nízké, střední a vysoké riziko?',
      'faqAnswerRiskMeaning':
          'Tyto úrovně ukazují, jak silně může vaše současné nastavení zvyšovat rizika pro soukromí. Jde o orientační úrovně, ne o právní nebo technickou certifikaci.',
      'faqQuestionLegalAdvice': 'Jde o právní poradenství?',
      'faqAnswerLegalAdvice':
          'Ne. Simplications poskytuje praktickou orientaci a doporučení, nenahrazuje však právní nebo profesionální bezpečnostní poradenství.',
      'faqQuestionCanShare': 'Mohu sdílet své výsledky?',
      'faqAnswerCanShare':
          'Ano. Na obrazovce výsledků můžete přehled exportovat a sdílet jako text nebo PDF.',
      'roomDeleteTitle': 'Smazat místnost?',
      'roomDeleteBody':
          'Tato vlastní místnost bude smazána. Všechna propojená zařízení budou také odstraněna.',
      'add': 'Přidat',
      'addRoomDialogTitle': 'Přidat novou místnost',
      'roomName': 'Název místnosti',
      'roomNameHint': 'např. Obývací pokoj, Garáž',
      'chooseIcon': 'Vyberte ikonu:',
      'addDeviceDialogTitle': 'Přidat nové zařízení',
      'deviceName': 'Název zařízení',
      'deviceNameHint': 'např. Můj chytrý reproduktor',
      'baseRiskLabel': 'Základní skóre rizika (0-100)',
      'baseRiskHint': 'např. 30 (nízké) až 60 (vysoké)',
      'hasCamera': 'Má kameru?',
      'hasMicrophone': 'Má mikrofon?',
      'camera': 'Kamera',
      'microphone': 'Mikrofon',
      'summaryTitle': 'Váš výsledek',
      'shareResult': 'Sdílet výsledek',
      'shareAsText': 'Sdílet jako text',
      'shareAsPdf': 'Sdílet jako PDF',
      'restart': 'Začít znovu',
      'noDevicesCaptured': 'Nebyla zaznamenána žádná zařízení.',
      'noDevicesHint':
          'Spusťte to znovu a přidejte zařízení, abyste získali hodnocení.',
      'highRisk': 'Vysoké riziko',
      'mediumRisk': 'Střední riziko',
      'lowRisk': 'Nízké riziko',
      'exportFailed': 'Export se nezdařil',
      'summaryShareSubject': 'Výsledek Simplications',
      'summarySharePdfText': 'Zpráva Simplications jako PDF',
      'overview': 'Přehled',
      'evaluatedDevices': 'Vyhodnocená zařízení',
      'overallRisk': 'Celkové riziko',
      'generalRecommendations': 'Obecná doporučení',
      'generalRecommendationsHint':
          'Tato opatření platí pro celou vaši chytrou domácnost bez ohledu na jednotlivá zařízení.',
      'fullCatalog': 'Úplný katalog opatření',
      'catalogButton': 'Otevřít úplný katalog opatření',
      'risk': 'Riziko',
      'note': 'Poznámka',
      'recommendations': 'Doporučení',
      'urgent': 'Naléhavé',
      'recommended': 'Doporučeno',
      'optional': 'Volitelné',
      'social': 'Sociální',
      'technical': 'Technické',
      'security': 'Zabezpečení',
      'smartHomePrivacyHeader': 'Vaše soukromí chytré domácnosti',
      'devicesRated': 'hodnocených zařízení',
      'howRiskCalculated': 'Jak se riziko počítá?',
      'totalScore': 'Celkem',
      'catalogSnackBarPrefix': 'Katalog',
      'reportExportedAt': 'Exportováno',
      'noActionLow': 'Vše je v pořádku - nejsou nutná žádná opatření.',
      'noActionMedium':
          'Z vašich odpovědí nyní nelze odvodit konkrétní opatření, ale zůstává střední zbytkové riziko.',
      'noActionHigh':
          'Z vašich odpovědí nyní nelze odvodit konkrétní opatření, ale zůstává vysoké zbytkové riziko.',
      'overallLow':
          'Skvělá práce! Vaše zařízení jsou většinou bezpečně nastavena. Přesto si projděte obecná doporučení.',
      'overallMedium':
          'Je zde prostor ke zlepšení. Projděte si doporučení pro jednotlivá zařízení.',
      'overallHigh':
          'Několik zařízení má významná rizika pro soukromí/ochranu dat. Prosím co nejdříve zaveďte opatření s vysokou prioritou.',
      'dontKnowHint':
          ' {count} odpověď{suffix} byla označena jako "Nevím" - věnujte čas lepšímu poznání nastavení svých zařízení.',
    },
    'pl': {
      'appTitle': 'Simplications',
      'welcomeTitle': 'Simplications\nKontrola prywatności\nSmart Home',
      'welcomeDescription':
          'Dodaj swoje inteligentne urządzenia pokój po pokoju i otrzymaj ocenę prywatności z konkretnymi zaleceniami.',
      'stepSelectRooms': 'Wybierz pokój',
      'stepCaptureDevices': 'Dodaj urządzenia',
      'stepAnswerQuestions': 'Odpowiedz na pytania',
      'stepGetRisk': 'Uzyskaj profil ryzyka i zalecenia',
      'start': 'Start',
      'resume': 'Wznów',
      'about': 'O aplikacji',
      'faq': 'FAQ',
      'roomSelectionTitle': 'Wybierz pokój',
      'roomQuestion': 'Który pokój chcesz teraz sprawdzić?',
      'roomInstruction':
          'Stuknij pokój, dodaj urządzenia, a potem wróć tutaj, aby wybrać kolejny pokój.',
      'results': 'Wyniki',
      'alreadyEvaluated': 'Już oceniono',
      'notCompleted': 'Nieukończone',
      'addRoom': 'Dodaj pokój',
      'deviceTitlePrefix': 'Urządzenia',
      'roomCheck': 'Przegląd pokoju',
      'deviceQuestion': 'Jakich inteligentnych urządzeń używasz w tym pokoju?',
      'deviceQuestionHint': 'Stuknij urządzenie, aby odpowiedzieć na pytania.',
      'noKnownDevices':
          'Brak znanych urządzeń dla tego pokoju. Możesz dodać własne urządzenie.',
      'addDevice': 'Dodaj\nurządzenie',
      'noDevice': 'Brak urządzenia',
      'nextRoom': 'Następny pokój',
      'deleteDeviceTitle': 'Usunąć urządzenie?',
      'deleteDeviceBody':
          'To niestandardowe urządzenie zostanie usunięte. Wszystkie powiązane instancje również zostaną usunięte.',
      'delete': 'Usuń',
      'cancel': 'Anuluj',
      'confirm': 'Potwierdź',
      'noDeviceDialogTitle': 'Brak urządzeń w tym pokoju?',
      'noDeviceDialogBody':
          'Ten pokój zostanie zakończony bez urządzeń i nie wpłynie na ocenę.',
      'noDeviceDialogBodyWithExisting':
          'Istniejące wybory urządzeń dla tego pokoju zostaną odrzucone. Ten pokój zostanie zakończony bez urządzeń i nie wpłynie na ocenę.',
      'questionnaireTitle': 'Pytania',
      'connectedDevice': 'Podłączone urządzenie',
      'done': 'Gotowe',
      'yes': 'Tak',
      'no': 'Nie',
      'dontKnow': 'Nie wiem',
      'notApplicableForDevice': 'To pytanie nie dotyczy mojego urządzenia',
      'languageDialogTitle': 'Wybierz język',
      'currentLanguage': 'Bieżący język',
      'aboutScreenTitle': 'O aplikacji',
      'aboutSubtitle': 'Projekt badawczy dotyczący prywatności smart home',
      'aboutProjectName': 'Simplications',
      'aboutPartnerTuChemnitz': 'Uniwersytet Techniczny w Chemnitz',
      'aboutPartnerHsAnhalt': 'Anhalt University of Applied Sciences',
      'aboutPartnerVzSachsen': 'Centrum Konsumenckie Saksonii',
      'aboutWebsiteSimplicationsLabel': 'simplications.tucmi.de',
      'aboutWebsiteSimplicationsUrl': 'https://simplications.tucmi.de',
      'aboutWebsiteTuChemnitzLabel': 'tu-chemnitz.de',
      'aboutWebsiteTuChemnitzUrl': 'https://www.tu-chemnitz.de',
      'aboutWebsiteHsAnhaltLabel': 'hs-anhalt.de',
      'aboutWebsiteHsAnhaltUrl': 'https://www.hs-anhalt.de',
      'aboutWebsiteVzSachsenLabel': 'verbraucherzentrale-sachsen.de',
      'aboutWebsiteVzSachsenUrl': 'https://www.verbraucherzentrale-sachsen.de',
      'aboutWebsitePlatformPrivacyLabel': 'plattform-privatheit.de',
      'aboutWebsitePlatformPrivacyUrl': 'https://www.plattform-privatheit.de',
      'aboutWebsiteFundingAgencyLabel': 'bmftr.bund.de',
      'aboutWebsiteFundingAgencyUrl': 'https://www.bmftr.bund.de',
      'websiteOpenFailed': 'Nie można otworzyć strony internetowej.',
      'deleteAllDataTitle': 'Usunąć wszystkie dane?',
      'deleteAllDataBody':
          'Wszystkie zapisane pokoje, urządzenia i odpowiedzi zostaną trwale usunięte. Tej operacji nie można cofnąć.',
      'deleteAllDataButton': 'Usuń dane',
      'allDataDeleted': 'Wszystkie zapisane dane zostały usunięte.',
      'projectPartners': 'Partnerzy projektu',
      'coordinationFunding': 'Koordynacja i finansowanie',
      'coordination': 'Koordynacja',
      'platformPrivacy': 'Plattform Privatheit',
      'fundingAgency': 'Instytucja finansująca',
      'fundingAgencyValue':
          'Federalne Ministerstwo Badań, Technologii i Przestrzeni Kosmicznej\nGrant 16KIS1868K',
      'website': 'Strona internetowa',
      'dangerZone': 'Strefa zagrożenia',
      'dangerZoneWarning':
          'Uwaga: Ta operacja trwale usunie wszystkie zapisane dane aplikacji.',
      'faqScreenTitle': 'Najczęściej zadawane pytania',
      'faqQuestionWhatIs': 'Czym jest Simplications?',
      'faqAnswerWhatIs':
          'Simplications to projekt badawczy dotyczący prywatności w inteligentnym domu. Ta aplikacja jest jedną z części projektu i prowadzi Cię pokój po pokoju przez Twoje urządzenia, oferując praktyczne zalecenia na podstawie odpowiedzi.',
      'faqQuestionHowWorks': 'Jak działa kontrola?',
      'faqAnswerHowWorks':
          'Wybierasz pokój, dodajesz inteligentne urządzenia, odpowiadasz na pytania dotyczące danego urządzenia i otrzymujesz profil ryzyka z priorytetowymi działaniami.',
      'faqQuestionNoPolicy': 'Dlaczego nie ma polityki prywatności?',
      'faqAnswerNoPolicy': 'Ponieważ nie zbieramy Twoich danych.',
      'faqQuestionDataStored': 'Gdzie przechowywane są moje dane?',
      'faqAnswerDataStored':
          'Twoje dane z oceny są przechowywane lokalnie na urządzeniu. W ekranie O aplikacji możesz w każdej chwili usunąć wszystkie zapisane dane.',
      'faqQuestionNoDevice': 'Co jeśli mojego urządzenia nie ma na liście?',
      'faqAnswerNoDevice':
          'Możesz dodać własne urządzenia i nadal ukończyć kontrolę. Zalecenia będą wtedy oparte na Twojej konfiguracji i odpowiedziach.',
      'faqQuestionRiskMeaning': 'Co oznacza niskie, średnie i wysokie ryzyko?',
      'faqAnswerRiskMeaning':
          'Poziomy te pokazują, jak bardzo obecna konfiguracja może zwiększać ryzyka dla prywatności. Są to poziomy orientacyjne, a nie certyfikacja prawna lub techniczna.',
      'faqQuestionLegalAdvice': 'Czy to porada prawna?',
      'faqAnswerLegalAdvice':
          'Nie. Simplications zapewnia praktyczne wskazówki i rekomendacje, ale nie zastępuje porady prawnej ani profesjonalnej konsultacji bezpieczeństwa.',
      'faqQuestionCanShare': 'Czy mogę udostępnić wyniki?',
      'faqAnswerCanShare':
          'Tak. Na ekranie wyników możesz wyeksportować i udostępnić podsumowanie jako tekst lub PDF.',
      'roomDeleteTitle': 'Usunąć pokój?',
      'roomDeleteBody':
          'Ten niestandardowy pokój zostanie usunięty. Wszystkie powiązane urządzenia również zostaną usunięte.',
      'add': 'Dodaj',
      'addRoomDialogTitle': 'Dodaj nowy pokój',
      'roomName': 'Nazwa pokoju',
      'roomNameHint': 'np. Salon, Garaż',
      'chooseIcon': 'Wybierz ikonę:',
      'addDeviceDialogTitle': 'Dodaj nowe urządzenie',
      'deviceName': 'Nazwa urządzenia',
      'deviceNameHint': 'np. Mój inteligentny głośnik',
      'baseRiskLabel': 'Bazowy wynik ryzyka (0-100)',
      'baseRiskHint': 'np. 30 (niskie) do 60 (wysokie)',
      'hasCamera': 'Ma kamerę?',
      'hasMicrophone': 'Ma mikrofon?',
      'camera': 'Kamera',
      'microphone': 'Mikrofon',
      'summaryTitle': 'Twój wynik',
      'shareResult': 'Udostępnij wynik',
      'shareAsText': 'Udostępnij jako tekst',
      'shareAsPdf': 'Udostępnij jako PDF',
      'restart': 'Uruchom ponownie',
      'noDevicesCaptured': 'Nie dodano żadnych urządzeń.',
      'noDevicesHint':
          'Uruchom ponownie i dodaj urządzenia, aby otrzymać ocenę.',
      'highRisk': 'Wysokie ryzyko',
      'mediumRisk': 'Średnie ryzyko',
      'lowRisk': 'Niskie ryzyko',
      'exportFailed': 'Eksport nie powiódł się',
      'summaryShareSubject': 'Wynik Simplications',
      'summarySharePdfText': 'Raport Simplications jako PDF',
      'overview': 'Przegląd',
      'evaluatedDevices': 'Ocenione urządzenia',
      'overallRisk': 'Ryzyko całkowite',
      'generalRecommendations': 'Ogólne zalecenia',
      'generalRecommendationsHint':
          'Te środki dotyczą całego Twojego smart home, niezależnie od pojedynczych urządzeń.',
      'fullCatalog': 'Pełny katalog działań',
      'catalogButton': 'Otwórz pełny katalog działań',
      'risk': 'Ryzyko',
      'note': 'Uwaga',
      'recommendations': 'Zalecenia',
      'urgent': 'Pilne',
      'recommended': 'Zalecane',
      'optional': 'Opcjonalne',
      'social': 'Społeczne',
      'technical': 'Techniczne',
      'security': 'Bezpieczeństwo',
      'smartHomePrivacyHeader': 'Prywatność Twojego smart home',
      'devicesRated': 'ocenionych urządzeń',
      'howRiskCalculated': 'Jak obliczane jest ryzyko?',
      'totalScore': 'Łącznie',
      'catalogSnackBarPrefix': 'Katalog',
      'reportExportedAt': 'Wyeksportowano',
      'noActionLow': 'Wszystko w porządku - nie są wymagane żadne działania.',
      'noActionMedium':
          'Na podstawie Twoich odpowiedzi nie można obecnie wskazać konkretnych działań, ale pozostaje średnie ryzyko resztkowe.',
      'noActionHigh':
          'Na podstawie Twoich odpowiedzi nie można obecnie wskazać konkretnych działań, ale pozostaje wysokie ryzyko resztkowe.',
      'overallLow':
          'Dobra robota! Twoje urządzenia są w większości skonfigurowane bezpiecznie. Mimo to sprawdź ogólne zalecenia.',
      'overallMedium':
          'Jest miejsce na poprawę. Sprawdź zalecenia dla każdego urządzenia.',
      'overallHigh':
          'Kilka urządzeń ma istotne ryzyka prywatności/ochrony danych. Prosimy jak najszybciej wdrożyć działania o wysokim priorytecie.',
      'dontKnowHint':
          ' {count} odpowiedź{suffix} oznaczono jako "Nie wiem" - poświęć czas na lepsze poznanie ustawień swoich urządzeń.',
    },
    'fr': {
      'appTitle': 'Simplications',
      'welcomeTitle': 'Simplications\nContrôle de confidentialité\nSmart Home',
      'welcomeDescription':
          'Renseignez vos appareils intelligents pièce par pièce et obtenez une évaluation de confidentialité avec des recommandations concrètes.',
      'stepSelectRooms': 'Choisir une pièce',
      'stepCaptureDevices': 'Recenser les appareils',
      'stepAnswerQuestions': 'Répondre aux questions',
      'stepGetRisk': 'Obtenir le profil de risque et les recommandations',
      'start': 'Démarrer',
      'resume': 'Continuer',
      'about': 'À propos',
      'faq': 'FAQ',
      'roomSelectionTitle': 'Sélectionner une pièce',
      'roomQuestion': 'Quelle pièce souhaitez-vous vérifier maintenant ?',
      'roomInstruction':
          'Touchez une pièce, recensez-y vos appareils, puis revenez ici pour choisir la pièce suivante.',
      'results': 'Résultats',
      'alreadyEvaluated': 'Déjà évalué',
      'notCompleted': 'Non terminé',
      'addRoom': 'Ajouter une pièce',
      'deviceTitlePrefix': 'Appareils',
      'roomCheck': 'Vérification de la pièce',
      'deviceQuestion':
          'Quels appareils intelligents utilisez-vous dans cette pièce ?',
      'deviceQuestionHint': 'Touchez un appareil pour répondre aux questions.',
      'noKnownDevices':
          'Aucun appareil connu pour cette pièce. Vous pouvez ajouter votre propre appareil.',
      'addDevice': 'Ajouter\nun appareil',
      'noDevice': 'Aucun appareil',
      'nextRoom': 'Pièce suivante',
      'deleteDeviceTitle': 'Supprimer l\'appareil ?',
      'deleteDeviceBody':
          'Cet appareil personnalisé sera supprimé. Toutes les instances liées seront également supprimées.',
      'delete': 'Supprimer',
      'cancel': 'Annuler',
      'confirm': 'Confirmer',
      'noDeviceDialogTitle': 'Aucun appareil dans cette pièce ?',
      'noDeviceDialogBody':
          'Cette pièce sera terminée sans appareil et n\'affectera pas le score.',
      'noDeviceDialogBodyWithExisting':
          'Les sélections d\'appareils existantes pour cette pièce seront ignorées. Cette pièce sera terminée sans appareil et n\'affectera pas le score.',
      'questionnaireTitle': 'Questions',
      'connectedDevice': 'Appareil connecté',
      'done': 'Terminé',
      'yes': 'Oui',
      'no': 'Non',
      'dontKnow': 'Je ne sais pas',
      'notApplicableForDevice':
          'Cette question ne s\'applique pas à mon appareil',
      'languageDialogTitle': 'Choisir la langue',
      'currentLanguage': 'Langue actuelle',
      'aboutScreenTitle': 'À propos de l’application',
      'aboutSubtitle':
          'Projet de recherche sur la confidentialité des maisons connectées',
      'aboutProjectName': 'Simplications',
      'aboutPartnerTuChemnitz': 'Université technique de Chemnitz',
      'aboutPartnerHsAnhalt': 'Haute école d’Anhalt',
      'aboutPartnerVzSachsen': 'Centre des consommateurs de Saxe',
      'aboutWebsiteSimplicationsLabel': 'simplications.tucmi.de',
      'aboutWebsiteSimplicationsUrl': 'https://simplications.tucmi.de',
      'aboutWebsiteTuChemnitzLabel': 'tu-chemnitz.de',
      'aboutWebsiteTuChemnitzUrl': 'https://www.tu-chemnitz.de',
      'aboutWebsiteHsAnhaltLabel': 'hs-anhalt.de',
      'aboutWebsiteHsAnhaltUrl': 'https://www.hs-anhalt.de',
      'aboutWebsiteVzSachsenLabel': 'verbraucherzentrale-sachsen.de',
      'aboutWebsiteVzSachsenUrl': 'https://www.verbraucherzentrale-sachsen.de',
      'aboutWebsitePlatformPrivacyLabel': 'plattform-privatheit.de',
      'aboutWebsitePlatformPrivacyUrl': 'https://www.plattform-privatheit.de',
      'aboutWebsiteFundingAgencyLabel': 'bmftr.bund.de',
      'aboutWebsiteFundingAgencyUrl': 'https://www.bmftr.bund.de',
      'websiteOpenFailed': 'Impossible d’ouvrir le site web.',
      'deleteAllDataTitle': 'Supprimer toutes les données ?',
      'deleteAllDataBody':
          'Toutes les pièces, appareils et réponses enregistrés seront supprimés définitivement. Cette action est irréversible.',
      'deleteAllDataButton': 'Supprimer les données',
      'allDataDeleted': 'Toutes les données enregistrées ont été supprimées.',
      'projectPartners': 'Partenaires du projet',
      'coordinationFunding': 'Coordination et financement',
      'coordination': 'Coordination',
      'platformPrivacy': 'Plattform Privatheit',
      'fundingAgency': 'Organisme financeur',
      'fundingAgencyValue':
          'Ministère fédéral allemand de la Recherche, de la Technologie et de l’Espace\nSubvention 16KIS1868K',
      'website': 'Site web',
      'dangerZone': 'Zone de danger',
      'dangerZoneWarning':
          'Attention : cette action supprime définitivement toutes les données enregistrées de l’application.',
      'faqScreenTitle': 'Questions fréquentes',
      'faqQuestionWhatIs': 'Qu’est-ce que Simplications ?',
      'faqAnswerWhatIs':
          'Simplications est un projet de recherche sur la confidentialité des maisons connectées. Cette application est une composante du projet et vous guide pièce par pièce à travers vos appareils avec des recommandations pratiques selon vos réponses.',
      'faqQuestionHowWorks': 'Comment fonctionne le contrôle ?',
      'faqAnswerHowWorks':
          'Vous choisissez une pièce, ajoutez vos appareils intelligents, répondez à des questions spécifiques, puis recevez un profil de risque avec des actions priorisées.',
      'faqQuestionNoPolicy':
          'Pourquoi n’y a-t-il pas de politique de protection des données ?',
      'faqAnswerNoPolicy': 'Parce que nous ne collectons pas vos données.',
      'faqQuestionDataStored': 'Où sont stockées mes données ?',
      'faqAnswerDataStored':
          'Vos données d’évaluation sont stockées localement sur votre appareil. Vous pouvez supprimer toutes les données enregistrées à tout moment depuis l’écran À propos.',
      'faqQuestionNoDevice':
          'Que faire si mon appareil n’est pas dans la liste ?',
      'faqAnswerNoDevice':
          'Vous pouvez ajouter des appareils personnalisés et terminer le contrôle. Les recommandations s’appuieront alors sur votre configuration et vos réponses.',
      'faqQuestionRiskMeaning':
          'Que signifient risque faible, moyen et élevé ?',
      'faqAnswerRiskMeaning':
          'Ces niveaux indiquent dans quelle mesure votre configuration actuelle peut exposer des risques de confidentialité. Ce sont des niveaux d’orientation, pas une certification juridique ou technique.',
      'faqQuestionLegalAdvice': 'Est-ce un conseil juridique ?',
      'faqAnswerLegalAdvice':
          'Non. Simplications fournit une orientation pratique et des recommandations, mais ne remplace pas un conseil juridique ou une consultation professionnelle en sécurité.',
      'faqQuestionCanShare': 'Puis-je partager mes résultats ?',
      'faqAnswerCanShare':
          'Oui. Depuis l’écran des résultats, vous pouvez exporter et partager votre résumé en texte ou en PDF.',
      'roomDeleteTitle': 'Supprimer la pièce ?',
      'roomDeleteBody':
          'Cette pièce personnalisée sera supprimée. Tous les appareils liés seront également supprimés.',
      'add': 'Ajouter',
      'addRoomDialogTitle': 'Ajouter une nouvelle pièce',
      'roomName': 'Nom de la pièce',
      'roomNameHint': 'ex. Salon, Garage',
      'chooseIcon': 'Choisir une icône :',
      'addDeviceDialogTitle': 'Ajouter un nouvel appareil',
      'deviceName': 'Nom de l’appareil',
      'deviceNameHint': 'ex. Mon haut-parleur intelligent',
      'baseRiskLabel': 'Score de risque de base (0-100)',
      'baseRiskHint': 'ex. 30 (faible) à 60 (élevé)',
      'hasCamera': 'Possède une caméra ?',
      'hasMicrophone': 'Possède un microphone ?',
      'camera': 'Caméra',
      'microphone': 'Microphone',
      'summaryTitle': 'Votre résultat',
      'shareResult': 'Partager le résultat',
      'shareAsText': 'Partager en texte',
      'shareAsPdf': 'Partager en PDF',
      'restart': 'Recommencer',
      'noDevicesCaptured': 'Aucun appareil enregistré.',
      'noDevicesHint':
          'Redémarrez et ajoutez des appareils pour obtenir une évaluation.',
      'highRisk': 'Risque élevé',
      'mediumRisk': 'Risque moyen',
      'lowRisk': 'Risque faible',
      'exportFailed': 'Échec de l’export',
      'summaryShareSubject': 'Résultat Simplications',
      'summarySharePdfText': 'Rapport Simplications en PDF',
      'overview': 'Vue d’ensemble',
      'evaluatedDevices': 'Appareils évalués',
      'overallRisk': 'Risque global',
      'generalRecommendations': 'Recommandations générales',
      'generalRecommendationsHint':
          'Ces mesures s’appliquent à toute votre maison connectée, indépendamment des appareils individuels.',
      'fullCatalog': 'Catalogue complet des actions',
      'catalogButton': 'Ouvrir le catalogue complet des actions',
      'risk': 'Risque',
      'note': 'Remarque',
      'recommendations': 'Recommandations',
      'urgent': 'Urgent',
      'recommended': 'Recommandé',
      'optional': 'Optionnel',
      'social': 'Social',
      'technical': 'Technique',
      'security': 'Sécurité',
      'smartHomePrivacyHeader': 'La confidentialité de votre maison connectée',
      'devicesRated': 'appareils évalués',
      'howRiskCalculated': 'Comment le risque est-il calculé ?',
      'totalScore': 'Total',
      'catalogSnackBarPrefix': 'Catalogue',
      'reportExportedAt': 'Exporté le',
      'noActionLow': 'Tout va bien - aucune action n’est nécessaire.',
      'noActionMedium':
          'Aucune action concrète ne peut actuellement être déduite de vos réponses, mais un risque résiduel moyen demeure.',
      'noActionHigh':
          'Aucune action concrète ne peut actuellement être déduite de vos réponses, mais un risque résiduel élevé demeure.',
      'overallLow':
          'Bien joué ! Vos appareils sont globalement configurés de façon sûre. Consultez tout de même les recommandations générales.',
      'overallMedium':
          'Il y a une marge d’amélioration. Consultez les recommandations pour chaque appareil.',
      'overallHigh':
          'Plusieurs appareils présentent des risques importants pour la confidentialité/protection des données. Veuillez mettre en œuvre rapidement les mesures prioritaires.',
      'dontKnowHint':
          ' {count} réponse{suffix} a été marquée "Je ne sais pas" - prenez le temps de mieux comprendre les paramètres de vos appareils.',
    },
    'nl': {
      'appTitle': 'Simplications',
      'welcomeTitle': 'Simplications\nSmart Home\nprivacycheck',
      'welcomeDescription':
          'Leg je slimme apparaten kamer voor kamer vast en ontvang een privacybeoordeling met concrete aanbevelingen.',
      'stepSelectRooms': 'Kamer kiezen',
      'stepCaptureDevices': 'Apparaten vastleggen',
      'stepAnswerQuestions': 'Vragen beantwoorden',
      'stepGetRisk': 'Risicoprofiel en aanbevelingen ontvangen',
      'start': 'Starten',
      'resume': 'Doorgaan',
      'about': 'Over',
      'faq': 'FAQ',
      'roomSelectionTitle': 'Kamer kiezen',
      'roomQuestion': 'Welke kamer wilt u nu controleren?',
      'roomInstruction':
          'Tik op een kamer, leg daar uw apparaten vast en keer terug om de volgende kamer te kiezen.',
      'results': 'Resultaten',
      'alreadyEvaluated': 'Al beoordeeld',
      'notCompleted': 'Niet voltooid',
      'addRoom': 'Kamer toevoegen',
      'deviceTitlePrefix': 'Apparaten',
      'roomCheck': 'Kamercheck',
      'deviceQuestion': 'Welke slimme apparaten gebruikt u in deze kamer?',
      'deviceQuestionHint': 'Tik op een apparaat om de vragen te beantwoorden.',
      'noKnownDevices':
          'Geen bekende apparaten voor deze kamer. U kunt een eigen apparaat toevoegen.',
      'addDevice': 'Apparaat\ntoevoegen',
      'noDevice': 'Geen apparaat',
      'nextRoom': 'Volgende kamer',
      'deleteDeviceTitle': 'Apparaat verwijderen?',
      'deleteDeviceBody':
          'Dit aangepaste apparaat wordt verwijderd. Alle gekoppelde instanties worden ook verwijderd.',
      'delete': 'Verwijderen',
      'cancel': 'Annuleren',
      'confirm': 'Bevestigen',
      'noDeviceDialogTitle': 'Geen apparaten in deze kamer?',
      'noDeviceDialogBody':
          'Deze kamer wordt zonder apparaten afgerond en telt niet mee in de score.',
      'noDeviceDialogBodyWithExisting':
          'Bestaande apparaatkeuzes voor deze kamer worden verwijderd. Deze kamer wordt zonder apparaten afgerond en telt niet mee in de score.',
      'questionnaireTitle': 'Vragen',
      'connectedDevice': 'Verbonden apparaat',
      'done': 'Klaar',
      'yes': 'Ja',
      'no': 'Nee',
      'dontKnow': 'Weet ik niet',
      'notApplicableForDevice':
          'Deze vraag is niet van toepassing op mijn apparaat',
      'languageDialogTitle': 'Taal kiezen',
      'currentLanguage': 'Huidige taal',
      'aboutScreenTitle': 'Over de app',
      'aboutSubtitle': 'Onderzoeksproject over smart-home-privacy',
      'aboutProjectName': 'Simplications',
      'aboutPartnerTuChemnitz': 'Technische Universiteit Chemnitz',
      'aboutPartnerHsAnhalt': 'Hogeschool Anhalt',
      'aboutPartnerVzSachsen': 'Consumentenorganisatie Saksen',
      'aboutWebsiteSimplicationsLabel': 'simplications.tucmi.de',
      'aboutWebsiteSimplicationsUrl': 'https://simplications.tucmi.de',
      'aboutWebsiteTuChemnitzLabel': 'tu-chemnitz.de',
      'aboutWebsiteTuChemnitzUrl': 'https://www.tu-chemnitz.de',
      'aboutWebsiteHsAnhaltLabel': 'hs-anhalt.de',
      'aboutWebsiteHsAnhaltUrl': 'https://www.hs-anhalt.de',
      'aboutWebsiteVzSachsenLabel': 'verbraucherzentrale-sachsen.de',
      'aboutWebsiteVzSachsenUrl': 'https://www.verbraucherzentrale-sachsen.de',
      'aboutWebsitePlatformPrivacyLabel': 'plattform-privatheit.de',
      'aboutWebsitePlatformPrivacyUrl': 'https://www.plattform-privatheit.de',
      'aboutWebsiteFundingAgencyLabel': 'bmftr.bund.de',
      'aboutWebsiteFundingAgencyUrl': 'https://www.bmftr.bund.de',
      'websiteOpenFailed': 'Kon website niet openen.',
      'deleteAllDataTitle': 'Alle gegevens verwijderen?',
      'deleteAllDataBody':
          'Alle vastgelegde kamers, apparaten en antwoorden worden permanent verwijderd. Deze actie kan niet ongedaan worden gemaakt.',
      'deleteAllDataButton': 'Gegevens verwijderen',
      'allDataDeleted': 'Alle opgeslagen gegevens zijn verwijderd.',
      'projectPartners': 'Projectpartners',
      'coordinationFunding': 'Coordinatie en financiering',
      'coordination': 'Coordinatie',
      'platformPrivacy': 'Plattform Privatheit',
      'fundingAgency': 'Financierende instantie',
      'fundingAgencyValue':
          'Duits Federaal Ministerie voor Onderzoek, Technologie en Ruimtevaart\nSubsidie 16KIS1868K',
      'website': 'Website',
      'dangerZone': 'Gevarenzone',
      'dangerZoneWarning':
          'Waarschuwing: deze actie verwijdert alle opgeslagen app-gegevens permanent.',
      'faqScreenTitle': 'Veelgestelde vragen',
      'faqQuestionWhatIs': 'Wat is Simplications?',
      'faqAnswerWhatIs':
          'Simplications is een onderzoeksproject over smart-home-privacy. Deze app is een onderdeel van het project en begeleidt je kamer voor kamer door je apparaten met praktische aanbevelingen op basis van je antwoorden.',
      'faqQuestionHowWorks': 'Hoe werkt de check?',
      'faqAnswerHowWorks':
          'Je kiest een kamer, voegt je slimme apparaten toe, beantwoordt apparaatspecifieke vragen en ontvangt een risicoprofiel met geprioriteerde acties.',
      'faqQuestionNoPolicy': 'Waarom is er geen privacybeleid?',
      'faqAnswerNoPolicy': 'Omdat we jouw gegevens niet verzamelen.',
      'faqQuestionDataStored': 'Waar worden mijn gegevens opgeslagen?',
      'faqAnswerDataStored':
          'Je beoordelingsgegevens worden lokaal op je apparaat opgeslagen. In het Over-scherm kun je alle opgeslagen gegevens op elk moment verwijderen.',
      'faqQuestionNoDevice': 'Wat als mijn apparaat niet in de lijst staat?',
      'faqAnswerNoDevice':
          'Je kunt aangepaste apparaten toevoegen en de check toch voltooien. De aanbevelingen zijn dan gebaseerd op je configuratie en antwoorden.',
      'faqQuestionRiskMeaning': 'Wat betekenen laag, gemiddeld en hoog risico?',
      'faqAnswerRiskMeaning':
          'Deze niveaus geven aan in hoeverre je huidige configuratie privacyrisico’s kan vergroten. Het zijn richtniveaus, geen juridische of technische certificering.',
      'faqQuestionLegalAdvice': 'Is dit juridisch advies?',
      'faqAnswerLegalAdvice':
          'Nee. Simplications biedt praktische oriëntatie en aanbevelingen, maar vervangt geen juridisch advies of professionele beveiligingsconsultatie.',
      'faqQuestionCanShare': 'Kan ik mijn resultaten delen?',
      'faqAnswerCanShare':
          'Ja. In het resultatenscherm kun je je samenvatting exporteren en delen als tekst of PDF.',
      'roomDeleteTitle': 'Kamer verwijderen?',
      'roomDeleteBody':
          'Deze aangepaste kamer wordt verwijderd. Alle gekoppelde apparaten worden ook verwijderd.',
      'add': 'Toevoegen',
      'addRoomDialogTitle': 'Nieuwe kamer toevoegen',
      'roomName': 'Kamernaam',
      'roomNameHint': 'bijv. Woonkamer, Garage',
      'chooseIcon': 'Kies een pictogram:',
      'addDeviceDialogTitle': 'Nieuw apparaat toevoegen',
      'deviceName': 'Apparaatnaam',
      'deviceNameHint': 'bijv. Mijn slimme speaker',
      'baseRiskLabel': 'Basisscore risico (0-100)',
      'baseRiskHint': 'bijv. 30 (laag) tot 60 (hoog)',
      'hasCamera': 'Heeft camera?',
      'hasMicrophone': 'Heeft microfoon?',
      'camera': 'Camera',
      'microphone': 'Microfoon',
      'summaryTitle': 'Jouw resultaat',
      'shareResult': 'Resultaat delen',
      'shareAsText': 'Delen als tekst',
      'shareAsPdf': 'Delen als PDF',
      'restart': 'Opnieuw starten',
      'noDevicesCaptured': 'Geen apparaten vastgelegd.',
      'noDevicesHint':
          'Start opnieuw en voeg apparaten toe om een beoordeling te krijgen.',
      'highRisk': 'Hoog risico',
      'mediumRisk': 'Gemiddeld risico',
      'lowRisk': 'Laag risico',
      'exportFailed': 'Export mislukt',
      'summaryShareSubject': 'Simplications-resultaat',
      'summarySharePdfText': 'Simplications-rapport als PDF',
      'overview': 'Overzicht',
      'evaluatedDevices': 'Beoordeelde apparaten',
      'overallRisk': 'Totaal risico',
      'generalRecommendations': 'Algemene aanbevelingen',
      'generalRecommendationsHint':
          'Deze maatregelen gelden voor je hele smart home, ongeacht afzonderlijke apparaten.',
      'fullCatalog': 'Volledige actiecatalogus',
      'catalogButton': 'Open volledige actiecatalogus',
      'risk': 'Risico',
      'note': 'Opmerking',
      'recommendations': 'Aanbevelingen',
      'urgent': 'Urgent',
      'recommended': 'Aanbevolen',
      'optional': 'Optioneel',
      'social': 'Sociaal',
      'technical': 'Technisch',
      'security': 'Beveiliging',
      'smartHomePrivacyHeader': 'Jouw smart-home-privacy',
      'devicesRated': 'beoordeelde apparaten',
      'howRiskCalculated': 'Hoe wordt risico berekend?',
      'totalScore': 'Totaal',
      'catalogSnackBarPrefix': 'Catalogus',
      'reportExportedAt': 'Geëxporteerd op',
      'noActionLow': 'Alles is in orde - geen acties vereist.',
      'noActionMedium':
          'Er kunnen momenteel geen concrete acties uit je antwoorden worden afgeleid, maar er blijft een gemiddeld restrisico.',
      'noActionHigh':
          'Er kunnen momenteel geen concrete acties uit je antwoorden worden afgeleid, maar er blijft een hoog restrisico.',
      'overallLow':
          'Goed gedaan! Je apparaten zijn grotendeels veilig geconfigureerd. Bekijk alsnog de algemene aanbevelingen.',
      'overallMedium':
          'Er is ruimte voor verbetering. Bekijk de aanbevelingen per apparaat.',
      'overallHigh':
          'Meerdere apparaten hebben aanzienlijke privacy-/gegevensbeschermingsrisico’s. Voer maatregelen met hoge prioriteit zo snel mogelijk uit.',
      'dontKnowHint':
          ' {count} antwoord{suffix} is gemarkeerd als "Weet ik niet" - neem de tijd om de instellingen van je apparaten beter te leren kennen.',
    },
    'da': {
      'appTitle': 'Simplications',
      'welcomeTitle': 'Simplications\nSmart Home\nprivatlivstjek',
      'welcomeDescription':
          'Registrer dine smarte enheder rum for rum, og få en privatlivsvurdering med konkrete anbefalinger.',
      'stepSelectRooms': 'Vælg ét rum',
      'stepCaptureDevices': 'Registrer enheder',
      'stepAnswerQuestions': 'Besvar spørgsmål',
      'stepGetRisk': 'Få risikoprofil og anbefalinger',
      'start': 'Start',
      'resume': 'Fortsæt',
      'about': 'Om',
      'faq': 'FAQ',
      'roomSelectionTitle': 'Vælg rum',
      'roomQuestion': 'Hvilket rum vil du tjekke nu?',
      'roomInstruction':
          'Tryk på et rum, registrer enhederne dér, og kom tilbage hertil for at vælge næste rum.',
      'results': 'Resultater',
      'alreadyEvaluated': 'Allerede vurderet',
      'notCompleted': 'Ikke afsluttet',
      'addRoom': 'Tilføj rum',
      'deviceTitlePrefix': 'Enheder',
      'roomCheck': 'Rumtjek',
      'deviceQuestion': 'Hvilke smarte enheder bruger du i dette rum?',
      'deviceQuestionHint': 'Tryk på en enhed for at besvare spørgsmålene.',
      'noKnownDevices':
          'Ingen kendte enheder for dette rum. Du kan tilføje din egen enhed.',
      'addDevice': 'Tilføj\nenhed',
      'noDevice': 'Ingen enhed',
      'nextRoom': 'Næste rum',
      'deleteDeviceTitle': 'Slet enhed?',
      'deleteDeviceBody':
          'Denne brugerdefinerede enhed slettes. Alle tilknyttede instanser fjernes også.',
      'delete': 'Slet',
      'cancel': 'Annuller',
      'confirm': 'Bekræft',
      'noDeviceDialogTitle': 'Ingen enheder i dette rum?',
      'noDeviceDialogBody':
          'Dette rum afsluttes uden enheder og påvirker ikke scoren.',
      'noDeviceDialogBodyWithExisting':
          'Eksisterende enhedsvalg for dette rum kasseres. Dette rum afsluttes uden enheder og påvirker ikke scoren.',
      'questionnaireTitle': 'Spørgsmål',
      'connectedDevice': 'Tilsluttet enhed',
      'done': 'Færdig',
      'yes': 'Ja',
      'no': 'Nej',
      'dontKnow': 'Ved ikke',
      'notApplicableForDevice': 'Dette spørgsmål gælder ikke for min enhed',
      'languageDialogTitle': 'Vælg sprog',
      'currentLanguage': 'Nuværende sprog',
      'aboutScreenTitle': 'Om appen',
      'aboutSubtitle': 'Forskningsprojekt om privatliv i smarte hjem',
      'aboutProjectName': 'Simplications',
      'aboutPartnerTuChemnitz': 'Teknisk Universitet i Chemnitz',
      'aboutPartnerHsAnhalt': 'Anhalt University of Applied Sciences',
      'aboutPartnerVzSachsen': 'Forbrugercenter Sachsen',
      'aboutWebsiteSimplicationsLabel': 'simplications.tucmi.de',
      'aboutWebsiteSimplicationsUrl': 'https://simplications.tucmi.de',
      'aboutWebsiteTuChemnitzLabel': 'tu-chemnitz.de',
      'aboutWebsiteTuChemnitzUrl': 'https://www.tu-chemnitz.de',
      'aboutWebsiteHsAnhaltLabel': 'hs-anhalt.de',
      'aboutWebsiteHsAnhaltUrl': 'https://www.hs-anhalt.de',
      'aboutWebsiteVzSachsenLabel': 'verbraucherzentrale-sachsen.de',
      'aboutWebsiteVzSachsenUrl': 'https://www.verbraucherzentrale-sachsen.de',
      'aboutWebsitePlatformPrivacyLabel': 'plattform-privatheit.de',
      'aboutWebsitePlatformPrivacyUrl': 'https://www.plattform-privatheit.de',
      'aboutWebsiteFundingAgencyLabel': 'bmftr.bund.de',
      'aboutWebsiteFundingAgencyUrl': 'https://www.bmftr.bund.de',
      'websiteOpenFailed': 'Kunne ikke åbne webstedet.',
      'deleteAllDataTitle': 'Slet alle data?',
      'deleteAllDataBody':
          'Alle registrerede rum, enheder og svar slettes permanent. Handlingen kan ikke fortrydes.',
      'deleteAllDataButton': 'Slet data',
      'allDataDeleted': 'Alle gemte data er blevet slettet.',
      'projectPartners': 'Projektpartnere',
      'coordinationFunding': 'Koordination og finansiering',
      'coordination': 'Koordination',
      'platformPrivacy': 'Plattform Privatheit',
      'fundingAgency': 'Finansieringsorgan',
      'fundingAgencyValue':
          'Tysk forbundsministerium for forskning, teknologi og rumfart\nBevilling 16KIS1868K',
      'website': 'Websted',
      'dangerZone': 'Farezone',
      'dangerZoneWarning':
          'Advarsel: Denne handling fjerner alle gemte app-data permanent.',
      'faqScreenTitle': 'Ofte stillede spørgsmål',
      'faqQuestionWhatIs': 'Hvad er Simplications?',
      'faqAnswerWhatIs':
          'Simplications er et forskningsprojekt om privatliv i smarte hjem. Denne app er en del af projektet og guider dig rum for rum gennem dine enheder med praktiske anbefalinger baseret på dine svar.',
      'faqQuestionHowWorks': 'Hvordan fungerer tjekket?',
      'faqAnswerHowWorks':
          'Du vælger et rum, tilføjer dine smarte enheder, besvarer enhedsspecifikke spørgsmål og får en risikoprofil med prioriterede handlinger.',
      'faqQuestionNoPolicy': 'Hvorfor er der ingen privatlivspolitik?',
      'faqAnswerNoPolicy': 'Fordi vi ikke indsamler dine data.',
      'faqQuestionDataStored': 'Hvor gemmes mine data?',
      'faqAnswerDataStored':
          'Dine vurderingsdata gemmes lokalt på din enhed. På Om-skærmen kan du til enhver tid slette alle gemte data.',
      'faqQuestionNoDevice': 'Hvad hvis min enhed ikke er på listen?',
      'faqAnswerNoDevice':
          'Du kan tilføje brugerdefinerede enheder og stadig gennemføre tjekket. Anbefalingerne bygger så på din opsætning og dine svar.',
      'faqQuestionRiskMeaning': 'Hvad betyder lav, mellem og høj risiko?',
      'faqAnswerRiskMeaning':
          'Disse niveauer viser, hvor meget din nuværende konfiguration kan øge privatlivsrisici. De er vejledende niveauer, ikke juridisk eller teknisk certificering.',
      'faqQuestionLegalAdvice': 'Er dette juridisk rådgivning?',
      'faqAnswerLegalAdvice':
          'Nej. Simplications giver praktisk vejledning og anbefalinger, men erstatter ikke juridisk rådgivning eller professionel sikkerhedsrådgivning.',
      'faqQuestionCanShare': 'Kan jeg dele mine resultater?',
      'faqAnswerCanShare':
          'Ja. På resultatskærmen kan du eksportere og dele din opsummering som tekst eller PDF.',
      'roomDeleteTitle': 'Slet rum?',
      'roomDeleteBody':
          'Dette brugerdefinerede rum bliver slettet. Alle tilknyttede enheder bliver også fjernet.',
      'add': 'Tilføj',
      'addRoomDialogTitle': 'Tilføj nyt rum',
      'roomName': 'Rumnavn',
      'roomNameHint': 'f.eks. Stue, Garage',
      'chooseIcon': 'Vælg ikon:',
      'addDeviceDialogTitle': 'Tilføj ny enhed',
      'deviceName': 'Enhedsnavn',
      'deviceNameHint': 'f.eks. Min smarte højttaler',
      'baseRiskLabel': 'Basisrisikoscore (0-100)',
      'baseRiskHint': 'f.eks. 30 (lav) til 60 (høj)',
      'hasCamera': 'Har kamera?',
      'hasMicrophone': 'Har mikrofon?',
      'camera': 'Kamera',
      'microphone': 'Mikrofon',
      'summaryTitle': 'Dit resultat',
      'shareResult': 'Del resultat',
      'shareAsText': 'Del som tekst',
      'shareAsPdf': 'Del som PDF',
      'restart': 'Start forfra',
      'noDevicesCaptured': 'Ingen enheder registreret.',
      'noDevicesHint': 'Start forfra og tilføj enheder for at få en vurdering.',
      'highRisk': 'Høj risiko',
      'mediumRisk': 'Middel risiko',
      'lowRisk': 'Lav risiko',
      'exportFailed': 'Eksport mislykkedes',
      'summaryShareSubject': 'Simplications-resultat',
      'summarySharePdfText': 'Simplications-rapport som PDF',
      'overview': 'Oversigt',
      'evaluatedDevices': 'Vurderede enheder',
      'overallRisk': 'Samlet risiko',
      'generalRecommendations': 'Generelle anbefalinger',
      'generalRecommendationsHint':
          'Disse tiltag gælder for hele dit smarte hjem uanset individuelle enheder.',
      'fullCatalog': 'Fuldt handlingskatalog',
      'catalogButton': 'Åbn fuldt handlingskatalog',
      'risk': 'Risiko',
      'note': 'Bemærkning',
      'recommendations': 'Anbefalinger',
      'urgent': 'Haster',
      'recommended': 'Anbefalet',
      'optional': 'Valgfri',
      'social': 'Social',
      'technical': 'Teknisk',
      'security': 'Sikkerhed',
      'smartHomePrivacyHeader': 'Dit smart-home-privatliv',
      'devicesRated': 'vurderede enheder',
      'howRiskCalculated': 'Hvordan beregnes risiko?',
      'totalScore': 'I alt',
      'catalogSnackBarPrefix': 'Katalog',
      'reportExportedAt': 'Eksporteret den',
      'noActionLow': 'Alt er i orden - ingen handlinger nødvendige.',
      'noActionMedium':
          'Der kan i øjeblikket ikke udledes konkrete handlinger fra dine svar, men der er fortsat en middel rest-risiko.',
      'noActionHigh':
          'Der kan i øjeblikket ikke udledes konkrete handlinger fra dine svar, men der er fortsat en høj rest-risiko.',
      'overallLow':
          'Godt klaret! Dine enheder er overvejende sikkert konfigureret. Gennemgå alligevel de generelle anbefalinger.',
      'overallMedium':
          'Der er plads til forbedringer. Gennemgå anbefalingerne for hver enhed.',
      'overallHigh':
          'Flere enheder har betydelige privatlivs-/databeskyttelsesrisici. Implementér venligst højprioriterede tiltag hurtigt.',
      'dontKnowHint':
          ' {count} svar{suffix} er markeret som "Ved ikke" - brug tid på at lære dine enhedsindstillinger bedre at kende.',
    },
  };

  String _value(String key) {
    final languageCode = locale.languageCode;
    final current = _localizedValues[languageCode] ?? _localizedValues['de']!;
    return current[key] ??
        _localizedValues['en']![key] ??
        _localizedValues['de']![key] ??
        key;
  }

  String appTitle() => _value('appTitle');
  String welcomeTitle() => _value('welcomeTitle');
  String welcomeDescription() => _value('welcomeDescription');
  String stepSelectRooms() => _value('stepSelectRooms');
  String stepCaptureDevices() => _value('stepCaptureDevices');
  String stepAnswerQuestions() => _value('stepAnswerQuestions');
  String stepGetRisk() => _value('stepGetRisk');
  String start() => _value('start');
  String resume() => _value('resume');
  String about() => _value('about');
  String faq() => _value('faq');
  String roomSelectionTitle() => _value('roomSelectionTitle');
  String roomQuestion() => _value('roomQuestion');
  String roomInstruction() => _value('roomInstruction');
  String results() => _value('results');
  String alreadyEvaluated() => _value('alreadyEvaluated');
  String notCompleted() => _value('notCompleted');
  String addRoom() => _value('addRoom');
  String roomCheck() => _value('roomCheck');
  String deviceQuestion() => _value('deviceQuestion');
  String deviceQuestionHint() => _value('deviceQuestionHint');
  String noKnownDevices() => _value('noKnownDevices');
  String addDevice() => _value('addDevice');
  String noDevice() => _value('noDevice');
  String nextRoom() => _value('nextRoom');
  String deleteDeviceTitle() => _value('deleteDeviceTitle');
  String deleteDeviceBody() => _value('deleteDeviceBody');
  String delete() => _value('delete');
  String cancel() => _value('cancel');
  String confirm() => _value('confirm');
  String noDeviceDialogTitle() => _value('noDeviceDialogTitle');
  String noDeviceDialogBody() => _value('noDeviceDialogBody');
  String noDeviceDialogBodyWithExisting() =>
      _value('noDeviceDialogBodyWithExisting');
  String questionnaireTitle() => _value('questionnaireTitle');
  String connectedDevice() => _value('connectedDevice');
  String done() => _value('done');
  String yes() => _value('yes');
  String no() => _value('no');
  String dontKnow() => _value('dontKnow');
  String notApplicableForDevice() => _value('notApplicableForDevice');
  String languageDialogTitle() => _value('languageDialogTitle');
  String currentLanguage() => _value('currentLanguage');
  String aboutScreenTitle() => _value('aboutScreenTitle');
  String faqScreenTitle() => _value('faqScreenTitle');
  String aboutSubtitle() => _value('aboutSubtitle');
  String aboutProjectName() => _value('aboutProjectName');
  String aboutPartnerTuChemnitz() => _value('aboutPartnerTuChemnitz');
  String aboutPartnerHsAnhalt() => _value('aboutPartnerHsAnhalt');
  String aboutPartnerVzSachsen() => _value('aboutPartnerVzSachsen');
  String aboutWebsiteSimplicationsLabel() =>
      _value('aboutWebsiteSimplicationsLabel');
  String aboutWebsiteSimplicationsUrl() =>
      _value('aboutWebsiteSimplicationsUrl');
  String aboutWebsiteTuChemnitzLabel() => _value('aboutWebsiteTuChemnitzLabel');
  String aboutWebsiteTuChemnitzUrl() => _value('aboutWebsiteTuChemnitzUrl');
  String aboutWebsiteHsAnhaltLabel() => _value('aboutWebsiteHsAnhaltLabel');
  String aboutWebsiteHsAnhaltUrl() => _value('aboutWebsiteHsAnhaltUrl');
  String aboutWebsiteVzSachsenLabel() => _value('aboutWebsiteVzSachsenLabel');
  String aboutWebsiteVzSachsenUrl() => _value('aboutWebsiteVzSachsenUrl');
  String aboutWebsitePlatformPrivacyLabel() =>
      _value('aboutWebsitePlatformPrivacyLabel');
  String aboutWebsitePlatformPrivacyUrl() =>
      _value('aboutWebsitePlatformPrivacyUrl');
  String aboutWebsiteFundingAgencyLabel() =>
      _value('aboutWebsiteFundingAgencyLabel');
  String aboutWebsiteFundingAgencyUrl() =>
      _value('aboutWebsiteFundingAgencyUrl');
  String faqQuestionWhatIs() => _value('faqQuestionWhatIs');
  String faqAnswerWhatIs() => _value('faqAnswerWhatIs');
  String faqQuestionHowWorks() => _value('faqQuestionHowWorks');
  String faqAnswerHowWorks() => _value('faqAnswerHowWorks');
  String faqQuestionNoPolicy() => _value('faqQuestionNoPolicy');
  String faqAnswerNoPolicy() => _value('faqAnswerNoPolicy');
  String faqQuestionDataStored() => _value('faqQuestionDataStored');
  String faqAnswerDataStored() => _value('faqAnswerDataStored');
  String faqQuestionNoDevice() => _value('faqQuestionNoDevice');
  String faqAnswerNoDevice() => _value('faqAnswerNoDevice');
  String faqQuestionRiskMeaning() => _value('faqQuestionRiskMeaning');
  String faqAnswerRiskMeaning() => _value('faqAnswerRiskMeaning');
  String faqQuestionLegalAdvice() => _value('faqQuestionLegalAdvice');
  String faqAnswerLegalAdvice() => _value('faqAnswerLegalAdvice');
  String faqQuestionCanShare() => _value('faqQuestionCanShare');
  String faqAnswerCanShare() => _value('faqAnswerCanShare');
  String websiteOpenFailed() => _value('websiteOpenFailed');
  String deleteAllDataTitle() => _value('deleteAllDataTitle');
  String deleteAllDataBody() => _value('deleteAllDataBody');
  String deleteAllDataButton() => _value('deleteAllDataButton');
  String allDataDeleted() => _value('allDataDeleted');
  String projectPartners() => _value('projectPartners');
  String coordinationFunding() => _value('coordinationFunding');
  String coordination() => _value('coordination');
  String platformPrivacy() => _value('platformPrivacy');
  String fundingAgency() => _value('fundingAgency');
  String fundingAgencyValue() => _value('fundingAgencyValue');
  String website() => _value('website');
  String dangerZone() => _value('dangerZone');
  String dangerZoneWarning() => _value('dangerZoneWarning');
  String expertModeTitle() => _value('expertModeTitle');
  String expertModeToggleLabel() => _value('expertModeToggleLabel');
  String expertModeToggleHint() => _value('expertModeToggleHint');
  String expertModeSourcesHint() => _value('expertModeSourcesHint');
  String expertModeSourceCmuLabel() => _value('expertModeSourceCmuLabel');
  String expertModeSourceCmuUrl() => _value('expertModeSourceCmuUrl');
  String expertModeSourceUnboxingLabel() =>
      _value('expertModeSourceUnboxingLabel');
  String expertModeSourceUnboxingUrl() => _value('expertModeSourceUnboxingUrl');
  String expertModeQuestionnaireHint() => _value('expertModeQuestionnaireHint');
  String roomDeleteTitle() => _value('roomDeleteTitle');
  String roomDeleteBody() => _value('roomDeleteBody');
  String add() => _value('add');
  String addRoomDialogTitle() => _value('addRoomDialogTitle');
  String roomName() => _value('roomName');
  String roomNameHint() => _value('roomNameHint');
  String chooseIcon() => _value('chooseIcon');
  String addDeviceDialogTitle() => _value('addDeviceDialogTitle');
  String deviceName() => _value('deviceName');
  String deviceNameHint() => _value('deviceNameHint');
  String baseRiskLabel() => _value('baseRiskLabel');
  String baseRiskHint() => _value('baseRiskHint');
  String hasCamera() => _value('hasCamera');
  String hasMicrophone() => _value('hasMicrophone');
  String camera() => _value('camera');
  String microphone() => _value('microphone');
  String summaryTitle() => _value('summaryTitle');
  String shareResult() => _value('shareResult');
  String shareAsText() => _value('shareAsText');
  String shareAsPdf() => _value('shareAsPdf');
  String restart() => _value('restart');
  String noDevicesCaptured() => _value('noDevicesCaptured');
  String noDevicesHint() => _value('noDevicesHint');
  String highRisk() => _value('highRisk');
  String mediumRisk() => _value('mediumRisk');
  String lowRisk() => _value('lowRisk');
  String exportFailed() => _value('exportFailed');
  String summaryShareSubject() => _value('summaryShareSubject');
  String summarySharePdfText() => _value('summarySharePdfText');
  String overview() => _value('overview');
  String evaluatedDevices() => _value('evaluatedDevices');
  String overallRisk() => _value('overallRisk');
  String generalRecommendations() => _value('generalRecommendations');
  String generalRecommendationsHint() => _value('generalRecommendationsHint');
  String fullCatalog() => _value('fullCatalog');
  String catalogButton() => _value('catalogButton');
  String risk() => _value('risk');
  String note() => _value('note');
  String recommendations() => _value('recommendations');
  String urgent() => _value('urgent');
  String recommended() => _value('recommended');
  String optional() => _value('optional');
  String social() => _value('social');
  String technical() => _value('technical');
  String security() => _value('security');
  String smartHomePrivacyHeader() => _value('smartHomePrivacyHeader');
  String devicesRated() => _value('devicesRated');
  String howRiskCalculated() => _value('howRiskCalculated');
  String totalScore() => _value('totalScore');
  String catalogSnackBarPrefix() => _value('catalogSnackBarPrefix');
  String reportExportedAt() => _value('reportExportedAt');
  String noActionLow() => _value('noActionLow');
  String noActionMedium() => _value('noActionMedium');
  String noActionHigh() => _value('noActionHigh');
  String overallLow() => _value('overallLow');
  String overallMedium() => _value('overallMedium');
  String overallHigh() => _value('overallHigh');
  String dontKnowHint(int count, {required String suffix}) => _value(
    'dontKnowHint',
  ).replaceAll('{count}', '$count').replaceAll('{suffix}', suffix);

  String devicesTitle(String roomName) =>
      '${_value('deviceTitlePrefix')}: $roomName';
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => AppLocalizations.supportedLocales.any(
    (supported) => supported.languageCode == locale.languageCode,
  );

  @override
  Future<AppLocalizations> load(Locale locale) async =>
      AppLocalizations.activate(locale);

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}
