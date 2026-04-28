import 'package:flutter/material.dart';

enum RiskLevel { low, medium, high }

enum ActionType { social, technical, security }

enum ActionPriority { high, medium, low }

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
    this.deviceType =
        'general', // speaker, camera, tv, thermostat, light, lock, etc.
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
  final String instanceId;
  final DeviceTemplate template;
  final String roomId;
  final String roomName;

  bool? passwordChanged;
  bool? autoUpdatesEnabled;
  bool? separateNetwork;
  bool? householdInformed;
  bool? permissionsReduced;
  bool? cameraConsentGiven;
  bool? micDeactivatedWhenUnused;

  // Store device-specific question answers
  final Map<String, bool> deviceSpecificAnswers = {};

  DeviceInstance({
    required this.instanceId,
    required this.template,
    required this.roomId,
    required this.roomName,
  });

  List<DeviceQuestion> get questions {
    // Simple sensors typically have no app, dedicated password, or software updates,
    // so they use a tailored question set focused on data minimisation.
    if (template.deviceType == 'sensor') {
      return const [
        DeviceQuestion(
          id: 'sensor_informed',
          text:
              'Sind alle Personen im Haushalt über diesen Sensor und seine Funktion informiert?',
          hint:
              'Alle Mitbewohnenden sollten wissen, welche Daten der Sensor erfasst.',
        ),
        DeviceQuestion(
          id: 'sensor_network',
          text:
              'Ist der Sensor in einem separaten Smart-Home- oder IoT-WLAN eingebunden (sofern netzwerkfähig)?',
          hint:
              'Ein eigenes Netz für smarte Geräte schützt Ihr restliches Heimnetzwerk.',
        ),
        DeviceQuestion(
          id: 'sensor_frequency',
          text:
              'Können Sie das Messintervall des Sensors reduzieren (z. B. seltener messen)?',
          hint:
              'Eine niedrigere Messfrequenz erzeugt weniger Daten und schränkt Rückschlüsse auf Ihr Verhalten ein.',
        ),
        DeviceQuestion(
          id: 'sensor_data_deletion',
          text: 'Werden ältere Messwerte automatisch oder auf Wunsch gelöscht?',
          hint:
              'Alte Verlaufsdaten sollten nicht dauerhaft gespeichert bleiben. Prüfen Sie die Aufbewahrungszeit in den Einstellungen.',
        ),
        DeviceQuestion(
          id: 'sensor_granularity',
          text:
              'Zeigt das System die Sensordaten nur in zusammengefasster Form an (z. B. Tages- statt Minutenwerte)?',
          hint:
              'Weniger granulare Anzeigen schützen vor Rückschlüssen auf genaue Anwesenheits- oder Verhaltensmuster.',
        ),
        DeviceQuestion(
          id: 'sensor_local',
          text:
              'Werden die Messdaten lokal verarbeitet und gespeichert, ohne in eine Cloud übertragen zu werden?',
          hint:
              'Lokale Verarbeitung verhindert, dass der Hersteller Einblick in Ihre Messwerte erhält.',
        ),
      ];
    }

    final q = <DeviceQuestion>[
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

    // Device-specific questions based on device type
    if (template.deviceType == 'speaker') {
      q.addAll([
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
      q.addAll([
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
              'Werden Aufnahmen lokal gespeichert (nicht ausschließlich in der Cloud des Anbieters)?',
          hint:
              'Lokale Speicherung gibt Ihnen mehr Kontrolle über Ihre Daten; bei reiner Cloud-Speicherung sind Sie auf die Sicherheit des Anbieters angewiesen.',
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
      q.addAll([
        const DeviceQuestion(
          id: 'account_required',
          text:
              'Können Sie das Gerät ohne obligatorisches Online-Konto nutzen?',
          hint:
              'Pflichtkonten ermöglichen dem Hersteller Werbe-Tracking und das Speichern Ihrer Sehgewohnheiten. Ein kontoloser Betrieb schützt Ihre Privatsphäre.',
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
      q.addAll([
        const DeviceQuestion(
          id: 'data_collection',
          text:
              'Bleiben Ihre Temperatur-Historien und Zeitpläne auf dem Gerät (keine Übertragung an den Hersteller)?',
          hint:
              'Historien können Anwesenheitsmuster und Lebensgewohnheiten offenbaren. Lokale Speicherung schützt vor unerwünschter Auswertung.',
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
      q.addAll([
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
              'Haben Sie die Erfassung von Schaltmustern und Nutzungszeiten durch den Hersteller deaktiviert oder eingeschränkt?',
          hint:
              'Nutzungsmuster können Ihre Anwesenheit und Gewohnheiten offenbaren. Prüfen Sie die Datenschutzeinstellungen der App.',
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
      q.addAll([
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
      q.addAll([
        const DeviceQuestion(
          id: 'map_privacy',
          text:
              'Werden die erstellten Grundrisse ausschließlich lokal auf dem Gerät gespeichert?',
          hint:
              'Grundrisse Ihres Hauses sind sensible Informationen und sollten nicht an den Hersteller übermittelt werden.',
        ),
        const DeviceQuestion(
          id: 'cloud_required',
          text:
              'Funktioniert die Grundriss-Navigation auch ohne Cloud-Verbindung?',
          hint:
              'Geräte mit lokaler Navigation sind datenschutzfreundlicher, da keine Raumdaten in die Cloud übertragen werden.',
        ),
        const DeviceQuestion(
          id: 'vision_data',
          text:
              'Wenn der Roboter Kameras nutzt: Werden die Kamerabilder ausschließlich lokal für die Navigation verwendet (kein Speichern oder Übertragen)?',
          hint:
              'Kamerabilder sollten nur lokal für die Navigation verarbeitet und weder gespeichert noch an den Hersteller gesendet werden.',
        ),
      ]);
    } else if (template.deviceType == 'toy') {
      q.addAll([
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
    } else if (template.deviceType == 'wearable') {
      q.addAll([
        const DeviceQuestion(
          id: 'health_sharing',
          text:
              'Können Sie steuern, welche Drittanbieter Zugriff auf Ihre Gesundheitsdaten haben?',
          hint:
              'Gesundheitsdaten sind sensibel. Nur autorisierte Apps sollten Zugriff erhalten.',
        ),
        const DeviceQuestion(
          id: 'location_tracking',
          text:
              'Können Sie Standortverfolgung deaktivieren, wenn Sie sie nicht benötigen?',
          hint:
              'GPS-Tracking verbraucht Akku und kann Ihre Bewegungsmuster offenbaren.',
        ),
      ]);
    }

    if (template.hasCamera) {
      q.add(
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
      q.add(
        const DeviceQuestion(
          id: 'mic_active',
          text:
              'Deaktivieren Sie das Mikrofon, wenn Sie es nicht aktiv nutzen?',
          hint:
              'Smarte Lautsprecher und Geräte mit Mikrofonen können versehentlich aktiviert werden.',
        ),
      );
    }

    return q;
  }

  bool? answerFor(String questionId) {
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

  void setAnswer(String questionId, bool value) {
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
      deviceSpecificAnswers[questionId] = value;
    }
  }

  bool get isFullyAnswered => questions.every((q) => answerFor(q.id) != null);

  bool get allAnswersPositive =>
      questions.every((q) => answerFor(q.id) == true);

  int get riskScore {
    int score = template.baseRiskScore;
    if (passwordChanged == false) score += 20;
    if (autoUpdatesEnabled == false) score += 15;
    if (separateNetwork == false) score += 10;
    if (householdInformed == false) score += 10;
    if (permissionsReduced == false) score += 5;
    if (template.hasCamera && cameraConsentGiven == false) score += 15;
    if (template.hasMicrophone && micDeactivatedWhenUnused == false) {
      score += 10;
    }

    // Penalties for device-specific questions
    for (final entry in deviceSpecificAnswers.entries) {
      if (entry.value == false) {
        score += 8;
      }
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
      return 'Sie haben alle Fragen positiv beantwortet. Dennoch bleibt das Grundrisiko bei Kameras höher, weil sie besonders sensible Beobachtungsdaten erfassen und bei Fehlkonfiguration zur Überwachung genutzt werden können.';
    }
    if (template.deviceType == 'speaker' || template.hasMicrophone) {
      return 'Sie haben alle Fragen positiv beantwortet. Dennoch bleibt das Grundrisiko bei Geräten mit Mikrofon erhöht, da Sprachdaten sehr sensibel sind und Fehlaktivierungen bzw. Cloud-Verarbeitung weiterhin Risiken bergen.';
    }
    if (template.deviceType == 'lock') {
      return 'Sie haben alle Fragen positiv beantwortet. Dennoch bleibt bei smarten Schlössern ein erhöhtes Grundrisiko, da ein möglicher Missbrauch direkt den physischen Zugang zur Wohnung betrifft.';
    }

    return 'Sie haben alle Fragen positiv beantwortet. Das Gerät bleibt trotzdem im mittleren/hohen Bereich, weil bereits die Art des Geräts sensible Nutzungs- und Verhaltensdaten offenlegen kann.';
  }

  List<PrivacyAction> get suggestedActions {
    final actions = <PrivacyAction>[];
    if (passwordChanged == false) {
      actions.add(
        const PrivacyAction(
          title: 'Standard-Passwort ändern',
          description:
              'Ersetzen Sie das voreingestellte Passwort durch ein starkes, einzigartiges Passwort. Nutzen Sie einen Passwortmanager.',
          type: ActionType.technical,
          priority: ActionPriority.high,
        ),
      );
    }
    if (autoUpdatesEnabled == false) {
      actions.add(
        const PrivacyAction(
          title: 'Automatische Updates aktivieren',
          description:
              'Aktivieren Sie automatische Sicherheits-Updates in den Geräte- oder App-Einstellungen.',
          type: ActionType.technical,
          priority: ActionPriority.high,
        ),
      );
    }
    if (separateNetwork == false) {
      actions.add(
        const PrivacyAction(
          title: 'Separates IoT-WLAN einrichten',
          description:
              'Richten Sie ein eigenes WLAN für Smart-Home-Geräte ein, z. B. über die Gastnetz-Funktion Ihres Routers.',
          type: ActionType.technical,
          priority: ActionPriority.medium,
        ),
      );
    }
    if (householdInformed == false) {
      actions.add(
        const PrivacyAction(
          title: 'Haushaltsmitglieder informieren',
          description:
              'Informieren Sie alle Bewohner: welche Daten das Gerät erfasst, wer Zugriff hat und wie es sich deaktivieren lässt.',
          type: ActionType.social,
          priority: ActionPriority.medium,
        ),
      );
    }
    if (permissionsReduced == false) {
      actions.add(
        const PrivacyAction(
          title: 'App-Berechtigungen einschränken',
          description:
              'Prüfen Sie in den Smartphone-Einstellungen die Berechtigungen der zugehörigen App und deaktivieren Sie nicht benötigte.',
          type: ActionType.technical,
          priority: ActionPriority.medium,
        ),
      );
    }
    if (template.hasCamera && cameraConsentGiven == false) {
      actions.add(
        const PrivacyAction(
          title: 'Kameraausrichtung mit Bewohnern abstimmen',
          description:
              'Holen Sie das Einverständnis aller Betroffenen ein. Die Kamera darf keine Bereiche ohne Zustimmung erfassen.',
          type: ActionType.social,
          priority: ActionPriority.high,
        ),
      );
    }
    if (template.hasMicrophone && micDeactivatedWhenUnused == false) {
      actions.add(
        const PrivacyAction(
          title: 'Mikrofon bei Nichtnutzung deaktivieren',
          description:
              'Nutzen Sie den physischen Stummschalter oder deaktivieren Sie das Mikrofon in den Einstellungen.',
          type: ActionType.technical,
          priority: ActionPriority.high,
        ),
      );
    }

    // Add device-specific actions
    if (template.deviceType == 'speaker') {
      if (deviceSpecificAnswers['voice_history'] == false) {
        actions.add(
          const PrivacyAction(
            title: 'Sprachaufzeichnungen löschen',
            description:
                'BSI-Empfehlung: Löschen Sie regelmäßig (monatlich) Ihre Sprachaufzeichnungen im Hersteller-Konto.',
            type: ActionType.technical,
            priority: ActionPriority.high,
            deviceType: 'speaker',
          ),
        );
      }
      if (deviceSpecificAnswers['skills_permissions'] == false) {
        actions.add(
          const PrivacyAction(
            title: 'Skills/Fähigkeiten überprüfen',
            description:
                'Überprüfen Sie, welche Drittanbieter-Skills Zugriff haben. Deaktivieren Sie unnötige Skills.',
            type: ActionType.technical,
            priority: ActionPriority.medium,
            deviceType: 'speaker',
          ),
        );
      }
    } else if (template.deviceType == 'camera') {
      if (deviceSpecificAnswers['video_encryption'] == false) {
        actions.add(
          const PrivacyAction(
            title: 'WLAN-Verschlüsselung prüfen',
            description:
                'BSI-Empfehlung: Verwenden Sie WPA2 oder WPA3 für Ihr Heimnetz. WEP und WPA sind veraltet.',
            type: ActionType.technical,
            priority: ActionPriority.high,
            deviceType: 'camera',
          ),
        );
      }
      if (deviceSpecificAnswers['sharing_restrictions'] == false) {
        actions.add(
          const PrivacyAction(
            title: 'Zugriffsrechte der Kamera überprüfen',
            description:
                'Überprüfen Sie monatlich in der App, wer auf Live-View und Aufnahmen zugreifen kann.',
            type: ActionType.social,
            priority: ActionPriority.high,
            deviceType: 'camera',
          ),
        );
      }
    } else if (template.deviceType == 'lock') {
      if (deviceSpecificAnswers['two_factor'] == false) {
        actions.add(
          const PrivacyAction(
            title: 'Zwei-Faktor-Authentifizierung aktivieren',
            description:
                'BSI-Empfehlung: Aktivieren Sie 2FA für Ihr Schlosskonto um Remote-Zugriffe zu schützen.',
            type: ActionType.technical,
            priority: ActionPriority.high,
            deviceType: 'lock',
          ),
        );
      }
    } else if (template.deviceType == 'robot') {
      if (deviceSpecificAnswers['map_privacy'] == false) {
        actions.add(
          const PrivacyAction(
            title: 'Grundriss-Speicherung klären',
            description:
                'Überprüfen Sie: Werden Grundrisse lokal oder in der Cloud gespeichert? Bevorzugen Sie lokal.',
            type: ActionType.social,
            priority: ActionPriority.high,
            deviceType: 'robot',
          ),
        );
      }
    }

    return actions;
  }
}
