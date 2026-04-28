import 'package:flutter/material.dart';
import '../models/room.dart';
import '../models/device.dart';

class CatalogData {
  static const List<Room> allRooms = [
    Room(id: 'living', name: 'Wohnzimmer', icon: Icons.weekend),
    Room(id: 'kitchen', name: 'Küche', icon: Icons.kitchen),
    Room(id: 'bedroom', name: 'Schlafzimmer', icon: Icons.hotel),
    Room(id: 'bathroom', name: 'Badezimmer', icon: Icons.bathtub),
    Room(id: 'office', name: 'Arbeitszimmer', icon: Icons.computer),
    Room(id: 'hallway', name: 'Flur / Eingang', icon: Icons.meeting_room),
    Room(id: 'garden', name: 'Garten / Außenbereich', icon: Icons.yard),
    Room(id: 'basement', name: 'Keller / Speisekammer', icon: Icons.food_bank),
    Room(id: 'whole_home', name: 'Ganze Wohnung', icon: Icons.home),
  ];

  static const List<DeviceTemplate> allDeviceTemplates = [
    // ── Sensors ───────────────────────────────────────────────────────
    DeviceTemplate(
      id: 'simple_sensor',
      name: 'Einfacher Sensor (z. B. Bewegungs- oder Türsensor)',
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
    DeviceTemplate(
      id: 'humidity_sensor',
      name: 'Feuchtigkeitssensor',
      icon: Icons.water_drop,
      baseRiskScore: 15,
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
    DeviceTemplate(
      id: 'temperature_sensor',
      name: 'Temperatursensor',
      icon: Icons.thermostat,
      baseRiskScore: 15,
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
    DeviceTemplate(
      id: 'light_sensor',
      name: 'Lichtsensor',
      icon: Icons.light_mode,
      baseRiskScore: 15,
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
      name: 'Smart Speaker / Sprachassistent',
      icon: Icons.speaker,
      baseRiskScore: 50,
      hasMicrophone: true,
      roomIds: ['living', 'kitchen', 'bedroom', 'office', 'hallway'],
      deviceType: 'speaker',
    ),
    DeviceTemplate(
      id: 'smart_display',
      name: 'Smart Display (z. B. Nest Hub)',
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
      name: 'Smart TV',
      icon: Icons.tv,
      baseRiskScore: 40,
      roomIds: ['living', 'bedroom'],
      deviceType: 'tv',
    ),

    // ── Cameras ───────────────────────────────────────────────────────
    DeviceTemplate(
      id: 'indoor_camera',
      name: 'Smarte Innenkamera',
      icon: Icons.videocam,
      baseRiskScore: 60,
      hasCamera: true,
      roomIds: ['living', 'hallway', 'basement', 'bedroom', 'kitchen'],
      deviceType: 'camera',
    ),
    DeviceTemplate(
      id: 'outdoor_camera',
      name: 'Smarte Außenkamera',
      icon: Icons.camera_outdoor,
      baseRiskScore: 60,
      hasCamera: true,
      roomIds: ['garden', 'hallway', 'whole_home'],
      deviceType: 'camera',
    ),
    DeviceTemplate(
      id: 'doorbell_camera',
      name: 'Smarte Türklingel mit Kamera',
      icon: Icons.doorbell,
      baseRiskScore: 60,
      hasCamera: true,
      hasMicrophone: true,
      roomIds: ['hallway', 'whole_home'],
      deviceType: 'camera',
    ),
    DeviceTemplate(
      id: 'baby_monitor',
      name: 'Babymonitor / Babykamera',
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
      name: 'Saugroboter',
      icon: Icons.cleaning_services,
      baseRiskScore: 35,
      roomIds: ['living', 'kitchen', 'hallway', 'bedroom', 'whole_home'],
      deviceType: 'robot',
    ),
    DeviceTemplate(
      id: 'smart_fridge',
      name: 'Smarter Kühlschrank',
      icon: Icons.kitchen,
      baseRiskScore: 30,
      roomIds: ['kitchen'],
      deviceType: 'appliance',
    ),
    DeviceTemplate(
      id: 'smart_oven',
      name: 'Smarter Backofen / Herd',
      icon: Icons.microwave,
      baseRiskScore: 25,
      roomIds: ['kitchen'],
      deviceType: 'appliance',
    ),
    DeviceTemplate(
      id: 'smart_coffee',
      name: 'Smarte Kaffeemaschine',
      icon: Icons.coffee,
      baseRiskScore: 20,
      roomIds: ['kitchen'],
      deviceType: 'appliance',
    ),
    DeviceTemplate(
      id: 'smart_washing',
      name: 'Smarte Waschmaschine / Trockner',
      icon: Icons.local_laundry_service,
      baseRiskScore: 20,
      roomIds: ['basement', 'bathroom', 'whole_home'],
      deviceType: 'appliance',
    ),

    // ── Smart Home Controls ───────────────────────────────────────────
    DeviceTemplate(
      id: 'smart_thermostat',
      name: 'Smarter Thermostat / Heizungssteuerung',
      icon: Icons.thermostat,
      baseRiskScore: 30,
      roomIds: ['living', 'bedroom', 'hallway', 'whole_home'],
      deviceType: 'thermostat',
    ),
    DeviceTemplate(
      id: 'smart_plug',
      name: 'Smarte Steckdose',
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
      name: 'Smarte Beleuchtung',
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
      name: 'Smartes Türschloss',
      icon: Icons.lock,
      baseRiskScore: 50,
      roomIds: ['hallway', 'whole_home'],
      deviceType: 'lock',
    ),
    DeviceTemplate(
      id: 'smart_blind',
      name: 'Smarte Jalousie / Rolllade',
      icon: Icons.window,
      baseRiskScore: 20,
      roomIds: ['living', 'bedroom', 'office', 'whole_home'],
      deviceType: 'blind',
    ),

    // ── Wearables ─────────────────────────────────────────────────────
    DeviceTemplate(
      id: 'fitness_tracker',
      name: 'Fitness-Tracker / Smartwatch',
      icon: Icons.watch,
      baseRiskScore: 40,
      roomIds: ['bedroom', 'bathroom', 'whole_home'],
      deviceType: 'wearable',
    ),

    // ── Kids ──────────────────────────────────────────────────────────
    DeviceTemplate(
      id: 'smart_toy',
      name: 'Smartes Spielzeug',
      icon: Icons.toys,
      baseRiskScore: 55,
      hasMicrophone: true,
      roomIds: ['bedroom', 'living'],
      deviceType: 'toy',
    ),

    // ── Network & Hub ─────────────────────────────────────────────────
    DeviceTemplate(
      id: 'smart_router',
      name: 'Smart Router / Mesh-System',
      icon: Icons.router,
      baseRiskScore: 40,
      roomIds: ['whole_home', 'office'],
      deviceType: 'router',
    ),
    DeviceTemplate(
      id: 'smart_hub',
      name: 'Smart-Home-Hub (z. B. Homey, Home Assistant)',
      icon: Icons.hub,
      baseRiskScore: 35,
      roomIds: ['whole_home', 'living'],
      deviceType: 'hub',
    ),
    DeviceTemplate(
      id: 'smart_meter',
      name: 'Intelligenter Stromzähler / Smart Meter',
      icon: Icons.bolt,
      baseRiskScore: 30,
      roomIds: ['whole_home', 'basement'],
      deviceType: 'meter',
    ),

    // ── Garden ────────────────────────────────────────────────────────
    DeviceTemplate(
      id: 'smart_irrigation',
      name: 'Smarte Bewässerungsanlage',
      icon: Icons.water_drop,
      baseRiskScore: 15,
      roomIds: ['garden'],
      deviceType: 'outdoor',
    ),

    // ── Health & Bathroom ─────────────────────────────────────────────
    DeviceTemplate(
      id: 'smart_scale',
      name: 'Smarte Waage',
      icon: Icons.monitor_weight,
      baseRiskScore: 35,
      roomIds: ['bathroom', 'bedroom'],
      deviceType: 'wearable',
    ),

    // ── Office ────────────────────────────────────────────────────────
    DeviceTemplate(
      id: 'smart_printer',
      name: 'Smarter Drucker',
      icon: Icons.print,
      baseRiskScore: 30,
      roomIds: ['office'],
      deviceType: 'printer',
    ),
  ];

  static List<DeviceTemplate> devicesForRoom(String roomId) =>
      allDeviceTemplates.where((d) => d.roomIds.contains(roomId)).toList();

  /// Device-specific questions based on device type and BSI recommendations
  static List<DeviceQuestion> getDeviceSpecificQuestions(
    DeviceTemplate template,
  ) {
    // Simple sensors typically have no app, dedicated password, or software updates,
    // so they get a tailored, minimal question set focused on data minimisation.
    if (template.deviceType == 'sensor') {
      return [
        const DeviceQuestion(
          id: 'sensor_informed',
          text:
              'Sind alle Personen im Haushalt über diesen Sensor und seine Funktion informiert?',
          hint:
              'Alle Mitbewohnenden sollten wissen, welche Daten der Sensor erfasst.',
        ),
        const DeviceQuestion(
          id: 'sensor_network',
          text:
              'Ist der Sensor in einem separaten Smart-Home- oder IoT-WLAN eingebunden (sofern netzwerkfähig)?',
          hint:
              'Ein eigenes Netz für smarte Geräte schützt Ihr restliches Heimnetzwerk.',
        ),
        const DeviceQuestion(
          id: 'sensor_frequency',
          text:
              'Können Sie das Messintervall des Sensors reduzieren (z. B. seltener messen)?',
          hint:
              'Eine niedrigere Messfrequenz erzeugt weniger Daten und schränkt Rückschlüsse auf Ihr Verhalten ein.',
        ),
        const DeviceQuestion(
          id: 'sensor_data_deletion',
          text: 'Werden ältere Messwerte automatisch oder auf Wunsch gelöscht?',
          hint:
              'Alte Verlaufsdaten sollten nicht dauerhaft gespeichert bleiben. Prüfen Sie die Aufbewahrungszeit in den Einstellungen.',
        ),
        const DeviceQuestion(
          id: 'sensor_granularity',
          text:
              'Zeigt das System die Sensordaten nur in zusammengefasster Form an (z. B. Tages- statt Minutenwerte)?',
          hint:
              'Weniger granulare Anzeigen schützen vor Rückschlüssen auf genaue Anwesenheits- oder Verhaltensmuster.',
        ),
        const DeviceQuestion(
          id: 'sensor_local',
          text:
              'Werden die Messdaten lokal verarbeitet und gespeichert, ohne in eine Cloud übertragen zu werden?',
          hint:
              'Lokale Verarbeitung verhindert, dass der Hersteller Einblick in Ihre Messwerte erhält.',
        ),
      ];
    }

    final baseQuestions = <DeviceQuestion>[
      const DeviceQuestion(
        id: 'password',
        text:
            'Haben Sie das Standard-Passwort des Geräts oder des zugehörigen Kontos geändert?',
        hint:
            'Voreingestellte Passwörter sind oft öffentlich bekannt und leicht zu knacken.',
      ),
      const DeviceQuestion(
        id: 'updates',
        text: 'Sind automatische Sicherheits-Updates für das Gerät aktiviert?',
        hint: 'Updates schließen bekannte Sicherheitslücken zeitnah.',
      ),
      const DeviceQuestion(
        id: 'network',
        text:
            'Ist das Gerät in einem separaten Smart-Home- oder IoT-WLAN eingebunden?',
        hint:
            'Ein eigenes Netz für smarte Geräte schützt Ihr restliches Heimnetzwerk.',
      ),
      const DeviceQuestion(
        id: 'informed',
        text:
            'Sind alle Personen im Haushalt über dieses Gerät und seine Funktion informiert?',
        hint:
            'Alle Mitbewohnenden sollten wissen, welche Daten das Gerät erfasst.',
      ),
      const DeviceQuestion(
        id: 'permissions',
        text:
            'Haben Sie unnötige App-Berechtigungen (z. B. Standort, Kontakte) deaktiviert?',
        hint: 'Nur wirklich benötigte Berechtigungen sollten aktiviert sein.',
      ),
    ];

    // Add device-type-specific questions
    if (template.deviceType == 'speaker') {
      baseQuestions.addAll([
        const DeviceQuestion(
          id: 'voice_history',
          text:
              'Können Sie Sprachaufnahmen aus der Geräte-Historie löschen oder diese Funktion deaktivieren?',
          hint:
              'BSI-Empfehlung: Minimieren Sie die Speicherung von Aufnahmen oder löschen Sie sie regelmäßig.',
        ),
        const DeviceQuestion(
          id: 'voice_local',
          text:
              'Wird die Sprachverarbeitung teilweise lokal auf dem Gerät durchgeführt?',
          hint:
              'Lokale Verarbeitung reduziert die Menge an Daten, die in die Cloud übertragen werden.',
        ),
        const DeviceQuestion(
          id: 'skills_permissions',
          text:
              'Überprüfen Sie regelmäßig, welche Fähigkeiten/Skills Zugriff auf Ihr Konto haben?',
          hint:
              'Skills von Drittanbietern können sensible Daten abfangen. Nur notwendige Skills aktivieren.',
        ),
      ]);
    } else if (template.deviceType == 'camera') {
      baseQuestions.addAll([
        const DeviceQuestion(
          id: 'video_encryption',
          text:
              'Ist die Videoaufnahme und -übertragung durchgängig verschlüsselt?',
          hint:
              'BSI-Empfehlung: Verschlüsselte Verbindung verhindert Abhören und Datenklau unterwegs.',
        ),
        const DeviceQuestion(
          id: 'video_storage',
          text:
              'Werden Aufnahmen lokal gespeichert oder exklusiv in der Cloud des Anbieters?',
          hint:
              'Lokale Speicherung gibt Ihnen mehr Kontrolle; Cloud-Speicherung erfordert zusätzliche Vertrauensebene.',
        ),
        const DeviceQuestion(
          id: 'sharing_restrictions',
          text:
              'Können Sie steuern, wer auf die Live-View und Aufnahmen zugreifen kann?',
          hint:
              'Sie sollten genau kontrollieren können, wer Zugang zu den Videoaufnahmen erhält.',
        ),
        const DeviceQuestion(
          id: 'motion_detection',
          text:
              'Können Sie Bewegungserkennung deaktivieren oder zeitlich begrenzen, wenn Sie zu Hause sind?',
          hint:
              'BSI-Empfehlung: Unnötige Aufnahmen vermeiden reduziert Datenmenge und Missbrauchsrisiko.',
        ),
      ]);
    } else if (template.deviceType == 'tv') {
      baseQuestions.addAll([
        const DeviceQuestion(
          id: 'account_required',
          text:
              'Müssen Sie ein Online-Konto erstellen, um das Gerät zu nutzen?',
          hint:
              'Konten mit Werbe-Tracking können Ihre Sehgewohnheiten speichern und auswerten.',
        ),
        const DeviceQuestion(
          id: 'tracking_disabled',
          text:
              'Können Sie Werbe- und Tracking-Funktionen vollständig deaktivieren?',
          hint:
              'Smart-TVs sammeln oft Daten über Ihre Sehgewohnheiten. Suchen Sie nach Datenschutzoptionen.',
        ),
        const DeviceQuestion(
          id: 'local_mode',
          text:
              'Können Sie das Gerät über HDMI oder lokale Quellen ohne Internetverbindung nutzen?',
          hint:
              'Offline-Betrieb schützt Ihre Nutzungsdaten vor Übertragung an den Hersteller.',
        ),
      ]);
    } else if (template.deviceType == 'thermostat') {
      baseQuestions.addAll([
        const DeviceQuestion(
          id: 'data_collection',
          text:
              'Werden Temperatur-Historien und Zeitpläne an den Hersteller übermittelt?',
          hint:
              'Historien können Anwesenheitsmuster und Lebensgewohnheiten offenbaren.',
        ),
        const DeviceQuestion(
          id: 'offline_control',
          text:
              'Können Sie das Thermostat auch offline betreiben (ohne Internet)?',
          hint:
              'Offline-Betrieb oder lokale Automatisierung schützt Ihre Daten vor Cloud-Zugriff.',
        ),
        const DeviceQuestion(
          id: 'family_access',
          text:
              'Können Sie steuern, wer die Heizung anpassen darf (z. B. nur Gäste einschränken)?',
          hint:
              'Haushaltsmitglieder sollten Kontrolle haben, ohne dass Besucher alles ändern können.',
        ),
      ]);
    } else if (template.deviceType == 'light' ||
        template.deviceType == 'plug' ||
        template.deviceType == 'blind') {
      baseQuestions.addAll([
        const DeviceQuestion(
          id: 'local_control',
          text:
              'Können Automatisierungen lokal ohne Internetverbindung erfolgen?',
          hint:
              'Lokale Ausführung von Szenen und Zeitplänen schützt Ihre Privatsphäre besser.',
        ),
        const DeviceQuestion(
          id: 'usage_tracking',
          text:
              'Werden Ihre Schaltmuster und Nutzungszeiten vom Hersteller erfasst?',
          hint:
              'Nutzungsmuster können Ihre Anwesenheit und Gewohnheiten offenbaren.',
        ),
        const DeviceQuestion(
          id: 'offline_fallback',
          text:
              'Funktionieren die Geräte noch, wenn die Internet- oder App-Verbindung ausfällt?',
          hint:
              'Zuverlässige lokale Funktion ist wichtig für alltägliche Nutzung und Privatsphäre.',
        ),
      ]);
    } else if (template.deviceType == 'lock') {
      baseQuestions.addAll([
        const DeviceQuestion(
          id: 'offline_unlock',
          text:
              'Können Sie das Schloss auch offline (z. B. mit Code oder Schlüssel) öffnen?',
          hint:
              'Backup-Optionen verhindern Aussperrung bei Internet- oder Stromausfällen.',
        ),
        const DeviceQuestion(
          id: 'access_logging',
          text: 'Können Sie nachvollziehen, wer wann das Schloss geöffnet hat?',
          hint:
              'Ein Zugriffsverlauf ermöglicht Ihnen, verdächtige Aktivitäten zu erkennen.',
        ),
        const DeviceQuestion(
          id: 'two_factor',
          text:
              'Ist Zwei-Faktor-Authentifizierung (2FA) für das Sperr-Konto verfügbar?',
          hint:
              'BSI-Empfehlung: 2FA schützt Ihr Konto vor unbefugtem Fernzugriff auf das Schloss.',
        ),
      ]);
    } else if (template.deviceType == 'robot') {
      baseQuestions.addAll([
        const DeviceQuestion(
          id: 'map_privacy',
          text:
              'Werden die erstellten Grundrisse lokal gespeichert oder an den Hersteller übermittelt?',
          hint:
              'Grundrisse Ihres Hauses sind sensible Informationen; sie sollten lokal bleiben.',
        ),
        const DeviceQuestion(
          id: 'cloud_required',
          text:
              'Ist eine Cloud-Verbindung für die Grundriss-Navigation erforderlich?',
          hint:
              'Geräte mit lokaler Navigation datenschutzfreundlicher als Varianten, die Cloud brauchen.',
        ),
        const DeviceQuestion(
          id: 'vision_data',
          text:
              'Wenn der Robot Kameras nutzt: Werden die Kamerabilder gespeichert oder übertragen?',
          hint:
              'Kamerabilder sollten nur lokal für Navigation verwendet, nicht gespeichert oder gesendet werden.',
        ),
      ]);
    } else if (template.deviceType == 'toy') {
      baseQuestions.addAll([
        const DeviceQuestion(
          id: 'parental_control',
          text:
              'Gibt es Elternkontroll-Funktionen zur Verwaltung des Spielzeugs?',
          hint:
              'Elternkontrolle sollte ermöglichen, Kontakte und Funktionen zu beschränken.',
        ),
        const DeviceQuestion(
          id: 'child_data_limits',
          text:
              'Können Sie einschränken, welche persönlichen Daten das Spielzeug sammelt?',
          hint:
              'Kinder-spezifische Geräte sollten minimale Datenmenge erfassen und speichern.',
        ),
        const DeviceQuestion(
          id: 'recording_disable',
          text:
              'Können Sie Audio- und Videoaufnahmen auf dem Gerät deaktivieren?',
          hint:
              'BSI-Empfehlung: Aufnahmen von Kindern sollten nur mit expliziter Kontrolle möglich sein.',
        ),
      ]);
    }

    // Add camera/microphone specific questions if applicable
    if (template.hasCamera) {
      baseQuestions.add(
        const DeviceQuestion(
          id: 'camera_consent',
          text:
              'Filmt die Kamera nur Bereiche, für die alle Betroffenen ihr Einverständnis gegeben haben?',
          hint:
              'Kameras in Gemeinschafts- oder Privatbereichen bedürfen der Zustimmung aller Bewohner.',
        ),
      );
    }
    if (template.hasMicrophone) {
      baseQuestions.add(
        const DeviceQuestion(
          id: 'mic_active',
          text:
              'Deaktivieren Sie das Mikrofon, wenn Sie es nicht aktiv nutzen?',
          hint:
              'Smarte Lautsprecher und Geräte mit Mikrofonen können versehentlich aktiviert werden.',
        ),
      );
    }

    return baseQuestions;
  }

  /// Device-specific privacy actions based on BSI recommendations
  static List<PrivacyAction> getDeviceSpecificActions(DeviceTemplate template) {
    final actions = <PrivacyAction>[];

    // General security actions for all devices
    if (template.deviceType == 'speaker') {
      actions.addAll([
        const PrivacyAction(
          title: 'Sprachaufzeichnungen löschen',
          description:
              'BSI-Empfehlung: Löschen Sie regelmäßig (monatlich) Ihre Sprachaufzeichnungen im Hersteller-Konto. Dies reduziert das Risiko bei Kontohack oder Datenbreach.',
          type: ActionType.technical,
          priority: ActionPriority.high,
          deviceType: 'speaker',
        ),
        const PrivacyAction(
          title: 'Skills/Fähigkeiten überprüfen und einschränken',
          description:
              'Überprüfen Sie, welche Drittanbieter-Skills/Fähigkeiten Zugriff auf Ihr Konto haben. Deaktivieren Sie unnötige Skills; diese könnten auf Ihre Daten zugreifen.',
          type: ActionType.technical,
          priority: ActionPriority.medium,
          deviceType: 'speaker',
        ),
        const PrivacyAction(
          title: 'Sprachverarbeitung lokal aktivieren (falls verfügbar)',
          description:
              'Suchen Sie in den Geräteinstellungen nach Optionen für lokale Verarbeitung (z. B. „Local Voice Processing" bei Amazon Alexa). Dies verhindert Cloud-Verarbeitung.',
          type: ActionType.technical,
          priority: ActionPriority.high,
          deviceType: 'speaker',
        ),
      ]);
    } else if (template.deviceType == 'camera') {
      actions.addAll([
        const PrivacyAction(
          title: 'WLAN-Verschlüsselung (WPA2/WPA3) prüfen',
          description:
              'BSI-Empfehlung: Verwenden Sie WPA2 oder WPA3 für Ihr Heimnetz. WEP und WPA sind veraltet und unsicher. Kamera-Verbindung sollte verschlüsselt sein.',
          type: ActionType.technical,
          priority: ActionPriority.high,
          deviceType: 'camera',
        ),
        const PrivacyAction(
          title: 'Speicherort der Aufnahmen klären',
          description:
              'Finden Sie heraus, ob Aufnahmen lokal auf SD-Karte oder in der Cloud gespeichert werden. Bevorzugen Sie lokale Speicherung; falls Cloud: regelmäßig überprüfen und löschen.',
          type: ActionType.social,
          priority: ActionPriority.high,
          deviceType: 'camera',
        ),
        const PrivacyAction(
          title: 'Zugriffsrechte der Kamera periodisch überprüfen',
          description:
              'Überprüfen Sie monatlich in der Hersteller-App, wer auf Live-View und Aufnahmen zugreifen kann. Entfernen Sie Zugriffe ehemaliger Haushaltsmitglieder sofort.',
          type: ActionType.social,
          priority: ActionPriority.high,
          deviceType: 'camera',
        ),
        const PrivacyAction(
          title: 'Bewegungserkennung zeitlich planen',
          description:
              'Falls möglich, aktivieren Sie Bewegungserkennung nur in Abwesenheitszeiten. Dies reduziert unnötige Aufnahmen und Speichernutzung.',
          type: ActionType.technical,
          priority: ActionPriority.medium,
          deviceType: 'camera',
        ),
        const PrivacyAction(
          title: 'Physische Sicherheit beachten',
          description:
              'BSI-Empfehlung: Stellen Sie sicher, dass Außenkameras nicht von Fremden manipuliert, abgeklebt oder gestohlen werden können. Anbringung überprüfen.',
          type: ActionType.security,
          priority: ActionPriority.high,
          deviceType: 'camera',
        ),
      ]);
    } else if (template.deviceType == 'tv') {
      actions.addAll([
        const PrivacyAction(
          title: 'Tracking und Werbe-Optionen deaktivieren',
          description:
              'Gehen Sie in die Datenschutzeinstellungen und deaktivieren Sie „Tracking" und „Interest-Based Ads". Dies verhindert, dass Ihre Sehgewohnheiten gesammelt werden.',
          type: ActionType.technical,
          priority: ActionPriority.medium,
          deviceType: 'tv',
        ),
        const PrivacyAction(
          title: 'Offline-Nutzung bevorzugen',
          description:
              'Nutzen Sie Ihr Smart-TV über HDMI für externe Quellen (Media-Player, Konsolen) oder lokale Speicherung. Dies vermeidet Cloud-Tracking Ihrer Inhalte.',
          type: ActionType.social,
          priority: ActionPriority.medium,
          deviceType: 'tv',
        ),
      ]);
    } else if (template.deviceType == 'thermostat') {
      actions.addAll([
        const PrivacyAction(
          title: 'Datenerfassung in Sicherheit/Datenschutz prüfen',
          description:
              'Überprüfen Sie die Thermostat-App und klären Sie: Werden Temperaturhistorien und Zeitpläne an den Hersteller gesendet? Falls ja: deaktivieren, wenn möglich.',
          type: ActionType.social,
          priority: ActionPriority.high,
          deviceType: 'thermostat',
        ),
        const PrivacyAction(
          title: 'Lokale Automatisierung einrichten (ohne Cloud)',
          description:
              'Viele moderne Thermostats unterstützen lokale Zeit- und Temperaturpläne. Nutzen Sie diese statt Cloud-basierte Zeitpläne, um Daten lokal zu halten.',
          type: ActionType.technical,
          priority: ActionPriority.medium,
          deviceType: 'thermostat',
        ),
      ]);
    } else if (template.deviceType == 'lock') {
      actions.addAll([
        const PrivacyAction(
          title: 'Zwei-Faktor-Authentifizierung (2FA) aktivieren',
          description:
              'BSI-Empfehlung: Aktivieren Sie 2FA für Ihr Schlosskonto. Dies verhindert, dass Hacker Ihr Schloss ferngesteuert öffnen können, selbst wenn Ihr Passwort bekannt ist.',
          type: ActionType.technical,
          priority: ActionPriority.high,
          deviceType: 'lock',
        ),
        const PrivacyAction(
          title: 'Notfall-Zugang vorbereiten',
          description:
              'Erstellen Sie Notfall-Codes oder bewahren Sie einen Backup-Schlüssel sicher auf. Dies hilft bei Internet- oder Stromausfällen und technischen Problemen.',
          type: ActionType.security,
          priority: ActionPriority.high,
          deviceType: 'lock',
        ),
        const PrivacyAction(
          title: 'Regelmäßige Zugriffsprotokolle überprüfen',
          description:
              'Überprüfen Sie wöchentlich, wer das Schloss geöffnet hat. Verdächtige Einträge könnten auf Sicherheitsprobleme oder unbefugten Zugang hinweisen.',
          type: ActionType.security,
          priority: ActionPriority.medium,
          deviceType: 'lock',
        ),
      ]);
    } else if (template.deviceType == 'robot') {
      actions.addAll([
        const PrivacyAction(
          title: 'Grundriss-Speicherung klären',
          description:
              'Überprüfen Sie die Saugroboter-App: Werden erstellte Grundrisse lokal oder in der Cloud gespeichert? Bevorzugen Sie lokale Speicherung oder löschen Sie Cloud-Kopien regelmäßig.',
          type: ActionType.social,
          priority: ActionPriority.high,
          deviceType: 'robot',
        ),
        const PrivacyAction(
          title: 'Offline-Betrieb priorisieren',
          description:
              'Falls verfügbar: Nutzen Sie den Offline-Modus des Roboters, um Grundrisse und Navigationsdaten lokal zu speichern statt in der Cloud.',
          type: ActionType.technical,
          priority: ActionPriority.medium,
          deviceType: 'robot',
        ),
      ]);
    } else if (template.deviceType == 'wearable') {
      actions.addAll([
        const PrivacyAction(
          title: 'Gesundheitsdaten-Sharing begrenzen',
          description:
              'Überprüfen Sie in der Wearable-App, welche Drittanbieter (z. B. Versicherungen, Fitness-Apps) Zugriff auf Ihre Gesundheitsdaten haben. Entfernen Sie unnötige Verbindungen.',
          type: ActionType.technical,
          priority: ActionPriority.high,
          deviceType: 'wearable',
        ),
        const PrivacyAction(
          title: 'Standortverfolgung deaktivieren (falls nicht benötigt)',
          description:
              'Falls das Wearable über GPS verfügt und Sie Standortverfolgung nicht benötigen, deaktivieren Sie es. Dies spart Akkulaufzeit und Datenschutz.',
          type: ActionType.technical,
          priority: ActionPriority.medium,
          deviceType: 'wearable',
        ),
      ]);
    } else if (template.deviceType == 'toy') {
      actions.addAll([
        const PrivacyAction(
          title: 'Elternkontrolle vollständig konfigurieren',
          description:
              'BSI-Empfehlung: Richtet Sie umfassende Elternkontrolle ein. Beschränken Sie Kontakte, Funktionen und Datenerfassung auf das Nötigste.',
          type: ActionType.social,
          priority: ActionPriority.high,
          deviceType: 'toy',
        ),
        const PrivacyAction(
          title: 'Aufnahmen deaktivieren, wenn nicht verwendet',
          description:
              'Falls das Spielzeug ein Mikrofon hat: Deaktivieren Sie es, wenn das Kind damit nicht aktiv spielt. Manuelles Stummschalten ist besser als Sprachaktivierung.',
          type: ActionType.security,
          priority: ActionPriority.high,
          deviceType: 'toy',
        ),
      ]);
    }

    return actions;
  }

  // General recommendations always shown on the summary screen
  static const List<String> generalRecommendations = [
    'Richten Sie ein separates WLAN nur für Smart-Home-Geräte ein (z. B. Gastnetz Ihres Routers).',
    'Nutzen Sie einen Passwortmanager und vergeben Sie für jedes Gerät ein einzigartiges, starkes Passwort.',
    'Aktivieren Sie Mehrfaktor-Authentifizierung (MFA) für alle Hersteller-Konten.',
    'Legen Sie im Haushalt fest, wer für Updates, Backups und Konten verantwortlich ist.',
    'Überprüfen Sie regelmäßig (mind. 1× pro Quartal) alle Zugriffsberechtigungen und Konten.',
    'Entsorgen Sie alte Geräte datenschutzgerecht: Werksreset durchführen und aus der Hersteller-Cloud austragen.',
    'Nutzen Sie das Konsens-Protokoll, bevor Sie neue Geräte kaufen – beziehen Sie alle Haushaltsmitglieder ein.',
  ];
}
