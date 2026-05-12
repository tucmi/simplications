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
      'skippedDevicesHint':
          '{count} Geräte übersprungen, da der Fragebogen nicht abgeschlossen wurde.',
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
      // ── Rooms ───────────────────────────────────────────────────────────────
      'room_living': 'Wohnzimmer',
      'room_kitchen': 'Küche',
      'room_bedroom': 'Schlafzimmer',
      'room_child_bedroom': 'Kinderzimmer',
      'room_bathroom': 'Badezimmer',
      'room_office': 'Arbeitszimmer',
      'room_hallway': 'Flur / Eingang',
      'room_garden': 'Garten / Außenbereich',
      'room_basement': 'Keller / Speisekammer',
      'room_whole_home': 'Ganze Wohnung',
      // ── Device names ─────────────────────────────────────────────────────────
      'device_simple_sensor':
          'Einfacher Sensor (z. B. Bewegungs- oder Türsensor)',
      'device_humidity_sensor': 'Feuchtigkeitssensor',
      'device_temperature_sensor': 'Temperatursensor',
      'device_light_sensor': 'Lichtsensor',
      'device_smart_speaker': 'Smart Speaker / Sprachassistent',
      'device_smart_display': 'Smart Display (z. B. Nest Hub)',
      'device_smart_tv': 'Smart TV',
      'device_indoor_camera': 'Smarte Innenkamera',
      'device_outdoor_camera': 'Smarte Außenkamera',
      'device_doorbell_camera': 'Smarte Türklingel mit Kamera',
      'device_baby_monitor': 'Babymonitor / Babykamera',
      'device_robot_vacuum': 'Saugroboter',
      'device_smart_fridge': 'Smarter Kühlschrank',
      'device_smart_oven': 'Smarter Backofen / Herd',
      'device_smart_coffee': 'Smarte Kaffeemaschine',
      'device_smart_washing': 'Smarte Waschmaschine / Trockner',
      'device_smart_thermostat': 'Smarter Thermostat / Heizungssteuerung',
      'device_smart_plug': 'Smarte Steckdose',
      'device_smart_light': 'Smarte Beleuchtung',
      'device_smart_lock': 'Smartes Türschloss',
      'device_smart_blind': 'Smarte Jalousie / Rolllade',
      'device_fitness_tracker': 'Fitness-Tracker / Smartwatch',
      'device_smart_toy': 'Smartes Spielzeug',
      'device_smart_router': 'Smart Router / Mesh-System',
      'device_smart_hub': 'Smart-Home-Hub (z. B. Homey, Home Assistant)',
      'device_smart_meter': 'Intelligenter Stromzähler / Smart Meter',
      'device_smart_irrigation': 'Smarte Bewässerungsanlage',
      'device_smart_scale': 'Smarte Waage',
      'device_smart_printer': 'Smarter Drucker',
      // ── Question texts & hints ───────────────────────────────────────────────
      'q_password_text':
          'Haben Sie das Standard-Passwort des Geräts oder des zugehörigen Kontos geändert?',
      'q_password_hint':
          'Voreingestellte Passwörter sind oft öffentlich bekannt und leicht zu knacken.',
      'q_updates_text':
          'Sind automatische Sicherheits-Updates für das Gerät aktiviert?',
      'q_updates_hint': 'Updates schließen bekannte Sicherheitslücken zeitnah.',
      'q_network_text':
          'Ist das Gerät in einem separaten Smart-Home- oder IoT-WLAN eingebunden?',
      'q_network_hint':
          'Ein eigenes Netz für smarte Geräte schützt Ihr restliches Heimnetzwerk.',
      'q_informed_text':
          'Sind alle Personen im Haushalt über dieses Gerät und seine Funktion informiert?',
      'q_informed_hint':
          'Alle Mitbewohnenden sollten wissen, welche Daten das Gerät erfasst.',
      'q_permissions_text':
          'Haben Sie unnötige App-Berechtigungen (z. B. Standort, Kontakte) deaktiviert?',
      'q_permissions_hint':
          'Nur wirklich benötigte Berechtigungen sollten aktiviert sein.',
      'q_mic_active_text':
          'Deaktivieren Sie das Mikrofon, wenn Sie es nicht aktiv nutzen?',
      'q_mic_active_hint':
          'Smarte Lautsprecher und Geräte mit Mikrofonen können versehentlich aktiviert werden.',
      'q_camera_consent_text':
          'Filmt die Kamera nur Bereiche, für die alle Betroffenen ihr Einverständnis gegeben haben?',
      'q_camera_consent_hint':
          'Kameras in Gemeinschafts- oder Privatbereichen bedürfen der Zustimmung aller Bewohner.',
      'q_sensor_frequency_text':
          'Können Sie das Messintervall des Sensors reduzieren (z. B. seltener messen)?',
      'q_sensor_frequency_hint':
          'Eine niedrigere Messfrequenz erzeugt weniger Daten und schränkt Rückschlüsse auf Ihr Verhalten ein.',
      'q_sensor_data_deletion_text':
          'Werden ältere Messwerte automatisch oder auf Wunsch gelöscht?',
      'q_sensor_data_deletion_hint':
          'Alte Verlaufsdaten sollten nicht dauerhaft gespeichert bleiben. Prüfen Sie die Aufbewahrungszeit in den Einstellungen.',
      'q_sensor_granularity_text':
          'Zeigt das System die Sensordaten nur in zusammengefasster Form an (z. B. Tages- statt Minutenwerte)?',
      'q_sensor_granularity_hint':
          'Weniger granulare Anzeigen schützen vor Rückschlüssen auf genaue Anwesenheits- oder Verhaltensmuster.',
      'q_sensor_local_text':
          'Werden die Messdaten lokal verarbeitet und gespeichert, ohne in eine Cloud übertragen zu werden?',
      'q_sensor_local_hint':
          'Lokale Verarbeitung verhindert, dass der Hersteller Einblick in Ihre Messwerte erhält.',
      'q_voice_history_text':
          'Können Sie Sprachaufnahmen aus der Geräte-Historie löschen oder diese Funktion deaktivieren?',
      'q_voice_history_hint':
          'BSI-Empfehlung: Minimieren Sie die Speicherung von Aufnahmen oder löschen Sie sie regelmäßig.',
      'q_voice_local_text':
          'Wird die Sprachverarbeitung teilweise lokal auf dem Gerät durchgeführt?',
      'q_voice_local_hint':
          'Lokale Verarbeitung reduziert die Menge an Daten, die in die Cloud übertragen werden.',
      'q_skills_permissions_text':
          'Überprüfen Sie regelmäßig, welche Fähigkeiten/Skills Zugriff auf Ihr Konto haben?',
      'q_skills_permissions_hint':
          'Skills von Drittanbietern können sensible Daten abfangen. Nur notwendige Skills aktivieren.',
      'q_video_encryption_text':
          'Ist die Videoaufnahme und -übertragung durchgängig verschlüsselt?',
      'q_video_encryption_hint':
          'BSI-Empfehlung: Verschlüsselte Verbindung verhindert Abhören und Datenklau unterwegs.',
      'q_video_storage_text':
          'Werden Aufnahmen lokal gespeichert (nicht ausschließlich in der Cloud des Anbieters)?',
      'q_video_storage_hint':
          'Lokale Speicherung gibt Ihnen mehr Kontrolle über Ihre Daten; bei reiner Cloud-Speicherung sind Sie auf die Sicherheit des Anbieters angewiesen.',
      'q_sharing_restrictions_text':
          'Können Sie steuern, wer auf die Live-View und Aufnahmen zugreifen kann?',
      'q_sharing_restrictions_hint':
          'Sie sollten genau kontrollieren können, wer Zugang zu den Videoaufnahmen erhält.',
      'q_motion_detection_text':
          'Können Sie Bewegungserkennung deaktivieren oder zeitlich begrenzen, wenn Sie zu Hause sind?',
      'q_motion_detection_hint':
          'BSI-Empfehlung: Unnötige Aufnahmen vermeiden reduziert Datenmenge und Missbrauchsrisiko.',
      'q_account_required_text':
          'Können Sie das Gerät ohne obligatorisches Online-Konto nutzen?',
      'q_account_required_hint':
          'Pflichtkonten ermöglichen dem Hersteller Werbe-Tracking und das Speichern Ihrer Sehgewohnheiten. Ein kontoloser Betrieb schützt Ihre Privatsphäre.',
      'q_tracking_disabled_text':
          'Können Sie Werbe- und Tracking-Funktionen vollständig deaktivieren?',
      'q_tracking_disabled_hint':
          'Smart-TVs sammeln oft Daten über Ihre Sehgewohnheiten. Suchen Sie nach Datenschutzoptionen.',
      'q_local_mode_text':
          'Können Sie das Gerät über HDMI oder lokale Quellen ohne Internetverbindung nutzen?',
      'q_local_mode_hint':
          'Offline-Betrieb schützt Ihre Nutzungsdaten vor Übertragung an den Hersteller.',
      'q_data_collection_text':
          'Bleiben Ihre Temperatur-Historien und Zeitpläne auf dem Gerät (keine Übertragung an den Hersteller)?',
      'q_data_collection_hint':
          'Historien können Anwesenheitsmuster und Lebensgewohnheiten offenbaren. Lokale Speicherung schützt vor unerwünschter Auswertung.',
      'q_offline_control_text':
          'Können Sie das Thermostat auch offline betreiben (ohne Internet)?',
      'q_offline_control_hint':
          'Offline-Betrieb oder lokale Automatisierung schützt Ihre Daten vor Cloud-Zugriff.',
      'q_family_access_text':
          'Können Sie steuern, wer die Heizung anpassen darf (z. B. nur Gäste einschränken)?',
      'q_family_access_hint':
          'Haushaltsmitglieder sollten Kontrolle haben, ohne dass Besucher alles ändern können.',
      'q_local_control_text':
          'Können Automatisierungen lokal ohne Internetverbindung erfolgen?',
      'q_local_control_hint':
          'Lokale Ausführung von Szenen und Zeitplänen schützt Ihre Privatsphäre besser.',
      'q_usage_tracking_text':
          'Haben Sie die Erfassung von Schaltmustern und Nutzungszeiten durch den Hersteller deaktiviert oder eingeschränkt?',
      'q_usage_tracking_hint':
          'Nutzungsmuster können Ihre Anwesenheit und Gewohnheiten offenbaren. Prüfen Sie die Datenschutzeinstellungen der App.',
      'q_offline_fallback_text':
          'Funktionieren die Geräte noch, wenn die Internet- oder App-Verbindung ausfällt?',
      'q_offline_fallback_hint':
          'Zuverlässige lokale Funktion ist wichtig für alltägliche Nutzung und Privatsphäre.',
      'q_offline_unlock_text':
          'Können Sie das Schloss auch offline (z. B. mit Code oder Schlüssel) öffnen?',
      'q_offline_unlock_hint':
          'Backup-Optionen verhindern Aussperrung bei Internet- oder Stromausfällen.',
      'q_access_logging_text':
          'Können Sie nachvollziehen, wer wann das Schloss geöffnet hat?',
      'q_access_logging_hint':
          'Ein Zugriffsverlauf ermöglicht Ihnen, verdächtige Aktivitäten zu erkennen.',
      'q_two_factor_text':
          'Ist Zwei-Faktor-Authentifizierung (2FA) für das Sperr-Konto verfügbar?',
      'q_two_factor_hint':
          'BSI-Empfehlung: 2FA schützt Ihr Konto vor unbefugtem Fernzugriff auf das Schloss.',
      'q_map_privacy_text':
          'Werden die erstellten Grundrisse ausschließlich lokal auf dem Gerät gespeichert?',
      'q_map_privacy_hint':
          'Grundrisse Ihres Hauses sind sensible Informationen und sollten nicht an den Hersteller übermittelt werden.',
      'q_cloud_required_text':
          'Funktioniert die Grundriss-Navigation auch ohne Cloud-Verbindung?',
      'q_cloud_required_hint':
          'Geräte mit lokaler Navigation sind datenschutzfreundlicher, da keine Raumdaten in die Cloud übertragen werden.',
      'q_vision_data_text':
          'Wenn der Roboter Kameras nutzt: Werden die Kamerabilder ausschließlich lokal für die Navigation verwendet (kein Speichern oder Übertragen)?',
      'q_vision_data_hint':
          'Kamerabilder sollten nur lokal für die Navigation verarbeitet und weder gespeichert noch an den Hersteller gesendet werden.',
      'q_parental_control_text':
          'Gibt es Elternkontroll-Funktionen zur Verwaltung des Spielzeugs?',
      'q_parental_control_hint':
          'Elternkontrolle sollte ermöglichen, Kontakte und Funktionen zu beschränken.',
      'q_child_data_limits_text':
          'Können Sie einschränken, welche persönlichen Daten das Spielzeug sammelt?',
      'q_child_data_limits_hint':
          'Kinder-spezifische Geräte sollten minimale Datenmenge erfassen und speichern.',
      'q_recording_disable_text':
          'Können Sie Audio- und Videoaufnahmen auf dem Gerät deaktivieren?',
      'q_recording_disable_hint':
          'BSI-Empfehlung: Aufnahmen von Kindern sollten nur mit expliziter Kontrolle möglich sein.',
      'q_health_sharing_text':
          'Können Sie steuern, welche Drittanbieter Zugriff auf Ihre Gesundheitsdaten haben?',
      'q_health_sharing_hint':
          'Gesundheitsdaten sind sensibel. Nur autorisierte Apps sollten Zugriff erhalten.',
      'q_location_tracking_text':
          'Können Sie Standortverfolgung deaktivieren, wenn Sie sie nicht benötigen?',
      'q_location_tracking_hint':
          'GPS-Tracking verbraucht Akku und kann Ihre Bewegungsmuster offenbaren.',
      'q_expert_data_retention_duration_text':
          'Ist die Aufbewahrungsdauer Ihrer personenbezogenen Daten konkret festgelegt und auf das Notwendige begrenzt?',
      'q_expert_data_retention_duration_hint':
          'Inspiriert durch CMU IoT Security & Privacy Label und Unboxing.IoT.Privacy: kurze, klare Speicherfristen reduzieren Risiken.',
      'q_expert_access_control_granular_text':
          'Können Sie Zugriffsrechte granular steuern (Rollen, getrennte Konten, keine geteilten Standard-Logins)?',
      'q_expert_access_control_granular_hint':
          'Granulare Zugriffskontrolle senkt das Risiko unbefugter Einsicht und Fehlbedienung.',
      'q_expert_third_party_sharing_limited_text':
          'Ist die Weitergabe an Dritte deaktiviert oder klar auf notwendige Dienste begrenzt?',
      'q_expert_third_party_sharing_limited_hint':
          'Prüfen Sie in Datenschutz- und Kontoeinstellungen, ob Daten an Werbe-, Analyse- oder Partnerdienste fließen.',
      'q_expert_data_sale_disabled_text':
          'Ist der Verkauf Ihrer Daten ausgeschlossen (oder aktiv deaktiviert, falls möglich)?',
      'q_expert_data_sale_disabled_hint':
          'Eine ausdrückliche "kein Datenverkauf"-Option ist ein starkes Datenschutzsignal.',
      'q_expert_update_support_window_text':
          'Ist bekannt, wie lange der Hersteller Sicherheitsupdates garantiert?',
      'q_expert_update_support_window_hint':
          'Eine transparente Update-Zusage reduziert langfristige Sicherheits- und Privatsphärerisiken.',
      'q_expert_vulnerability_process_text':
          'Gibt es einen dokumentierten Prozess zur Meldung und Behebung von Sicherheitslücken?',
      'q_expert_vulnerability_process_hint':
          'Bevorzugen Sie Hersteller mit Responsible-Disclosure- oder Security-Contact-Informationen.',
      'q_expert_offline_functionality_text':
          'Bleibt das Gerät auch mit eingeschränkter Internetverbindung sinnvoll nutzbar?',
      'q_expert_offline_functionality_hint':
          'Mehr Offline-Funktionalität bedeutet oft weniger laufende Datenübertragung in die Cloud.',
      'q_expert_bystander_transparency_text':
          'Werden Betroffene im Umfeld transparent informiert (z. B. Sichtbarkeit, Hinweise, klare Aufnahmeanzeige)?',
      'q_expert_bystander_transparency_hint':
          'Das adressiert Bystander-Privacy und wurde in Unboxing.IoT.Privacy als zentrale Herausforderung hervorgehoben.',
      'q_expert_child_data_protection_text':
          'Sind Schutzmaßnahmen für Kinderdaten aktiv (Minimierung, keine Profilbildung, restriktive Freigaben)?',
      'q_expert_child_data_protection_hint':
          'Geräte in kinderbezogenen Kontexten brauchen besonders strenge Datenschutzvorgaben.',
      'q_expert_access_revocation_text':
          'Können digitale Schlüssel/Zugriffe schnell und einzeln widerrufen werden?',
      'q_expert_access_revocation_hint':
          'Schneller Widerruf ist zentral, wenn Geräte geteilt oder Nutzer gewechselt werden.',
      'q_expert_sensitive_inference_controls_text':
          'Sind Funktionen zur Ableitung sensibler Gesundheits-/Verhaltensprofile eingeschränkt oder deaktivierbar?',
      'q_expert_sensitive_inference_controls_hint':
          'Inferenzkontrolle reduziert Risiken durch sekundäre Nutzung sensibler Daten.',
      // ── Action titles & descriptions ─────────────────────────────────────────
      'a_password_title': 'Standard-Passwort ändern',
      'a_password_desc':
          'Ersetzen Sie das voreingestellte Passwort durch ein starkes, einzigartiges Passwort. Nutzen Sie einen Passwortmanager.',
      'a_updates_title': 'Automatische Updates aktivieren',
      'a_updates_desc':
          'Aktivieren Sie automatische Sicherheits-Updates in den Geräte- oder App-Einstellungen.',
      'a_network_title': 'Separates IoT-WLAN einrichten',
      'a_network_desc':
          'Richten Sie ein eigenes WLAN für Smart-Home-Geräte ein, z. B. über die Gastnetz-Funktion Ihres Routers.',
      'a_informed_title': 'Haushaltsmitglieder informieren',
      'a_informed_desc':
          'Informieren Sie alle Bewohner: welche Daten das Gerät erfasst, wer Zugriff hat und wie es sich deaktivieren lässt.',
      'a_permissions_title': 'App-Berechtigungen einschränken',
      'a_permissions_desc':
          'Prüfen Sie in den Smartphone-Einstellungen die Berechtigungen der zugehörigen App und deaktivieren Sie nicht benötigte.',
      'a_camera_consent_title': 'Kameraausrichtung mit Bewohnern abstimmen',
      'a_camera_consent_desc':
          'Holen Sie das Einverständnis aller Betroffenen ein. Die Kamera darf keine Bereiche ohne Zustimmung erfassen.',
      'a_mic_active_title': 'Mikrofon bei Nichtnutzung deaktivieren',
      'a_mic_active_desc':
          'Nutzen Sie den physischen Stummschalter oder deaktivieren Sie das Mikrofon in den Einstellungen.',
      'a_sensor_frequency_title': 'Messintervall reduzieren',
      'a_sensor_frequency_desc':
          'Verringern Sie, wenn möglich, die Messfrequenz des Sensors. Weniger häufige Messungen erzeugen weniger Verhaltensdaten.',
      'a_sensor_data_deletion_title': 'Alte Messwerte löschen',
      'a_sensor_data_deletion_desc':
          'Prüfen Sie Aufbewahrungsfristen in App oder Weboberfläche und aktivieren Sie automatische Löschung oder löschen Sie ältere Daten regelmäßig manuell.',
      'a_sensor_granularity_title': 'Daten weniger detailliert anzeigen',
      'a_sensor_granularity_desc':
          'Stellen Sie, wenn möglich, eine gröbere Anzeige oder Auswertung ein, zum Beispiel Tageswerte statt Minutenwerte.',
      'a_sensor_local_title': 'Lokale Verarbeitung bevorzugen',
      'a_sensor_local_desc':
          'Prüfen Sie, ob sich Cloud-Synchronisation deaktivieren oder eine lokale Speicherung aktivieren lässt, damit Messdaten nicht an den Hersteller übertragen werden.',
      'a_voice_history_title': 'Sprachaufzeichnungen löschen',
      'a_voice_history_desc':
          'BSI-Empfehlung: Löschen Sie Sprachaufzeichnungen regelmäßig und deaktivieren Sie die Speicherung von Sprachverlauf, falls die Option verfügbar ist.',
      'a_voice_local_title': 'Lokale Sprachverarbeitung aktivieren',
      'a_voice_local_desc':
          'Aktivieren Sie lokale Sprachverarbeitung, falls verfügbar. Falls nicht verfügbar, minimieren Sie Cloud-Speicherung von Sprachdaten.',
      'a_skills_permissions_title': 'Skills/Fähigkeiten überprüfen',
      'a_skills_permissions_desc':
          'Überprüfen Sie, welche Drittanbieter-Skills Zugriff haben. Deaktivieren Sie unnötige Skills.',
      'a_video_encryption_title': 'WLAN-Verschlüsselung prüfen',
      'a_video_encryption_desc':
          'BSI-Empfehlung: Verwenden Sie WPA2 oder WPA3 für Ihr Heimnetz. WEP und WPA sind veraltet.',
      'a_video_storage_title': 'Aufnahmen lokal speichern',
      'a_video_storage_desc':
          'Stellen Sie, wenn möglich, lokale Speicherung ein. Falls nur Cloud-Speicherung möglich ist, reduzieren Sie die Aufbewahrungsdauer und löschen Sie Aufnahmen regelmäßig.',
      'a_sharing_restrictions_title': 'Kamera-Zugriffe einschränken',
      'a_sharing_restrictions_desc':
          'Entfernen Sie in der App alle unnötigen Freigaben und erlauben Sie Live-View/Aufnahmen nur für benötigte Konten.',
      'a_motion_detection_title':
          'Bewegungserkennung bei Anwesenheit deaktivieren',
      'a_motion_detection_desc':
          'Deaktivieren Sie Bewegungserkennung, wenn Personen zu Hause sind, oder setzen Sie einen Zeitplan, der sie nur in Abwesenheitszeiten aktiviert.',
      'a_account_required_title': 'Kontopflicht datenschutzarm umsetzen',
      'a_account_required_desc':
          'Falls kein kontoloser Betrieb möglich ist, verwenden Sie ein separates Konto mit minimalen Profildaten und deaktivieren Sie personalisierte Dienste.',
      'a_tracking_disabled_title': 'Tracking und Werbung deaktivieren',
      'a_tracking_disabled_desc':
          'Deaktivieren Sie in den Datenschutzoptionen Tracking, personalisierte Werbung und optionale Telemetrie.',
      'a_local_mode_title': 'Offline-Nutzung bevorzugen',
      'a_local_mode_desc':
          'Nutzen Sie das Gerät primär über lokale Quellen (z. B. HDMI), um Datenübertragung an den Hersteller zu reduzieren.',
      'a_data_collection_title': 'Historien-Upload deaktivieren',
      'a_data_collection_desc':
          'Deaktivieren Sie in der Thermostat-App die Übertragung von Temperaturhistorien an den Hersteller und verkürzen Sie die Speicherdauer.',
      'a_offline_control_title': 'Lokale Steuerung einrichten',
      'a_offline_control_desc':
          'Konfigurieren Sie lokale Zeitpläne und eine Bedienung ohne Cloud-Abhängigkeit, falls das Gerät dies unterstützt.',
      'a_family_access_title': 'Zugriffsrechte für Haushaltsmitglieder trennen',
      'a_family_access_desc':
          'Richten Sie getrennte Rollen/Konten ein, damit nur berechtigte Personen Änderungen an der Heizung vornehmen können.',
      'a_local_control_title': 'Lokale Automatisierungen aktivieren',
      'a_local_control_desc':
          'Nutzen Sie lokale Szenen/Zeitpläne statt Cloud-Automatisierungen, sofern verfügbar.',
      'a_usage_tracking_title': 'Nutzungs-Tracking deaktivieren',
      'a_usage_tracking_desc':
          'Schalten Sie in den App-Einstellungen Analyse-, Telemetrie- und Nutzungsdatenerfassung aus.',
      'a_offline_fallback_title': 'Offline-Notbetrieb sicherstellen',
      'a_offline_fallback_desc':
          'Prüfen Sie lokale Schalter/Taster und richten Sie Fallback-Bedienung ein, damit das Gerät auch ohne Internet nutzbar bleibt.',
      'a_offline_unlock_title': 'Offline-Zugang absichern',
      'a_offline_unlock_desc':
          'Richten Sie einen physischen Schlüssel oder einen Notfall-Code ein und testen Sie den Zugriff bei Ausfall der Internetverbindung.',
      'a_access_logging_title': 'Zugriffsprotokoll aktivieren',
      'a_access_logging_desc':
          'Aktivieren Sie Protokollierung und Benachrichtigungen für Schlossöffnungen, damit unbefugte Zugriffe auffallen.',
      'a_two_factor_title': 'Zwei-Faktor-Authentifizierung aktivieren',
      'a_two_factor_desc':
          'BSI-Empfehlung: Aktivieren Sie 2FA für Ihr Schlosskonto um Remote-Zugriffe zu schützen.',
      'a_map_privacy_title': 'Cloud-Grundrissspeicherung deaktivieren',
      'a_map_privacy_desc':
          'Stellen Sie die Speicherung auf lokal um und deaktivieren Sie Cloud-Backups von Grundrissen, falls diese Option verfügbar ist.',
      'a_cloud_required_title': 'Cloud-Abhängigkeit reduzieren',
      'a_cloud_required_desc':
          'Aktivieren Sie lokale Navigation oder Offline-Modus, falls verfügbar. Wenn nicht verfügbar, bewerten Sie einen Wechsel zu einem datenschutzfreundlicheren Modell.',
      'a_vision_data_title': 'Kameradaten nur lokal verarbeiten',
      'a_vision_data_desc':
          'Deaktivieren Sie Upload/Speicherung von Kamerabildern und nutzen Sie, wenn möglich, ausschließlich lokale Navigationsverarbeitung.',
      'a_parental_control_title': 'Elternkontrolle einrichten',
      'a_parental_control_desc':
          'Aktivieren Sie Elternkontrolle mit PIN und beschränken Sie Kontakte, Funktionen und Freigaben auf das Notwendige.',
      'a_child_data_limits_title': 'Datenerfassung minimieren',
      'a_child_data_limits_desc':
          'Deaktivieren Sie optionale Profildaten und erfassen Sie nur die für die Kernfunktion erforderlichen Kinderdaten.',
      'a_recording_disable_title': 'Audio/Video-Aufnahmen deaktivieren',
      'a_recording_disable_desc':
          'Schalten Sie Aufnahmefunktionen standardmäßig aus und aktivieren Sie sie nur bei konkretem Bedarf kurzzeitig.',
      'a_health_sharing_title': 'Gesundheitsdaten-Freigaben einschränken',
      'a_health_sharing_desc':
          'Entziehen Sie unnötigen Drittanbieter-Apps den Zugriff auf Gesundheitsdaten in App- und Kontoeinstellungen.',
      'a_location_tracking_title': 'Standortfreigabe reduzieren',
      'a_location_tracking_desc':
          'Deaktivieren Sie Standortverfolgung außerhalb aktiver Nutzung oder erlauben Sie sie nur beim Verwenden der App.',
      'a_expert_data_retention_duration_title': 'Speicherfristen festlegen',
      'a_expert_data_retention_duration_desc':
          'Setzen Sie klare kurze Aufbewahrungsfristen in den Einstellungen und löschen Sie Altbestände regelmäßig.',
      'a_expert_access_control_granular_title':
          'Granulare Rollen und Konten einführen',
      'a_expert_access_control_granular_desc':
          'Nutzen Sie getrennte Konten statt Shared-Logins und vergeben Sie nur die minimal nötigen Rechte.',
      'a_expert_third_party_sharing_limited_title': 'Drittweitergabe begrenzen',
      'a_expert_third_party_sharing_limited_desc':
          'Deaktivieren Sie Partner-, Werbe- und Analyseweitergaben in Datenschutz- und Kontoeinstellungen.',
      'a_expert_data_sale_disabled_title': 'Datenverkauf widersprechen',
      'a_expert_data_sale_disabled_desc':
          'Aktivieren Sie vorhandene "Do not sell"-Optionen bzw. widersprechen Sie der Datenweitergabe für Vermarktung.',
      'a_expert_update_support_window_title': 'Update-Zusage verifizieren',
      'a_expert_update_support_window_desc':
          'Prüfen Sie die offizielle Update-Policy des Herstellers und planen Sie bei fehlender Zusage einen Gerätewechsel ein.',
      'a_expert_vulnerability_process_title':
          'Hersteller-Sicherheitsprozess prüfen',
      'a_expert_vulnerability_process_desc':
          'Bevorzugen Sie Hersteller mit klarer Security-Kontaktstelle und Responsible-Disclosure-Prozess.',
      'a_expert_offline_functionality_title':
          'Offline-Funktionalität priorisieren',
      'a_expert_offline_functionality_desc':
          'Aktivieren Sie lokale Betriebsmodi und minimieren Sie Cloud-Pflichtfunktionen, sofern das Gerät dies erlaubt.',
      'a_expert_bystander_transparency_title':
          'Transparenzhinweise für Umfeld ergänzen',
      'a_expert_bystander_transparency_desc':
          'Sorgen Sie für sichtbare Hinweise, Aufnahmeanzeigen und klare Information für betroffene Personen im Umfeld.',
      'a_expert_child_data_protection_title': 'Kinderdatenschutz verschärfen',
      'a_expert_child_data_protection_desc':
          'Aktivieren Sie kindgerechte Profile, minimieren Sie Datenerhebung und deaktivieren Sie Profilbildung/Weitergabe.',
      'a_expert_access_revocation_title':
          'Schnellen Zugriffswiderruf einrichten',
      'a_expert_access_revocation_desc':
          'Stellen Sie sicher, dass digitale Schlüssel einzeln und sofort widerrufen werden können, z. B. bei Geräteverlust.',
      'a_expert_sensitive_inference_controls_title':
          'Inferenzfunktionen einschränken',
      'a_expert_sensitive_inference_controls_desc':
          'Deaktivieren Sie Funktionen, die sensible Gesundheits- oder Verhaltensprofile ableiten, sofern diese nicht zwingend benötigt werden.',
      'a_dont_know_title': 'Geräteeinstellungen besser kennenlernen',
      'a_dont_know_desc':
          'Mindestens eine Frage wurde mit "Weiß ich nicht" beantwortet. Prüfen Sie die Einstellungen und Dokumentation Ihres Geräts, damit Sie Risiken künftig gezielt reduzieren können.',
      // ── Scoring factor short labels ──────────────────────────────────────────
      'sl_base_risk': 'Grundrisiko des Gerätetyps',
      'sl_child_room_bonus': 'Erhöhte Sensibilität: Kinderzimmer',
      'sl_password': 'Standard-Passwort nicht geändert',
      'sl_updates': 'Automatische Updates nicht aktiv',
      'sl_network': 'Kein separates IoT-WLAN eingerichtet',
      'sl_informed': 'Haushaltsmitglieder nicht informiert',
      'sl_permissions': 'App-Berechtigungen nicht reduziert',
      'sl_camera_consent': 'Kein Einverständnis für Kamerabereich',
      'sl_mic_active': 'Mikrofon nicht bei Nichtnutzung deaktiviert',
      'sl_sensor_frequency': 'Messintervall nicht reduziert',
      'sl_sensor_data_deletion': 'Alte Messwerte nicht gelöscht',
      'sl_sensor_granularity': 'Daten zu fein granular gespeichert',
      'sl_sensor_local': 'Daten in die Cloud übertragen',
      'sl_voice_history': 'Sprachaufnahmen nicht löschbar',
      'sl_voice_local': 'Keine lokale Sprachverarbeitung',
      'sl_skills_permissions': 'Skills nicht regelmäßig geprüft',
      'sl_video_encryption': 'Videoübertragung nicht verschlüsselt',
      'sl_video_storage': 'Aufnahmen nur in Anbieter-Cloud',
      'sl_sharing_restrictions': 'Zugriff auf Aufnahmen nicht kontrolliert',
      'sl_motion_detection': 'Bewegungserkennung immer aktiv',
      'sl_account_required': 'Pflichtkonto beim Hersteller nötig',
      'sl_tracking_disabled': 'Werbe-Tracking nicht deaktiviert',
      'sl_local_mode': 'Kein Offline-Betrieb möglich',
      'sl_data_collection': 'Temperaturverlauf an Hersteller übertragen',
      'sl_offline_control': 'Kein Offline-Betrieb möglich',
      'sl_family_access': 'Zugriff nicht einschränkbar',
      'sl_local_control': 'Automatisierungen nur mit Internet',
      'sl_usage_tracking': 'Schaltmuster vom Hersteller erfasst',
      'sl_offline_fallback': 'Gerät offline nicht nutzbar',
      'sl_offline_unlock': 'Kein Offline-Öffnen möglich',
      'sl_access_logging': 'Kein Zugriffsprotokoll verfügbar',
      'sl_two_factor': '2-Faktor-Authentifizierung fehlt',
      'sl_map_privacy': 'Grundriss an Hersteller übertragen',
      'sl_cloud_required': 'Navigation nur mit Cloud möglich',
      'sl_vision_data': 'Kamerabilder gespeichert oder übertragen',
      'sl_parental_control': 'Elternkontrolle nicht eingerichtet',
      'sl_child_data_limits': 'Datenmenge nicht eingeschränkt',
      'sl_recording_disable': 'Aufnahmen nicht deaktivierbar',
      'sl_health_sharing': 'Gesundheitsdaten mit Dritten geteilt',
      'sl_location_tracking': 'Standortverfolgung aktiv',
      'sl_expert_data_retention_duration': 'Aufbewahrungsdauer unklar/zu lang',
      'sl_expert_access_control_granular': 'Granulare Zugriffskontrolle fehlt',
      'sl_expert_third_party_sharing_limited':
          'Weitergabe an Dritte nicht begrenzt',
      'sl_expert_data_sale_disabled': 'Datenverkauf nicht ausgeschlossen',
      'sl_expert_update_support_window':
          'Garantierter Update-Zeitraum unbekannt',
      'sl_expert_vulnerability_process':
          'Schwachstellenprozess nicht dokumentiert',
      'sl_expert_offline_functionality':
          'Sinnvoller Betrieb ohne Internet nicht möglich',
      'sl_expert_bystander_transparency':
          'Transparenz für Betroffene im Umfeld fehlt',
      'sl_expert_child_data_protection':
          'Schutzmaßnahmen für Kinderdaten fehlen',
      'sl_expert_access_revocation': 'Einzelner Zugriffswiderruf nicht möglich',
      'sl_expert_sensitive_inference_controls':
          'Kontrollen gegen sensible Inferenz fehlen',
      // ── Inherent risk hints ──────────────────────────────────────────────────
      'risk_hint_camera':
          'Sie haben alle Fragen positiv beantwortet. Dennoch bleibt das Grundrisiko bei Kameras höher, weil sie besonders sensible Beobachtungsdaten erfassen und bei Fehlkonfiguration zur Überwachung genutzt werden können.',
      'risk_hint_mic':
          'Sie haben alle Fragen positiv beantwortet. Dennoch bleibt das Grundrisiko bei Geräten mit Mikrofon erhöht, da Sprachdaten sehr sensibel sind und Fehlaktivierungen bzw. Cloud-Verarbeitung weiterhin Risiken bergen.',
      'risk_hint_lock':
          'Sie haben alle Fragen positiv beantwortet. Dennoch bleibt bei smarten Schlössern ein erhöhtes Grundrisiko, da ein möglicher Missbrauch direkt den physischen Zugang zur Wohnung betrifft.',
      'risk_hint_child_room':
          'Sie haben alle Fragen positiv beantwortet. Dennoch bleibt im Kinderzimmer ein erhöhtes Grundrisiko, da dort häufig besonders sensible Daten zu Kindern und ihrem Alltag betroffen sind.',
      'risk_hint_generic':
          'Sie haben alle Fragen positiv beantwortet. Das Gerät bleibt trotzdem im mittleren/hohen Bereich, weil bereits die Art des Geräts sensible Nutzungs- und Verhaltensdaten offenlegen kann.',
      // ── General recommendations ──────────────────────────────────────────────
      'gen_rec_0':
          'Richten Sie ein separates WLAN nur für Smart-Home-Geräte ein (z. B. Gastnetz Ihres Routers).',
      'gen_rec_1':
          'Nutzen Sie einen Passwortmanager und vergeben Sie für jedes Gerät ein einzigartiges, starkes Passwort.',
      'gen_rec_2':
          'Aktivieren Sie Mehrfaktor-Authentifizierung (MFA) für alle Hersteller-Konten.',
      'gen_rec_3':
          'Legen Sie im Haushalt fest, wer für Updates, Backups und Konten verantwortlich ist.',
      'gen_rec_4':
          'Überprüfen Sie regelmäßig (mind. 1× pro Quartal) alle Zugriffsberechtigungen und Konten.',
      'gen_rec_5':
          'Entsorgen Sie alte Geräte datenschutzgerecht: Werksreset durchführen und aus der Hersteller-Cloud austragen.',
      'gen_rec_6':
          'Nutzen Sie ein Konsens-Protokoll, bevor Sie neue Geräte kaufen - beziehen Sie alle Haushaltsmitglieder ein.',
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
      'skippedDevicesHint':
          '{count} devices skipped because the questionnaire was not completed.',
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
      // ── Rooms ───────────────────────────────────────────────────────────────
      'room_living': 'Living room',
      'room_kitchen': 'Kitchen',
      'room_bedroom': 'Bedroom',
      'room_child_bedroom': "Child's bedroom",
      'room_bathroom': 'Bathroom',
      'room_office': 'Office',
      'room_hallway': 'Hallway / Entrance',
      'room_garden': 'Garden / Outdoor area',
      'room_basement': 'Basement / Pantry',
      'room_whole_home': 'Entire home',
      // ── Device names ─────────────────────────────────────────────────────────
      'device_simple_sensor': 'Basic sensor (e.g., motion or door sensor)',
      'device_humidity_sensor': 'Humidity sensor',
      'device_temperature_sensor': 'Temperature sensor',
      'device_light_sensor': 'Light sensor',
      'device_smart_speaker': 'Smart speaker / voice assistant',
      'device_smart_display': 'Smart display (e.g., Nest Hub)',
      'device_smart_tv': 'Smart TV',
      'device_indoor_camera': 'Smart indoor camera',
      'device_outdoor_camera': 'Smart outdoor camera',
      'device_doorbell_camera': 'Smart doorbell with camera',
      'device_baby_monitor': 'Baby monitor / baby camera',
      'device_robot_vacuum': 'Robot vacuum',
      'device_smart_fridge': 'Smart fridge',
      'device_smart_oven': 'Smart oven / stove',
      'device_smart_coffee': 'Smart coffee machine',
      'device_smart_washing': 'Smart washer / dryer',
      'device_smart_thermostat': 'Smart thermostat / heating control',
      'device_smart_plug': 'Smart plug',
      'device_smart_light': 'Smart lighting',
      'device_smart_lock': 'Smart door lock',
      'device_smart_blind': 'Smart blind / shutter',
      'device_fitness_tracker': 'Fitness tracker / smartwatch',
      'device_smart_toy': 'Smart toy',
      'device_smart_router': 'Smart router / mesh system',
      'device_smart_hub': 'Smart home hub (e.g., Homey, Home Assistant)',
      'device_smart_meter': 'Intelligent electricity meter / smart meter',
      'device_smart_irrigation': 'Smart irrigation system',
      'device_smart_scale': 'Smart scale',
      'device_smart_printer': 'Smart printer',
      // ── Question texts & hints ───────────────────────────────────────────────
      'q_password_text':
          'Have you changed the default password of the device or its linked account?',
      'q_password_hint':
          'Default passwords are often publicly known and easy to crack.',
      'q_updates_text':
          'Are automatic security updates enabled for the device?',
      'q_updates_hint':
          'Updates close known security vulnerabilities promptly.',
      'q_network_text':
          'Is the device connected to a separate smart home or IoT Wi-Fi network?',
      'q_network_hint':
          'A dedicated network for smart devices protects your main home network.',
      'q_informed_text':
          'Are all people in the household informed about this device and its function?',
      'q_informed_hint':
          'All household members should know what data the device captures.',
      'q_permissions_text':
          'Have you disabled unnecessary app permissions (e.g., location, contacts)?',
      'q_permissions_hint':
          'Only permissions that are truly needed should be enabled.',
      'q_mic_active_text':
          'Do you deactivate the microphone when you are not actively using it?',
      'q_mic_active_hint':
          'Smart speakers and devices with microphones can be activated unintentionally.',
      'q_camera_consent_text':
          'Does the camera only record areas for which everyone affected has given their consent?',
      'q_camera_consent_hint':
          'Cameras in communal or private areas require the consent of all residents.',
      'q_sensor_frequency_text':
          'Can you reduce the sensor measurement interval (e.g., measure less frequently)?',
      'q_sensor_frequency_hint':
          'A lower measurement frequency produces less data and limits inferences about your behavior.',
      'q_sensor_data_deletion_text':
          'Are older measurement values deleted automatically or on request?',
      'q_sensor_data_deletion_hint':
          'Old historical data should not be stored permanently. Check retention settings.',
      'q_sensor_granularity_text':
          'Does the system show sensor data only in aggregated form (e.g., daily instead of minute values)?',
      'q_sensor_granularity_hint':
          'Less granular views help prevent inferences about precise presence or behavior patterns.',
      'q_sensor_local_text':
          'Is measurement data processed and stored locally without being transferred to the cloud?',
      'q_sensor_local_hint':
          'Local processing prevents the vendor from accessing your measurement data.',
      'q_voice_history_text':
          'Can you delete voice recordings from device history or disable this feature?',
      'q_voice_history_hint':
          'BSI recommendation: Minimize recording retention or delete recordings regularly.',
      'q_voice_local_text':
          'Is voice processing performed partly on the device locally?',
      'q_voice_local_hint':
          'Local processing reduces the amount of data sent to the cloud.',
      'q_skills_permissions_text':
          'Do you regularly review which skills have access to your account?',
      'q_skills_permissions_hint':
          'Third-party skills can access sensitive data. Enable only necessary skills.',
      'q_video_encryption_text':
          'Is video recording and transmission encrypted end-to-end?',
      'q_video_encryption_hint':
          'BSI recommendation: Encrypted connections prevent interception and data theft in transit.',
      'q_video_storage_text':
          'Are recordings stored locally (not only in the vendor cloud)?',
      'q_video_storage_hint':
          'Local storage gives you more control over your data; cloud-only storage depends on vendor security.',
      'q_sharing_restrictions_text':
          'Can you control who can access live view and recordings?',
      'q_sharing_restrictions_hint':
          'You should be able to precisely control access to video recordings.',
      'q_motion_detection_text':
          'Can you disable or schedule motion detection when you are at home?',
      'q_motion_detection_hint':
          'BSI recommendation: Avoiding unnecessary recordings reduces data volume and misuse risk.',
      'q_account_required_text':
          'Can you use the device without a mandatory online account?',
      'q_account_required_hint':
          'Mandatory accounts enable ad tracking and storage of viewing habits. Account-free use protects privacy.',
      'q_tracking_disabled_text':
          'Can you completely disable advertising and tracking features?',
      'q_tracking_disabled_hint':
          'Smart TVs often collect viewing habit data. Look for privacy settings.',
      'q_local_mode_text':
          'Can you use the device via HDMI or local sources without internet?',
      'q_local_mode_hint':
          'Offline use protects usage data from being sent to the vendor.',
      'q_data_collection_text':
          'Do temperature history and schedules stay on-device (not sent to the vendor)?',
      'q_data_collection_hint':
          'History can reveal presence patterns and habits. Local storage reduces unwanted analysis.',
      'q_offline_control_text':
          'Can you operate the thermostat offline (without internet)?',
      'q_offline_control_hint':
          'Offline operation or local automation protects data from cloud access.',
      'q_family_access_text':
          'Can you control who may adjust heating (e.g., restrict guests)?',
      'q_family_access_hint':
          'Household members should have control without visitors changing everything.',
      'q_local_control_text': 'Can automations run locally without internet?',
      'q_local_control_hint':
          'Local scenes and schedules protect your privacy better.',
      'q_usage_tracking_text':
          'Have you disabled or limited vendor collection of switching patterns and usage times?',
      'q_usage_tracking_hint':
          'Usage patterns can reveal presence and habits. Check app privacy settings.',
      'q_offline_fallback_text':
          'Do devices still work if internet or app connection fails?',
      'q_offline_fallback_hint':
          'Reliable local operation is important for daily use and privacy.',
      'q_offline_unlock_text':
          'Can you unlock the lock offline (e.g., with code or key)?',
      'q_offline_unlock_hint':
          'Backup options prevent lockout during internet or power outages.',
      'q_access_logging_text': 'Can you track who opened the lock and when?',
      'q_access_logging_hint':
          'An access log helps you detect suspicious activity.',
      'q_two_factor_text':
          'Is two-factor authentication (2FA) available for the lock account?',
      'q_two_factor_hint':
          'BSI recommendation: 2FA protects your account from unauthorized remote access.',
      'q_map_privacy_text':
          'Are created floor plans stored exclusively on the device locally?',
      'q_map_privacy_hint':
          'Home floor plans are sensitive information and should not be sent to the vendor.',
      'q_cloud_required_text':
          'Does floor-plan navigation work without cloud connection?',
      'q_cloud_required_hint':
          'Devices with local navigation are more privacy-friendly because no room data is uploaded.',
      'q_vision_data_text':
          'If the robot uses cameras: are camera images used locally only for navigation (no storing or transfer)?',
      'q_vision_data_hint':
          'Camera images should be processed locally for navigation and neither stored nor sent to the vendor.',
      'q_parental_control_text':
          'Are there parental control features to manage the toy?',
      'q_parental_control_hint':
          'Parental controls should allow restricting contacts and features.',
      'q_child_data_limits_text':
          'Can you limit which personal data the toy collects?',
      'q_child_data_limits_hint':
          'Child-focused devices should collect and store minimal data.',
      'q_recording_disable_text':
          'Can you disable audio and video recording on the device?',
      'q_recording_disable_hint':
          'BSI recommendation: Recordings of children should only be possible with explicit control.',
      'q_health_sharing_text':
          'Can you control which third parties can access your health data?',
      'q_health_sharing_hint':
          'Health data is sensitive. Only authorized apps should have access.',
      'q_location_tracking_text':
          'Can you disable location tracking when not needed?',
      'q_location_tracking_hint':
          'GPS tracking uses battery and can reveal movement patterns.',
      'q_expert_data_retention_duration_text':
          'Is the retention duration for your personal data explicitly defined and limited to what is necessary?',
      'q_expert_data_retention_duration_hint':
          'Inspired by the CMU IoT Security & Privacy Label and Unboxing.IoT.Privacy: short, clear retention periods reduce risk.',
      'q_expert_access_control_granular_text':
          'Can you control access rights granularly (roles, separate accounts, no shared default logins)?',
      'q_expert_access_control_granular_hint':
          'Granular access control reduces the risk of unauthorized access and misuse.',
      'q_expert_third_party_sharing_limited_text':
          'Is third-party sharing disabled or clearly limited to necessary services?',
      'q_expert_third_party_sharing_limited_hint':
          'Check privacy and account settings to see whether data is sent to advertising, analytics, or partner services.',
      'q_expert_data_sale_disabled_text':
          'Is the sale of your data excluded (or actively disabled, where possible)?',
      'q_expert_data_sale_disabled_hint':
          'An explicit "no data sale" option is a strong privacy signal.',
      'q_expert_update_support_window_text':
          'Is it known how long the vendor guarantees security updates?',
      'q_expert_update_support_window_hint':
          'A transparent update commitment reduces long-term security and privacy risks.',
      'q_expert_vulnerability_process_text':
          'Is there a documented process for reporting and fixing vulnerabilities?',
      'q_expert_vulnerability_process_hint':
          'Prefer vendors that provide responsible disclosure policies or clear security contact information.',
      'q_expert_offline_functionality_text':
          'Does the device remain meaningfully usable with limited internet connectivity?',
      'q_expert_offline_functionality_hint':
          'More offline functionality often means less continuous data transfer to the cloud.',
      'q_expert_bystander_transparency_text':
          'Are people nearby transparently informed (for example via visibility, notices, clear recording indicators)?',
      'q_expert_bystander_transparency_hint':
          'This addresses bystander privacy and is highlighted in Unboxing.IoT.Privacy as a key challenge.',
      'q_expert_child_data_protection_text':
          'Are child-data protections active (minimization, no profiling, restrictive sharing)?',
      'q_expert_child_data_protection_hint':
          'Devices in child-related contexts require especially strict privacy safeguards.',
      'q_expert_access_revocation_text':
          'Can digital keys/access rights be revoked quickly and individually?',
      'q_expert_access_revocation_hint':
          'Fast revocation is crucial when devices are shared or users change.',
      'q_expert_sensitive_inference_controls_text':
          'Are features that infer sensitive health or behavior profiles restricted or disableable?',
      'q_expert_sensitive_inference_controls_hint':
          'Inference controls reduce risks from secondary use of sensitive data.',
      // ── Action titles & descriptions ─────────────────────────────────────────
      'a_password_title': 'Change default password',
      'a_password_desc':
          'Replace the default password with a strong, unique password. Use a password manager.',
      'a_updates_title': 'Enable automatic updates',
      'a_updates_desc':
          'Enable automatic security updates in device or app settings.',
      'a_network_title': 'Set up separate IoT Wi-Fi',
      'a_network_desc':
          "Set up a dedicated Wi-Fi network for smart home devices, for example with your router's guest network.",
      'a_informed_title': 'Inform household members',
      'a_informed_desc':
          'Inform all residents about what data the device collects, who has access, and how it can be disabled.',
      'a_permissions_title': 'Restrict app permissions',
      'a_permissions_desc':
          'Check companion-app permissions in phone settings and disable unnecessary ones.',
      'a_camera_consent_title': 'Align camera positioning with residents',
      'a_camera_consent_desc':
          'Obtain consent from everyone affected. The camera must not record areas without consent.',
      'a_mic_active_title': 'Disable microphone when not in use',
      'a_mic_active_desc':
          'Use the physical mute switch or disable the microphone in settings.',
      'a_sensor_frequency_title': 'Reduce measurement interval',
      'a_sensor_frequency_desc':
          'If possible, reduce sensor measurement frequency. Less frequent measurements produce fewer behavior data points.',
      'a_sensor_data_deletion_title': 'Delete old measurement values',
      'a_sensor_data_deletion_desc':
          'Review retention periods in app or web UI and enable auto deletion, or delete older data manually on a regular basis.',
      'a_sensor_granularity_title': 'Show less detailed data',
      'a_sensor_granularity_desc':
          'If possible, switch to less granular display or evaluation, for example daily values instead of minute values.',
      'a_sensor_local_title': 'Prefer local processing',
      'a_sensor_local_desc':
          'Check whether cloud sync can be disabled or local storage enabled so measurement data is not sent to the vendor.',
      'a_voice_history_title': 'Delete voice recordings',
      'a_voice_history_desc':
          'BSI recommendation: Regularly delete voice recordings and disable voice history storage if the option is available.',
      'a_voice_local_title': 'Enable local voice processing',
      'a_voice_local_desc':
          'Enable local voice processing if available. If not, minimize cloud storage of voice data.',
      'a_skills_permissions_title': 'Review skills/integrations',
      'a_skills_permissions_desc':
          'Review which third-party skills have access. Disable unnecessary skills.',
      'a_video_encryption_title': 'Check Wi-Fi encryption',
      'a_video_encryption_desc':
          'BSI recommendation: Use WPA2 or WPA3 on your home network. WEP and WPA are outdated.',
      'a_video_storage_title': 'Store recordings locally',
      'a_video_storage_desc':
          'Configure local storage if possible. If cloud-only storage is unavoidable, shorten the retention period and delete recordings regularly.',
      'a_sharing_restrictions_title': 'Restrict camera access',
      'a_sharing_restrictions_desc':
          'Remove all unnecessary shares in the app and allow live view/recordings only for required accounts.',
      'a_motion_detection_title': 'Disable motion detection when at home',
      'a_motion_detection_desc':
          'Disable motion detection when people are home, or set a schedule that activates it only during absence.',
      'a_account_required_title': 'Minimize privacy impact of required account',
      'a_account_required_desc':
          'If account-free operation is not possible, use a separate account with minimal profile data and disable personalized services.',
      'a_tracking_disabled_title': 'Disable tracking and advertising',
      'a_tracking_disabled_desc':
          'Disable tracking, personalized advertising, and optional telemetry in privacy settings.',
      'a_local_mode_title': 'Prefer offline use',
      'a_local_mode_desc':
          'Use the device primarily via local sources (e.g., HDMI) to reduce data transfer to the vendor.',
      'a_data_collection_title': 'Disable history upload',
      'a_data_collection_desc':
          'Disable transmission of temperature history to the vendor in the thermostat app and shorten the retention period.',
      'a_offline_control_title': 'Set up local control',
      'a_offline_control_desc':
          'Configure local schedules and control without cloud dependency if the device supports it.',
      'a_family_access_title': 'Separate access rights for household members',
      'a_family_access_desc':
          'Set up separate roles/accounts so that only authorized people can adjust the heating.',
      'a_local_control_title': 'Enable local automations',
      'a_local_control_desc':
          'Use local scenes/schedules instead of cloud automations where available.',
      'a_usage_tracking_title': 'Disable usage tracking',
      'a_usage_tracking_desc':
          'Disable analytics, telemetry, and usage data collection in app settings.',
      'a_offline_fallback_title': 'Ensure offline fallback',
      'a_offline_fallback_desc':
          'Check local switches/buttons and set up fallback controls so the device remains usable without internet.',
      'a_offline_unlock_title': 'Secure offline access',
      'a_offline_unlock_desc':
          'Set up a physical key or emergency code and test access when internet is unavailable.',
      'a_access_logging_title': 'Enable access log',
      'a_access_logging_desc':
          'Enable logging and notifications for lock openings so unauthorized access can be detected.',
      'a_two_factor_title': 'Enable two-factor authentication',
      'a_two_factor_desc':
          'BSI recommendation: Enable 2FA for your lock account to protect remote access.',
      'a_map_privacy_title': 'Disable cloud floor-plan storage',
      'a_map_privacy_desc':
          'Switch storage to local and disable cloud backups of floor plans if the option is available.',
      'a_cloud_required_title': 'Reduce cloud dependency',
      'a_cloud_required_desc':
          'Enable local navigation or offline mode if available. If not, consider switching to a more privacy-friendly model.',
      'a_vision_data_title': 'Process camera data locally only',
      'a_vision_data_desc':
          'Disable upload/storage of camera images and use exclusively local navigation processing where possible.',
      'a_parental_control_title': 'Set up parental controls',
      'a_parental_control_desc':
          'Enable parental controls with a PIN and restrict contacts, features, and sharing to what is necessary.',
      'a_child_data_limits_title': 'Minimize data collection',
      'a_child_data_limits_desc':
          'Disable optional profile data and collect only the child data required for core functionality.',
      'a_recording_disable_title': 'Disable audio/video recordings',
      'a_recording_disable_desc':
          'Disable recording features by default and enable them only briefly when specifically needed.',
      'a_health_sharing_title': 'Restrict health data sharing',
      'a_health_sharing_desc':
          'Revoke health data access from unnecessary third-party apps in app and account settings.',
      'a_location_tracking_title': 'Reduce location sharing',
      'a_location_tracking_desc':
          'Disable location tracking outside active use or allow it only while the app is in use.',
      'a_expert_data_retention_duration_title': 'Define retention periods',
      'a_expert_data_retention_duration_desc':
          'Set short, clear retention periods in settings and regularly delete old data.',
      'a_expert_access_control_granular_title':
          'Introduce granular roles and accounts',
      'a_expert_access_control_granular_desc':
          'Use separate accounts instead of shared logins and grant only the minimum necessary permissions.',
      'a_expert_third_party_sharing_limited_title': 'Limit third-party sharing',
      'a_expert_third_party_sharing_limited_desc':
          'Disable partner, advertising, and analytics sharing in privacy and account settings.',
      'a_expert_data_sale_disabled_title': 'Opt out of data sale',
      'a_expert_data_sale_disabled_desc':
          'Enable available "Do not sell" options or object to data sharing for commercial purposes.',
      'a_expert_update_support_window_title': 'Verify update commitment',
      'a_expert_update_support_window_desc':
          "Review the vendor's official update policy and plan a device replacement if no commitment is given.",
      'a_expert_vulnerability_process_title': 'Review vendor security process',
      'a_expert_vulnerability_process_desc':
          'Prefer vendors with a clear security contact and responsible disclosure process.',
      'a_expert_offline_functionality_title':
          'Prioritize offline functionality',
      'a_expert_offline_functionality_desc':
          'Enable local operating modes and minimize mandatory cloud features where the device allows.',
      'a_expert_bystander_transparency_title':
          'Add transparency notices for bystanders',
      'a_expert_bystander_transparency_desc':
          'Provide visible notices, recording indicators, and clear information for people in the surrounding area.',
      'a_expert_child_data_protection_title':
          'Strengthen child data protection',
      'a_expert_child_data_protection_desc':
          'Enable child-appropriate profiles, minimize data collection, and disable profiling/sharing.',
      'a_expert_access_revocation_title': 'Set up rapid access revocation',
      'a_expert_access_revocation_desc':
          'Ensure that digital keys can be revoked individually and immediately, e.g., in case of device loss.',
      'a_expert_sensitive_inference_controls_title':
          'Restrict inference features',
      'a_expert_sensitive_inference_controls_desc':
          'Disable features that infer sensitive health or behavioral profiles unless strictly necessary.',
      'a_dont_know_title': 'Get to know device settings better',
      'a_dont_know_desc':
          "At least one question was answered with \"I don't know\". Review your device settings and documentation to reduce risk more effectively.",
      // ── Scoring factor short labels ──────────────────────────────────────────
      'sl_base_risk': 'Baseline risk of device type',
      'sl_child_room_bonus': "Increased sensitivity: child's bedroom",
      'sl_password': 'Default password not changed',
      'sl_updates': 'Automatic updates not enabled',
      'sl_network': 'No separate IoT Wi-Fi configured',
      'sl_informed': 'Household members not informed',
      'sl_permissions': 'App permissions not reduced',
      'sl_camera_consent': 'No consent for camera-covered area',
      'sl_mic_active': 'Microphone not disabled when unused',
      'sl_sensor_frequency': 'Measurement interval not reduced',
      'sl_sensor_data_deletion': 'Old measurement values not deleted',
      'sl_sensor_granularity': 'Data stored with too much granularity',
      'sl_sensor_local': 'Data transferred to cloud',
      'sl_voice_history': 'Voice recordings not deletable',
      'sl_voice_local': 'No local voice processing',
      'sl_skills_permissions': 'Skills not reviewed regularly',
      'sl_video_encryption': 'Video transmission not encrypted',
      'sl_video_storage': 'Recordings only in vendor cloud',
      'sl_sharing_restrictions': 'Recording access not controlled',
      'sl_motion_detection': 'Motion detection always active',
      'sl_account_required': 'Mandatory vendor account required',
      'sl_tracking_disabled': 'Ad tracking not disabled',
      'sl_local_mode': 'No offline operation possible',
      'sl_data_collection': 'Temperature history sent to vendor',
      'sl_offline_control': 'No offline operation possible',
      'sl_family_access': 'Access cannot be restricted',
      'sl_local_control': 'Automations require internet connection',
      'sl_usage_tracking': 'Switching patterns collected by vendor',
      'sl_offline_fallback': 'Device unusable offline',
      'sl_offline_unlock': 'No offline unlock possible',
      'sl_access_logging': 'No access log available',
      'sl_two_factor': 'Two-factor authentication missing',
      'sl_map_privacy': 'Floor plan transmitted to vendor',
      'sl_cloud_required': 'Navigation only possible via cloud',
      'sl_vision_data': 'Camera images stored or transmitted',
      'sl_parental_control': 'Parental controls not configured',
      'sl_child_data_limits': 'Data collection not limited',
      'sl_recording_disable': 'Recording cannot be disabled',
      'sl_health_sharing': 'Health data shared with third parties',
      'sl_location_tracking': 'Location tracking enabled',
      'sl_expert_data_retention_duration':
          'Retention duration unclear or too long',
      'sl_expert_access_control_granular': 'Granular access control missing',
      'sl_expert_third_party_sharing_limited':
          'Third-party sharing not limited',
      'sl_expert_data_sale_disabled': 'Data sale not excluded',
      'sl_expert_update_support_window':
          'Guaranteed update support window unknown',
      'sl_expert_vulnerability_process': 'Vulnerability process not documented',
      'sl_expert_offline_functionality':
          'Meaningful offline operation not possible',
      'sl_expert_bystander_transparency':
          'Transparency for nearby bystanders missing',
      'sl_expert_child_data_protection':
          'Child-data protection measures missing',
      'sl_expert_access_revocation':
          'Individual access revocation not possible',
      'sl_expert_sensitive_inference_controls':
          'Controls against sensitive inference missing',
      // ── Inherent risk hints ──────────────────────────────────────────────────
      'risk_hint_camera':
          'You answered all questions positively. However, baseline risk remains higher for cameras because they capture highly sensitive observation data and can be misused for surveillance if misconfigured.',
      'risk_hint_mic':
          'You answered all questions positively. However, baseline risk remains elevated for microphone devices because voice data is highly sensitive and accidental activation or cloud processing still carries risks.',
      'risk_hint_lock':
          'You answered all questions positively. However, smart locks still have elevated baseline risk because misuse directly affects physical access to your home.',
      'risk_hint_child_room':
          "You answered all questions positively. However, baseline risk remains elevated in a child's bedroom because especially sensitive data about children and their daily life can be affected there.",
      'risk_hint_generic':
          'You answered all questions positively. The device can still remain medium/high risk because its type may reveal sensitive usage and behavior data.',
      // ── General recommendations ──────────────────────────────────────────────
      'gen_rec_0':
          "Set up a separate Wi-Fi network for smart home devices (e.g., your router's guest network).",
      'gen_rec_1':
          'Use a password manager and assign a unique, strong password to each device.',
      'gen_rec_2':
          'Enable multi-factor authentication (MFA) for all vendor accounts.',
      'gen_rec_3':
          'Define who in your household is responsible for updates, backups, and accounts.',
      'gen_rec_4':
          'Regularly review (at least once per quarter) all access permissions and accounts.',
      'gen_rec_5':
          'Dispose of old devices in a privacy-safe way: perform a factory reset and remove them from vendor cloud accounts.',
      'gen_rec_6':
          'Use a household consent check before buying new devices and involve all household members.',
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
      'skippedDevicesHint':
          '{count} zařízení přeskočeno, protože dotazník nebyl dokončen.',
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
      'skippedDevicesHint':
          'Pominięto {count} urządzeń, ponieważ kwestionariusz nie został ukończony.',
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
      'skippedDevicesHint':
          '{count} appareils ignorés car le questionnaire n\'a pas été terminé.',
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
      'skippedDevicesHint':
          '{count} apparaten overgeslagen omdat de vragenlijst niet is voltooid.',
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
      'skippedDevicesHint':
          '{count} enheder er sprunget over, fordi spørgeskemaet ikke er afsluttet.',
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
  String skippedDevicesHint(int count) =>
      _value('skippedDevicesHint').replaceAll('{count}', '$count');
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
