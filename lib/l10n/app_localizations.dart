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
      'appTitle': 'Smart Home Privatsphaere-Check',
      'welcomeTitle': 'Smart Home\nPrivatsphaere-Check',
      'welcomeDescription':
          'Erfassen Sie Raum fuer Raum Ihre smarten Geraete und erhalten Sie eine Privatsphaerebewertung mit konkreten Empfehlungen.',
      'stepSelectRooms': 'Raeume auswaehlen',
      'stepCaptureDevices': 'Geraete erfassen',
      'stepAnswerQuestions': 'Sicherheitsfragen beantworten',
      'stepGetRisk': 'Risikoprofil & Empfehlungen erhalten',
      'start': 'Starten',
      'resume': 'Fortsetzen',
      'about': 'Ueber',
      'roomSelectionTitle': 'Raum auswaehlen',
      'roomQuestion': 'Welchen Raum moechten Sie jetzt pruefen?',
      'roomInstruction':
          'Tippen Sie auf einen Raum, erfassen Sie dort Ihre Geraete und kehren Sie dann hierher zurueck, um den naechsten Raum zu waehlen.',
      'results': 'Ergebnisse',
      'alreadyEvaluated': 'Bereits ausgewertet',
      'notCompleted': 'Nicht abgeschlossen',
      'addRoom': 'Raum hinzufuegen',
      'deviceTitlePrefix': 'Geraete',
      'roomCheck': 'Raum-Check',
      'deviceQuestion': 'Welche smarten Geraete nutzen Sie in diesem Raum?',
      'deviceQuestionHint':
          'Tippen Sie auf ein Geraet, um die Sicherheitsfragen dafuer zu beantworten.',
      'noKnownDevices':
          'Keine bekannten Geraete fuer diesen Raum. Sie koennen ein eigenes Geraet hinzufuegen.',
      'addDevice': 'Geraet\nhinzufuegen',
      'noDevice': 'Kein Geraet',
      'nextRoom': 'Naechster Raum',
      'deleteDeviceTitle': 'Geraet loeschen?',
      'deleteDeviceBody':
          'Dieses benutzerdefinierte Geraet wird geloescht. Alle verknuepften Instanzen werden auch entfernt.',
      'delete': 'Loeschen',
      'cancel': 'Abbrechen',
      'confirm': 'Bestaetigen',
      'noDeviceDialogTitle': 'Keine Geraete in diesem Raum?',
      'noDeviceDialogBody':
          'Dieser Raum wird ohne Geraete abgeschlossen und fliesst nicht in die Bewertung ein.',
      'noDeviceDialogBodyWithExisting':
          'Vorhandene Geraeteauswahlen fuer diesen Raum werden verworfen. Dieser Raum wird ohne Geraete abgeschlossen und fliesst nicht in die Bewertung ein.',
      'questionnaireTitle': 'Sicherheitsfragen',
      'connectedDevice': 'Verbundenes Geraet',
      'done': 'Fertig',
      'yes': 'Ja',
      'no': 'Nein',
      'dontKnow': 'Weiss ich nicht',
      'notApplicableForDevice': 'Diese Frage trifft auf mein Geraet nicht zu',
      'languageDialogTitle': 'Sprache waehlen',
      'currentLanguage': 'Aktuelle Sprache',
      'aboutScreenTitle': 'Ueber die App',
      'aboutSubtitle': 'Smart Home Privatsphaere-Check',
      'websiteOpenFailed': 'Website konnte nicht geoeffnet werden.',
      'deleteAllDataTitle': 'Alle Daten loeschen?',
      'deleteAllDataBody':
          'Alle erfassten Raeume, Geraete und Antworten werden dauerhaft geloescht. Diese Aktion kann nicht rueckgaengig gemacht werden.',
      'deleteAllDataButton': 'Daten loeschen',
      'allDataDeleted': 'Alle gespeicherten Daten wurden geloescht.',
      'projectPartners': 'Projektpartner',
      'coordinationFunding': 'Koordination & Foerderung',
      'coordination': 'Koordination',
      'platformPrivacy': 'Plattform Privatheit',
      'fundingAgency': 'Foerdermittelgeber',
      'fundingAgencyValue':
          'Bundesministerium fuer Forschung, Technologie und Raumfahrt\nFKZ 16KIS1868K',
      'website': 'Website',
      'dangerZone': 'Gefahrenbereich',
      'dangerZoneWarning':
          'Achtung: Diese Aktion entfernt alle gespeicherten App-Daten dauerhaft.',
      'roomDeleteTitle': 'Raum loeschen?',
      'roomDeleteBody':
          'Dieser benutzerdefinierte Raum wird geloescht. Alle verknuepften Geraete werden auch entfernt.',
      'add': 'Hinzufuegen',
      'addRoomDialogTitle': 'Neuen Raum hinzufuegen',
      'roomName': 'Raumname',
      'roomNameHint': 'z. B. Wohnzimmer, Garage',
      'chooseIcon': 'Symbol waehlen:',
      'addDeviceDialogTitle': 'Neues Geraet hinzufuegen',
      'deviceName': 'Geraetename',
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
      'noDevicesCaptured': 'Keine Geraete erfasst.',
      'noDevicesHint':
          'Starten Sie erneut und fuegen Sie Geraete hinzu, um eine Bewertung zu erhalten.',
      'highRisk': 'Hohes Risiko',
      'mediumRisk': 'Mittleres Risiko',
      'lowRisk': 'Niedriges Risiko',
      'exportFailed': 'Export fehlgeschlagen',
      'summaryShareSubject': 'Simplications Ergebnis',
      'summarySharePdfText': 'Simplications Ergebnisbericht als PDF',
      'overview': 'Uebersicht',
      'evaluatedDevices': 'Bewertete Geraete',
      'overallRisk': 'Gesamtrisiko',
      'generalRecommendations': 'Allgemeine Empfehlungen',
      'generalRecommendationsHint':
          'Diese Massnahmen gelten unabhaengig von einzelnen Geraeten fuer Ihr gesamtes Smart Home.',
      'fullCatalog': 'Vollstaendiger Massnahmenkatalog',
      'catalogButton': 'Zum vollstaendigen Massnahmenkatalog',
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
      'devicesRated': 'bewertete Geraete',
      'howRiskCalculated': 'Wie wird das Risiko berechnet?',
      'totalScore': 'Gesamt',
      'catalogSnackBarPrefix': 'Massnahmenkatalog',
      'reportExportedAt': 'Exportiert am',
      'noActionLow': 'Alles in Ordnung - keine Massnahmen erforderlich.',
      'noActionMedium':
          'Aktuell keine konkreten Massnahmen aus Ihren Antworten ableitbar, aber es bleibt ein mittleres Restrisiko.',
      'noActionHigh':
          'Aktuell keine konkreten Massnahmen aus Ihren Antworten ableitbar, aber es bleibt ein hohes Restrisiko.',
      'overallLow':
          'Gut gemacht! Ihre Geraete sind ueberwiegend sicher konfiguriert. Schauen Sie trotzdem in die allgemeinen Empfehlungen.',
      'overallMedium':
          'Es gibt Verbesserungspotenzial. Schauen Sie sich die Empfehlungen zu den einzelnen Geraeten an.',
      'overallHigh':
          'Mehrere Geraete haben erhebliche Privatsphaere-/Datenschutzrisiken. Bitte setzen Sie die Massnahmen mit hoher Prioritaet zeitnah um.',
      'dontKnowHint':
          ' Es wurden {count} Antwort{suffix} mit "Weiss ich nicht" gegeben - nehmen Sie sich Zeit, die Einstellungen Ihrer Geraete besser kennenzulernen.',
    },
    'en': {
      'appTitle': 'Smart Home Privacy Check',
      'welcomeTitle': 'Smart Home\nPrivacy Check',
      'welcomeDescription':
          'Capture your smart devices room by room and receive a privacy assessment with concrete recommendations.',
      'stepSelectRooms': 'Select rooms',
      'stepCaptureDevices': 'Capture devices',
      'stepAnswerQuestions': 'Answer security questions',
      'stepGetRisk': 'Get risk profile & recommendations',
      'start': 'Start',
      'resume': 'Resume',
      'about': 'About',
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
      'deviceQuestionHint':
          'Tap a device to answer the security questions for it.',
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
      'questionnaireTitle': 'Security questions',
      'connectedDevice': 'Connected device',
      'done': 'Done',
      'yes': 'Yes',
      'no': 'No',
      'dontKnow': "I don't know",
      'notApplicableForDevice': 'This question does not apply to my device',
      'languageDialogTitle': 'Choose language',
      'currentLanguage': 'Current language',
      'aboutScreenTitle': 'About the app',
      'aboutSubtitle': 'Smart home privacy check',
      'websiteOpenFailed': 'Could not open website.',
      'deleteAllDataTitle': 'Delete all data?',
      'deleteAllDataBody':
          'All captured rooms, devices, and answers will be permanently deleted. This action cannot be undone.',
      'deleteAllDataButton': 'Delete data',
      'allDataDeleted': 'All saved data has been deleted.',
      'projectPartners': 'Project partners',
      'coordinationFunding': 'Coordination & Funding',
      'coordination': 'Coordination',
      'platformPrivacy': 'Plattform Privatheit',
      'fundingAgency': 'Funding body',
      'fundingAgencyValue':
          'German Federal Ministry of Research, Technology and Space\nGrant 16KIS1868K',
      'website': 'Website',
      'dangerZone': 'Danger zone',
      'dangerZoneWarning':
          'Warning: This action permanently removes all saved app data.',
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
      'appTitle': 'Kontrola soukromi chytre domacnosti',
      'welcomeTitle': 'Kontrola soukromi\nchytre domacnosti',
      'welcomeDescription':
          'Zaznamenejte chytra zarizeni mistnost po mistnosti a ziskejte hodnoceni soukromi s konkretnimi doporucenimi.',
      'stepSelectRooms': 'Vybrat mistnosti',
      'stepCaptureDevices': 'Zaznamenat zarizeni',
      'stepAnswerQuestions': 'Odpovedet na bezpecnostni otazky',
      'stepGetRisk': 'Ziskat rizikovy profil a doporuceni',
      'start': 'Spustit',
      'resume': 'Pokracovat',
      'about': 'O aplikaci',
      'roomSelectionTitle': 'Vyber mistnosti',
      'roomQuestion': 'Kterou mistnost chcete nyni zkontrolovat?',
      'roomInstruction':
          'Klepnete na mistnost, zaznamenejte v ni zarizeni a vratte se sem pro vyber dalsi mistnosti.',
      'results': 'Vysledky',
      'alreadyEvaluated': 'Jiz vyhodnoceno',
      'notCompleted': 'Nedokonceno',
      'addRoom': 'Pridat mistnost',
      'deviceTitlePrefix': 'Zarizeni',
      'roomCheck': 'Kontrola mistnosti',
      'deviceQuestion': 'Ktera chytra zarizeni pouzivate v teto mistnosti?',
      'deviceQuestionHint':
          'Klepnete na zarizeni a odpovezte na bezpecnostni otazky.',
      'noKnownDevices':
          'Pro tuto mistnost nejsou znama zadna zarizeni. Muzete pridat vlastni.',
      'addDevice': 'Pridat\nzarizeni',
      'noDevice': 'Zadne zarizeni',
      'nextRoom': 'Dalsi mistnost',
      'deleteDeviceTitle': 'Smazat zarizeni?',
      'deleteDeviceBody':
          'Toto vlastni zarizeni bude smazano. Vsechny navazane instance budou take odstraneny.',
      'delete': 'Smazat',
      'cancel': 'Zrusit',
      'confirm': 'Potvrdit',
      'noDeviceDialogTitle': 'V teto mistnosti nejsou zarizeni?',
      'noDeviceDialogBody':
          'Tato mistnost bude uzavrena bez zarizeni a neovlivni skore.',
      'noDeviceDialogBodyWithExisting':
          'Existujici vybery zarizeni pro tuto mistnost budou zahozeny. Tato mistnost bude uzavrena bez zarizeni a neovlivni skore.',
      'questionnaireTitle': 'Bezpecnostni otazky',
      'connectedDevice': 'Pripojene zarizeni',
      'done': 'Hotovo',
      'yes': 'Ano',
      'no': 'Ne',
      'dontKnow': 'Nevim',
      'notApplicableForDevice': 'Tato otazka se na moje zarizeni nevztahuje',
      'languageDialogTitle': 'Vyberte jazyk',
      'currentLanguage': 'Aktualni jazyk',
    },
    'pl': {
      'appTitle': 'Kontrola prywatnosci Smart Home',
      'welcomeTitle': 'Kontrola prywatnosci\nSmart Home',
      'welcomeDescription':
          'Dodaj urzadzenia smart pokoj po pokoju i otrzymaj ocene prywatnosci z konkretnymi zaleceniami.',
      'stepSelectRooms': 'Wybierz pokoje',
      'stepCaptureDevices': 'Dodaj urzadzenia',
      'stepAnswerQuestions': 'Odpowiedz na pytania bezpieczenstwa',
      'stepGetRisk': 'Uzyskaj profil ryzyka i zalecenia',
      'start': 'Start',
      'resume': 'Wznow',
      'about': 'O aplikacji',
      'roomSelectionTitle': 'Wybierz pokoj',
      'roomQuestion': 'Ktory pokoj chcesz teraz sprawdzic?',
      'roomInstruction':
          'Stuknij pokoj, dodaj urzadzenia, a potem wroc tutaj, aby wybrac kolejny pokoj.',
      'results': 'Wyniki',
      'alreadyEvaluated': 'Juz oceniono',
      'notCompleted': 'Nieukonczone',
      'addRoom': 'Dodaj pokoj',
      'deviceTitlePrefix': 'Urzadzenia',
      'roomCheck': 'Sprawdzenie pokoju',
      'deviceQuestion': 'Jakich inteligentnych urzadzen uzywasz w tym pokoju?',
      'deviceQuestionHint':
          'Stuknij urzadzenie, aby odpowiedziec na pytania bezpieczenstwa.',
      'noKnownDevices':
          'Brak znanych urzadzen dla tego pokoju. Mozesz dodac wlasne urzadzenie.',
      'addDevice': 'Dodaj\nurzadzenie',
      'noDevice': 'Brak urzadzenia',
      'nextRoom': 'Nastepny pokoj',
      'deleteDeviceTitle': 'Usunac urzadzenie?',
      'deleteDeviceBody':
          'To niestandardowe urzadzenie zostanie usuniete. Wszystkie powiazane instancje rowniez zostana usuniete.',
      'delete': 'Usun',
      'cancel': 'Anuluj',
      'confirm': 'Potwierdz',
      'noDeviceDialogTitle': 'Brak urzadzen w tym pokoju?',
      'noDeviceDialogBody':
          'Ten pokoj zostanie zakonczony bez urzadzen i nie wplynie na wynik.',
      'noDeviceDialogBodyWithExisting':
          'Istniejace wybory urzadzen dla tego pokoju zostana odrzucone. Ten pokoj zostanie zakonczony bez urzadzen i nie wplynie na wynik.',
      'questionnaireTitle': 'Pytania bezpieczenstwa',
      'connectedDevice': 'Podlaczone urzadzenie',
      'done': 'Gotowe',
      'yes': 'Tak',
      'no': 'Nie',
      'dontKnow': 'Nie wiem',
      'notApplicableForDevice': 'To pytanie nie dotyczy mojego urzadzenia',
      'languageDialogTitle': 'Wybierz jezyk',
      'currentLanguage': 'Biezacy jezyk',
    },
    'fr': {
      'appTitle': 'Controle de confidentialite Smart Home',
      'welcomeTitle': 'Controle de confidentialite\nSmart Home',
      'welcomeDescription':
          'Renseignez vos appareils intelligents piece par piece et obtenez une evaluation de confidentialite avec des recommandations concretes.',
      'stepSelectRooms': 'Selectionner les pieces',
      'stepCaptureDevices': 'Renseigner les appareils',
      'stepAnswerQuestions': 'Repondre aux questions de securite',
      'stepGetRisk': 'Obtenir le profil de risque et les recommandations',
      'start': 'Demarrer',
      'resume': 'Reprendre',
      'about': 'A propos',
      'roomSelectionTitle': 'Selectionner une piece',
      'roomQuestion': 'Quelle piece souhaitez-vous verifier maintenant ?',
      'roomInstruction':
          'Touchez une piece, renseignez ses appareils, puis revenez ici pour choisir la piece suivante.',
      'results': 'Resultats',
      'alreadyEvaluated': 'Deja evalue',
      'notCompleted': 'Non termine',
      'addRoom': 'Ajouter une piece',
      'deviceTitlePrefix': 'Appareils',
      'roomCheck': 'Verification de la piece',
      'deviceQuestion':
          'Quels appareils intelligents utilisez-vous dans cette piece ?',
      'deviceQuestionHint':
          'Touchez un appareil pour repondre aux questions de securite.',
      'noKnownDevices':
          'Aucun appareil connu pour cette piece. Vous pouvez ajouter votre propre appareil.',
      'addDevice': 'Ajouter\nun appareil',
      'noDevice': 'Aucun appareil',
      'nextRoom': 'Piece suivante',
      'deleteDeviceTitle': 'Supprimer l\'appareil ?',
      'deleteDeviceBody':
          'Cet appareil personnalise sera supprime. Toutes les instances liees seront egalement supprimees.',
      'delete': 'Supprimer',
      'cancel': 'Annuler',
      'confirm': 'Confirmer',
      'noDeviceDialogTitle': 'Aucun appareil dans cette piece ?',
      'noDeviceDialogBody':
          'Cette piece sera terminee sans appareil et n\'affectera pas le score.',
      'noDeviceDialogBodyWithExisting':
          'Les selections d\'appareils existantes pour cette piece seront ignorees. Cette piece sera terminee sans appareil et n\'affectera pas le score.',
      'questionnaireTitle': 'Questions de securite',
      'connectedDevice': 'Appareil connecte',
      'done': 'Termine',
      'yes': 'Oui',
      'no': 'Non',
      'dontKnow': 'Je ne sais pas',
      'notApplicableForDevice':
          'Cette question ne s\'applique pas a mon appareil',
      'languageDialogTitle': 'Choisir la langue',
      'currentLanguage': 'Langue actuelle',
    },
    'nl': {
      'appTitle': 'Smart Home privacycheck',
      'welcomeTitle': 'Smart Home\nprivacycheck',
      'welcomeDescription':
          'Leg je slimme apparaten kamer voor kamer vast en ontvang een privacybeoordeling met concrete aanbevelingen.',
      'stepSelectRooms': 'Kamers kiezen',
      'stepCaptureDevices': 'Apparaten vastleggen',
      'stepAnswerQuestions': 'Beveiligingsvragen beantwoorden',
      'stepGetRisk': 'Risicoprofiel en aanbevelingen ontvangen',
      'start': 'Starten',
      'resume': 'Doorgaan',
      'about': 'Over',
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
      'deviceQuestionHint':
          'Tik op een apparaat om de beveiligingsvragen te beantwoorden.',
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
      'questionnaireTitle': 'Beveiligingsvragen',
      'connectedDevice': 'Verbonden apparaat',
      'done': 'Klaar',
      'yes': 'Ja',
      'no': 'Nee',
      'dontKnow': 'Weet ik niet',
      'notApplicableForDevice':
          'Deze vraag is niet van toepassing op mijn apparaat',
      'languageDialogTitle': 'Taal kiezen',
      'currentLanguage': 'Huidige taal',
    },
    'da': {
      'appTitle': 'Smart Home privatlivstjek',
      'welcomeTitle': 'Smart Home\nprivatlivstjek',
      'welcomeDescription':
          'Registrer dine smarte enheder rum for rum, og fa en privatlivsvurdering med konkrete anbefalinger.',
      'stepSelectRooms': 'Vaelg rum',
      'stepCaptureDevices': 'Registrer enheder',
      'stepAnswerQuestions': 'Besvar sikkerhedssporgsmaal',
      'stepGetRisk': 'Fa risikoprofil og anbefalinger',
      'start': 'Start',
      'resume': 'Fortsat',
      'about': 'Om',
      'roomSelectionTitle': 'Vaelg rum',
      'roomQuestion': 'Hvilket rum vil du tjekke nu?',
      'roomInstruction':
          'Tryk pa et rum, registrer enhederne der, og kom tilbage for at vaelge naeste rum.',
      'results': 'Resultater',
      'alreadyEvaluated': 'Allerede vurderet',
      'notCompleted': 'Ikke faerdig',
      'addRoom': 'Tilfoj rum',
      'deviceTitlePrefix': 'Enheder',
      'roomCheck': 'Rumtjek',
      'deviceQuestion': 'Hvilke smarte enheder bruger du i dette rum?',
      'deviceQuestionHint':
          'Tryk pa en enhed for at besvare sikkerhedssporgsmaalene.',
      'noKnownDevices':
          'Ingen kendte enheder for dette rum. Du kan tilfoje din egen enhed.',
      'addDevice': 'Tilfoj\nenhed',
      'noDevice': 'Ingen enhed',
      'nextRoom': 'Naeste rum',
      'deleteDeviceTitle': 'Slet enhed?',
      'deleteDeviceBody':
          'Denne brugerdefinerede enhed slettes. Alle tilknyttede instanser fjernes ogsa.',
      'delete': 'Slet',
      'cancel': 'Annuller',
      'confirm': 'Bekraeft',
      'noDeviceDialogTitle': 'Ingen enheder i dette rum?',
      'noDeviceDialogBody':
          'Dette rum afsluttes uden enheder og paavirker ikke scoren.',
      'noDeviceDialogBodyWithExisting':
          'Eksisterende enhedsvalg for dette rum kasseres. Dette rum afsluttes uden enheder og paavirker ikke scoren.',
      'questionnaireTitle': 'Sikkerhedssporgsmaal',
      'connectedDevice': 'Tilsluttet enhed',
      'done': 'Faerdig',
      'yes': 'Ja',
      'no': 'Nej',
      'dontKnow': 'Ved ikke',
      'notApplicableForDevice': 'Dette sporgsmaal gaelder ikke for min enhed',
      'languageDialogTitle': 'Vaelg sprog',
      'currentLanguage': 'Nuvaerende sprog',
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
  String aboutSubtitle() => _value('aboutSubtitle');
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
