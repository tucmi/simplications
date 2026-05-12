import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

enum RiskLevel { low, medium, high }

enum ActionType { social, technical, security }

enum ActionPriority { high, medium, low }

enum QuestionAnswer { yes, no, dontKnow, notApplicable }

class DeviceDomainI18n {
  static const Map<String, String> _deToEn = {
    'Wohnzimmer': 'Living room',
    'Küche': 'Kitchen',
    'Schlafzimmer': 'Bedroom',
    'Kinderzimmer': "Child's bedroom",
    'Badezimmer': 'Bathroom',
    'Arbeitszimmer': 'Office',
    'Flur / Eingang': 'Hallway / Entrance',
    'Garten / Außenbereich': 'Garden / Outdoor area',
    'Keller / Speisekammer': 'Basement / Pantry',
    'Ganze Wohnung': 'Entire home',
    'Einfacher Sensor (z. B. Bewegungs- oder Türsensor)':
        'Basic sensor (e.g., motion or door sensor)',
    'Feuchtigkeitssensor': 'Humidity sensor',
    'Temperatursensor': 'Temperature sensor',
    'Lichtsensor': 'Light sensor',
    'Smart Speaker / Sprachassistent': 'Smart speaker / voice assistant',
    'Smart Display (z. B. Nest Hub)': 'Smart display (e.g., Nest Hub)',
    'Smart TV': 'Smart TV',
    'Smarte Innenkamera': 'Smart indoor camera',
    'Smarte Außenkamera': 'Smart outdoor camera',
    'Smarte Türklingel mit Kamera': 'Smart doorbell with camera',
    'Babymonitor / Babykamera': 'Baby monitor / baby camera',
    'Saugroboter': 'Robot vacuum',
    'Smarter Kühlschrank': 'Smart fridge',
    'Smarter Backofen / Herd': 'Smart oven / stove',
    'Smarte Kaffeemaschine': 'Smart coffee machine',
    'Smarte Waschmaschine / Trockner': 'Smart washer / dryer',
    'Smarter Thermostat / Heizungssteuerung':
        'Smart thermostat / heating control',
    'Smarte Steckdose': 'Smart plug',
    'Smarte Beleuchtung': 'Smart lighting',
    'Smartes Türschloss': 'Smart door lock',
    'Smarte Jalousie / Rolllade': 'Smart blind / shutter',
    'Fitness-Tracker / Smartwatch': 'Fitness tracker / smartwatch',
    'Smartes Spielzeug': 'Smart toy',
    'Smart Router / Mesh-System': 'Smart router / mesh system',
    'Smart-Home-Hub (z. B. Homey, Home Assistant)':
        'Smart home hub (e.g., Homey, Home Assistant)',
    'Intelligenter Stromzähler / Smart Meter':
        'Intelligent electricity meter / smart meter',
    'Smarte Bewässerungsanlage': 'Smart irrigation system',
    'Smarte Waage': 'Smart scale',
    'Smarter Drucker': 'Smart printer',
    'Richten Sie ein separates WLAN nur für Smart-Home-Geräte ein (z. B. Gastnetz Ihres Routers).':
        'Set up a separate Wi-Fi network for smart home devices (e.g., your router\'s guest network).',
    'Nutzen Sie einen Passwortmanager und vergeben Sie für jedes Gerät ein einzigartiges, starkes Passwort.':
        'Use a password manager and assign a unique, strong password to each device.',
    'Aktivieren Sie Mehrfaktor-Authentifizierung (MFA) für alle Hersteller-Konten.':
        'Enable multi-factor authentication (MFA) for all vendor accounts.',
    'Legen Sie im Haushalt fest, wer für Updates, Backups und Konten verantwortlich ist.':
        'Define who in your household is responsible for updates, backups, and accounts.',
    'Überprüfen Sie regelmäßig (mind. 1× pro Quartal) alle Zugriffsberechtigungen und Konten.':
        'Regularly review (at least once per quarter) all access permissions and accounts.',
    'Entsorgen Sie alte Geräte datenschutzgerecht: Werksreset durchführen und aus der Hersteller-Cloud austragen.':
        'Dispose of old devices in a privacy-safe way: perform a factory reset and remove them from vendor cloud accounts.',
    'Nutzen Sie ein Konsens-Protokoll, bevor Sie neue Geräte kaufen - beziehen Sie alle Haushaltsmitglieder ein.':
        'Use a household consent check before buying new devices and involve all household members.',
    'Haben Sie das Standard-Passwort des Geräts oder des zugehörigen Kontos geändert?':
        'Have you changed the default password of the device or its linked account?',
    'Voreingestellte Passwörter sind oft öffentlich bekannt und leicht zu knacken.':
        'Default passwords are often publicly known and easy to crack.',
    'Sind automatische Sicherheits-Updates für das Gerät aktiviert?':
        'Are automatic security updates enabled for the device?',
    'Updates schließen bekannte Sicherheitslücken zeitnah.':
        'Updates close known security vulnerabilities promptly.',
    'Ist das Gerät in einem separaten Smart-Home- oder IoT-WLAN eingebunden?':
        'Is the device connected to a separate smart home or IoT Wi-Fi network?',
    'Ein eigenes Netz für smarte Geräte schützt Ihr restliches Heimnetzwerk.':
        'A dedicated network for smart devices protects your main home network.',
    'Sind alle Personen im Haushalt über dieses Gerät und seine Funktion informiert?':
        'Are all people in the household informed about this device and its function?',
    'Alle Mitbewohnenden sollten wissen, welche Daten das Gerät erfasst.':
        'All household members should know what data the device captures.',
    'Haben Sie unnötige App-Berechtigungen (z. B. Standort, Kontakte) deaktiviert?':
        'Have you disabled unnecessary app permissions (e.g., location, contacts)?',
    'Nur wirklich benötigte Berechtigungen sollten aktiviert sein.':
        'Only permissions that are truly needed should be enabled.',
    'Deaktivieren Sie das Mikrofon, wenn Sie es nicht aktiv nutzen?':
        'Do you deactivate the microphone when you are not actively using it?',
    'Smarte Lautsprecher und Geräte mit Mikrofonen können versehentlich aktiviert werden.':
        'Smart speakers and devices with microphones can be activated unintentionally.',
    'Können Sie das Messintervall des Sensors reduzieren (z. B. seltener messen)?':
        'Can you reduce the sensor measurement interval (e.g., measure less frequently)?',
    'Eine niedrigere Messfrequenz erzeugt weniger Daten und schränkt Rückschlüsse auf Ihr Verhalten ein.':
        'A lower measurement frequency produces less data and limits inferences about your behavior.',
    'Werden ältere Messwerte automatisch oder auf Wunsch gelöscht?':
        'Are older measurement values deleted automatically or on request?',
    'Alte Verlaufsdaten sollten nicht dauerhaft gespeichert bleiben. Prüfen Sie die Aufbewahrungszeit in den Einstellungen.':
        'Old historical data should not be stored permanently. Check retention settings.',
    'Zeigt das System die Sensordaten nur in zusammengefasster Form an (z. B. Tages- statt Minutenwerte)?':
        'Does the system show sensor data only in aggregated form (e.g., daily instead of minute values)?',
    'Weniger granulare Anzeigen schützen vor Rückschlüssen auf genaue Anwesenheits- oder Verhaltensmuster.':
        'Less granular views help prevent inferences about precise presence or behavior patterns.',
    'Werden die Messdaten lokal verarbeitet und gespeichert, ohne in eine Cloud übertragen zu werden?':
        'Is measurement data processed and stored locally without being transferred to the cloud?',
    'Lokale Verarbeitung verhindert, dass der Hersteller Einblick in Ihre Messwerte erhält.':
        'Local processing prevents the vendor from accessing your measurement data.',
    'Können Sie Sprachaufnahmen aus der Geräte-Historie löschen oder diese Funktion deaktivieren?':
        'Can you delete voice recordings from device history or disable this feature?',
    'BSI-Empfehlung: Minimieren Sie die Speicherung von Aufnahmen oder löschen Sie sie regelmäßig.':
        'BSI recommendation: Minimize recording retention or delete recordings regularly.',
    'Wird die Sprachverarbeitung teilweise lokal auf dem Gerät durchgeführt?':
        'Is voice processing performed partly on the device locally?',
    'Lokale Verarbeitung reduziert die Menge an Daten, die in die Cloud übertragen werden.':
        'Local processing reduces the amount of data sent to the cloud.',
    'Überprüfen Sie regelmäßig, welche Fähigkeiten/Skills Zugriff auf Ihr Konto haben?':
        'Do you regularly review which skills have access to your account?',
    'Skills von Drittanbietern können sensible Daten abfangen. Nur notwendige Skills aktivieren.':
        'Third-party skills can access sensitive data. Enable only necessary skills.',
    'Ist die Videoaufnahme und -übertragung durchgängig verschlüsselt?':
        'Is video recording and transmission encrypted end-to-end?',
    'BSI-Empfehlung: Verschlüsselte Verbindung verhindert Abhören und Datenklau unterwegs.':
        'BSI recommendation: Encrypted connections prevent interception and data theft in transit.',
    'Werden Aufnahmen lokal gespeichert (nicht ausschließlich in der Cloud des Anbieters)?':
        'Are recordings stored locally (not only in the vendor cloud)?',
    'Lokale Speicherung gibt Ihnen mehr Kontrolle über Ihre Daten; bei reiner Cloud-Speicherung sind Sie auf die Sicherheit des Anbieters angewiesen.':
        'Local storage gives you more control over your data; cloud-only storage depends on vendor security.',
    'Können Sie steuern, wer auf die Live-View und Aufnahmen zugreifen kann?':
        'Can you control who can access live view and recordings?',
    'Sie sollten genau kontrollieren können, wer Zugang zu den Videoaufnahmen erhält.':
        'You should be able to precisely control access to video recordings.',
    'Können Sie Bewegungserkennung deaktivieren oder zeitlich begrenzen, wenn Sie zu Hause sind?':
        'Can you disable or schedule motion detection when you are at home?',
    'BSI-Empfehlung: Unnötige Aufnahmen vermeiden reduziert Datenmenge und Missbrauchsrisiko.':
        'BSI recommendation: Avoiding unnecessary recordings reduces data volume and misuse risk.',
    'Können Sie das Gerät ohne obligatorisches Online-Konto nutzen?':
        'Can you use the device without a mandatory online account?',
    'Pflichtkonten ermöglichen dem Hersteller Werbe-Tracking und das Speichern Ihrer Sehgewohnheiten. Ein kontoloser Betrieb schützt Ihre Privatsphäre.':
        'Mandatory accounts enable ad tracking and storage of viewing habits. Account-free use protects privacy.',
    'Können Sie Werbe- und Tracking-Funktionen vollständig deaktivieren?':
        'Can you completely disable advertising and tracking features?',
    'Smart-TVs sammeln oft Daten über Ihre Sehgewohnheiten. Suchen Sie nach Datenschutzoptionen.':
        'Smart TVs often collect viewing habit data. Look for privacy settings.',
    'Können Sie das Gerät über HDMI oder lokale Quellen ohne Internetverbindung nutzen?':
        'Can you use the device via HDMI or local sources without internet?',
    'Offline-Betrieb schützt Ihre Nutzungsdaten vor Übertragung an den Hersteller.':
        'Offline use protects usage data from being sent to the vendor.',
    'Bleiben Ihre Temperatur-Historien und Zeitpläne auf dem Gerät (keine Übertragung an den Hersteller)?':
        'Do temperature history and schedules stay on-device (not sent to the vendor)?',
    'Historien können Anwesenheitsmuster und Lebensgewohnheiten offenbaren. Lokale Speicherung schützt vor unerwünschter Auswertung.':
        'History can reveal presence patterns and habits. Local storage reduces unwanted analysis.',
    'Können Sie das Thermostat auch offline betreiben (ohne Internet)?':
        'Can you operate the thermostat offline (without internet)?',
    'Offline-Betrieb oder lokale Automatisierung schützt Ihre Daten vor Cloud-Zugriff.':
        'Offline operation or local automation protects data from cloud access.',
    'Können Sie steuern, wer die Heizung anpassen darf (z. B. nur Gäste einschränken)?':
        'Can you control who may adjust heating (e.g., restrict guests)?',
    'Haushaltsmitglieder sollten Kontrolle haben, ohne dass Besucher alles ändern können.':
        'Household members should have control without visitors changing everything.',
    'Können Automatisierungen lokal ohne Internetverbindung erfolgen?':
        'Can automations run locally without internet?',
    'Lokale Ausführung von Szenen und Zeitplänen schützt Ihre Privatsphäre besser.':
        'Local scenes and schedules protect your privacy better.',
    'Haben Sie die Erfassung von Schaltmustern und Nutzungszeiten durch den Hersteller deaktiviert oder eingeschränkt?':
        'Have you disabled or limited vendor collection of switching patterns and usage times?',
    'Nutzungsmuster können Ihre Anwesenheit und Gewohnheiten offenbaren. Prüfen Sie die Datenschutzeinstellungen der App.':
        'Usage patterns can reveal presence and habits. Check app privacy settings.',
    'Funktionieren die Geräte noch, wenn die Internet- oder App-Verbindung ausfällt?':
        'Do devices still work if internet or app connection fails?',
    'Zuverlässige lokale Funktion ist wichtig für alltägliche Nutzung und Privatsphäre.':
        'Reliable local operation is important for daily use and privacy.',
    'Können Sie das Schloss auch offline (z. B. mit Code oder Schlüssel) öffnen?':
        'Can you unlock the lock offline (e.g., with code or key)?',
    'Backup-Optionen verhindern Aussperrung bei Internet- oder Stromausfällen.':
        'Backup options prevent lockout during internet or power outages.',
    'Können Sie nachvollziehen, wer wann das Schloss geöffnet hat?':
        'Can you track who opened the lock and when?',
    'Ein Zugriffsverlauf ermöglicht Ihnen, verdächtige Aktivitäten zu erkennen.':
        'An access log helps you detect suspicious activity.',
    'Ist Zwei-Faktor-Authentifizierung (2FA) für das Sperr-Konto verfügbar?':
        'Is two-factor authentication (2FA) available for the lock account?',
    'BSI-Empfehlung: 2FA schützt Ihr Konto vor unbefugtem Fernzugriff auf das Schloss.':
        'BSI recommendation: 2FA protects your account from unauthorized remote access.',
    'Werden die erstellten Grundrisse ausschließlich lokal auf dem Gerät gespeichert?':
        'Are created floor plans stored exclusively on the device locally?',
    'Grundrisse Ihres Hauses sind sensible Informationen und sollten nicht an den Hersteller übermittelt werden.':
        'Home floor plans are sensitive information and should not be sent to the vendor.',
    'Funktioniert die Grundriss-Navigation auch ohne Cloud-Verbindung?':
        'Does floor-plan navigation work without cloud connection?',
    'Geräte mit lokaler Navigation sind datenschutzfreundlicher, da keine Raumdaten in die Cloud übertragen werden.':
        'Devices with local navigation are more privacy-friendly because no room data is uploaded.',
    'Wenn der Roboter Kameras nutzt: Werden die Kamerabilder ausschließlich lokal für die Navigation verwendet (kein Speichern oder Übertragen)?':
        'If the robot uses cameras: are camera images used locally only for navigation (no storing or transfer)?',
    'Kamerabilder sollten nur lokal für die Navigation verarbeitet und weder gespeichert noch an den Hersteller gesendet werden.':
        'Camera images should be processed locally for navigation and neither stored nor sent to the vendor.',
    'Gibt es Elternkontroll-Funktionen zur Verwaltung des Spielzeugs?':
        'Are there parental control features to manage the toy?',
    'Elternkontrolle sollte ermöglichen, Kontakte und Funktionen zu beschränken.':
        'Parental controls should allow restricting contacts and features.',
    'Können Sie einschränken, welche persönlichen Daten das Spielzeug sammelt?':
        'Can you limit which personal data the toy collects?',
    'Kinder-spezifische Geräte sollten minimale Datenmenge erfassen und speichern.':
        'Child-focused devices should collect and store minimal data.',
    'Können Sie Audio- und Videoaufnahmen auf dem Gerät deaktivieren?':
        'Can you disable audio and video recording on the device?',
    'BSI-Empfehlung: Aufnahmen von Kindern sollten nur mit expliziter Kontrolle möglich sein.':
        'BSI recommendation: Recordings of children should only be possible with explicit control.',
    'Können Sie steuern, welche Drittanbieter Zugriff auf Ihre Gesundheitsdaten haben?':
        'Can you control which third parties can access your health data?',
    'Gesundheitsdaten sind sensibel. Nur autorisierte Apps sollten Zugriff erhalten.':
        'Health data is sensitive. Only authorized apps should have access.',
    'Können Sie Standortverfolgung deaktivieren, wenn Sie sie nicht benötigen?':
        'Can you disable location tracking when not needed?',
    'GPS-Tracking verbraucht Akku und kann Ihre Bewegungsmuster offenbaren.':
        'GPS tracking uses battery and can reveal movement patterns.',
    'Sie haben alle Fragen positiv beantwortet. Dennoch bleibt das Grundrisiko bei Kameras höher, weil sie besonders sensible Beobachtungsdaten erfassen und bei Fehlkonfiguration zur Überwachung genutzt werden können.':
        'You answered all questions positively. However, baseline risk remains higher for cameras because they capture highly sensitive observation data and can be misused for surveillance if misconfigured.',
    'Sie haben alle Fragen positiv beantwortet. Dennoch bleibt das Grundrisiko bei Geräten mit Mikrofon erhöht, da Sprachdaten sehr sensibel sind und Fehlaktivierungen bzw. Cloud-Verarbeitung weiterhin Risiken bergen.':
        'You answered all questions positively. However, baseline risk remains elevated for microphone devices because voice data is highly sensitive and accidental activation or cloud processing still carries risks.',
    'Sie haben alle Fragen positiv beantwortet. Dennoch bleibt bei smarten Schlössern ein erhöhtes Grundrisiko, da ein möglicher Missbrauch direkt den physischen Zugang zur Wohnung betrifft.':
        'You answered all questions positively. However, smart locks still have elevated baseline risk because misuse directly affects physical access to your home.',
    'Sie haben alle Fragen positiv beantwortet. Dennoch bleibt im Kinderzimmer ein erhöhtes Grundrisiko, da dort häufig besonders sensible Daten zu Kindern und ihrem Alltag betroffen sind.':
        'You answered all questions positively. However, baseline risk remains elevated in a child\'s bedroom because especially sensitive data about children and their daily life can be affected there.',
    'Sie haben alle Fragen positiv beantwortet. Das Gerät bleibt trotzdem im mittleren/hohen Bereich, weil bereits die Art des Geräts sensible Nutzungs- und Verhaltensdaten offenlegen kann.':
        'You answered all questions positively. The device can still remain medium/high risk because its type may reveal sensitive usage and behavior data.',
    'Geräteeinstellungen besser kennenlernen':
        'Get to know device settings better',
    'Mindestens eine Frage wurde mit "Weiß ich nicht" beantwortet. Prüfen Sie die Einstellungen und Dokumentation Ihres Geräts, damit Sie Risiken künftig gezielt reduzieren können.':
        'At least one question was answered with "I don\'t know". Review your device settings and documentation to reduce risk more effectively.',
    'Grundrisiko des Gerätetyps': 'Baseline risk of device type',
    'Erhöhte Sensibilität: Kinderzimmer':
        'Increased sensitivity: child\'s bedroom',
    'Standard-Passwort nicht geändert': 'Default password not changed',
    'Automatische Updates nicht aktiv': 'Automatic updates not enabled',
    'Kein separates IoT-WLAN eingerichtet': 'No separate IoT Wi-Fi configured',
    'Haushaltsmitglieder nicht informiert': 'Household members not informed',
    'App-Berechtigungen nicht reduziert': 'App permissions not reduced',
    'Kein Einverständnis für Kamerabereich':
        'No consent for camera-covered area',
    'Mikrofon nicht bei Nichtnutzung deaktiviert':
        'Microphone not disabled when unused',
    'Pflichtdkonto beim Hersteller nötig': 'Mandatory vendor account required',
    'Daten in die Cloud übertragen': 'Data transferred to cloud',
    'Elternkontrolle nicht eingerichtet': 'Parental controls not configured',
    'Datenmenge nicht eingeschränkt': 'Data collection not limited',
    'Aufnahmen nicht deaktivierbar': 'Recording cannot be disabled',
    'Gesundheitsdaten mit Dritten geteilt':
        'Health data shared with third parties',
    'Standortverfolgung aktiv': 'Location tracking enabled',
    'Standard-Passwort ändern': 'Change default password',
    'Ersetzen Sie das voreingestellte Passwort durch ein starkes, einzigartiges Passwort. Nutzen Sie einen Passwortmanager.':
        'Replace the default password with a strong, unique password. Use a password manager.',
    'Automatische Updates aktivieren': 'Enable automatic updates',
    'Aktivieren Sie automatische Sicherheits-Updates in den Geräte- oder App-Einstellungen.':
        'Enable automatic security updates in device or app settings.',
    'Separates IoT-WLAN einrichten': 'Set up separate IoT Wi-Fi',
    'Richten Sie ein eigenes WLAN für Smart-Home-Geräte ein, z. B. über die Gastnetz-Funktion Ihres Routers.':
        'Set up a dedicated Wi-Fi network for smart home devices, for example with your router\'s guest network.',
    'Haushaltsmitglieder informieren': 'Inform household members',
    'Informieren Sie alle Bewohner: welche Daten das Gerät erfasst, wer Zugriff hat und wie es sich deaktivieren lässt.':
        'Inform all residents about what data the device collects, who has access, and how it can be disabled.',
    'App-Berechtigungen einschränken': 'Restrict app permissions',
    'Prüfen Sie in den Smartphone-Einstellungen die Berechtigungen der zugehörigen App und deaktivieren Sie nicht benötigte.':
        'Check companion-app permissions in phone settings and disable unnecessary ones.',
    'Kameraausrichtung mit Bewohnern abstimmen':
        'Align camera positioning with residents',
    'Holen Sie das Einverständnis aller Betroffenen ein. Die Kamera darf keine Bereiche ohne Zustimmung erfassen.':
        'Obtain consent from everyone affected. The camera must not record areas without consent.',
    'Mikrofon bei Nichtnutzung deaktivieren':
        'Disable microphone when not in use',
    'Nutzen Sie den physischen Stummschalter oder deaktivieren Sie das Mikrofon in den Einstellungen.':
        'Use the physical mute switch or disable the microphone in settings.',
    'Messintervall reduzieren': 'Reduce measurement interval',
    'Verringern Sie, wenn möglich, die Messfrequenz des Sensors. Weniger häufige Messungen erzeugen weniger Verhaltensdaten.':
        'If possible, reduce sensor measurement frequency. Less frequent measurements produce fewer behavior data points.',
    'Alte Messwerte löschen': 'Delete old measurement values',
    'Prüfen Sie Aufbewahrungsfristen in App oder Weboberfläche und aktivieren Sie automatische Löschung oder löschen Sie ältere Daten regelmäßig manuell.':
        'Review retention periods in app or web UI and enable auto deletion, or delete older data manually on a regular basis.',
    'Daten weniger detailliert anzeigen': 'Show less detailed data',
    'Stellen Sie, wenn möglich, eine gröbere Anzeige oder Auswertung ein, zum Beispiel Tageswerte statt Minutenwerte.':
        'If possible, switch to less granular display or evaluation, for example daily values instead of minute values.',
    'Lokale Verarbeitung bevorzugen': 'Prefer local processing',
    'Prüfen Sie, ob sich Cloud-Synchronisation deaktivieren oder eine lokale Speicherung aktivieren lässt, damit Messdaten nicht an den Hersteller übertragen werden.':
        'Check whether cloud sync can be disabled or local storage enabled so measurement data is not sent to the vendor.',
    'Skills/Fähigkeiten überprüfen': 'Review skills/integrations',
    'Überprüfen Sie, welche Drittanbieter-Skills Zugriff haben. Deaktivieren Sie unnötige Skills.':
        'Review which third-party skills have access. Disable unnecessary skills.',
    'WLAN-Verschlüsselung prüfen': 'Check Wi-Fi encryption',
    'BSI-Empfehlung: Verwenden Sie WPA2 oder WPA3 für Ihr Heimnetz. WEP und WPA sind veraltet.':
        'BSI recommendation: Use WPA2 or WPA3 on your home network. WEP and WPA are outdated.',
    'Zugriffsrechte der Kamera überprüfen': 'Review camera access rights',
    'Überprüfen Sie monatlich in der App, wer auf Live-View und Aufnahmen zugreifen kann.':
        'Check monthly in the app who can access live view and recordings.',
    'Zwei-Faktor-Authentifizierung aktivieren':
        'Enable two-factor authentication',
    'BSI-Empfehlung: Aktivieren Sie 2FA für Ihr Schlosskonto um Remote-Zugriffe zu schützen.':
        'BSI recommendation: Enable 2FA for your lock account to protect remote access.',
    'Grundriss-Speicherung klären': 'Clarify floor-plan storage',
    'Überprüfen Sie: Werden Grundrisse lokal oder in der Cloud gespeichert? Bevorzugen Sie lokal.':
        'Check whether floor plans are stored locally or in cloud storage. Prefer local storage.',
    'Haushalt nicht über Sensor informiert':
        'Household not informed about sensor',
    'Sensor nicht im IoT-Netz eingebunden':
        'Sensor not connected to IoT network',
    'Messintervall nicht reduziert': 'Measurement interval not reduced',
    'Alte Messwerte nicht gelöscht': 'Old measurement values not deleted',
    'Daten zu fein granular gespeichert':
        'Data stored with too much granularity',
    'Sprachaufnahmen nicht löschbar': 'Voice recordings not deletable',
    'Keine lokale Sprachverarbeitung': 'No local voice processing',
    'Skills nicht regelmäßig geprüft': 'Skills not reviewed regularly',
    'Videoübertragung nicht verschlüsselt': 'Video transmission not encrypted',
    'Aufnahmen nur in Anbieter-Cloud': 'Recordings only in vendor cloud',
    'Zugriff auf Aufnahmen nicht kontrolliert':
        'Recording access not controlled',
    'Bewegungserkennung immer aktiv': 'Motion detection always active',
    'Werbe-Tracking nicht deaktiviert': 'Ad tracking not disabled',
    'Kein Offline-Betrieb möglich': 'No offline operation possible',
    'Temperaturverlauf an Hersteller übertragen':
        'Temperature history sent to vendor',
    'Zugriff nicht einschränkbar': 'Access cannot be restricted',
    'Automatisierungen nur mit Internet':
        'Automations require internet connection',
    'Schaltmuster vom Hersteller erfasst':
        'Switching patterns collected by vendor',
    'Gerät offline nicht nutzbar': 'Device unusable offline',
    'Kein Offline-Öffnen möglich': 'No offline unlock possible',
    'Kein Zugriffsprotokoll verfügbar': 'No access log available',
    '2-Faktor-Authentifizierung fehlt': 'Two-factor authentication missing',
    'Grundriss an Hersteller übertragen': 'Floor plan transmitted to vendor',
    'Navigation nur mit Cloud möglich': 'Navigation only possible via cloud',
    'Kamerabilder gespeichert oder übertragen':
        'Camera images stored or transmitted',
    'Ist die Aufbewahrungsdauer Ihrer personenbezogenen Daten konkret festgelegt und auf das Notwendige begrenzt?':
        'Is the retention duration for your personal data explicitly defined and limited to what is necessary?',
    'Inspiriert durch CMU IoT Security & Privacy Label und Unboxing.IoT.Privacy: kurze, klare Speicherfristen reduzieren Risiken.':
        'Inspired by the CMU IoT Security & Privacy Label and Unboxing.IoT.Privacy: short, clear retention periods reduce risk.',
    'Können Sie Zugriffsrechte granular steuern (Rollen, getrennte Konten, keine geteilten Standard-Logins)?':
        'Can you control access rights granularly (roles, separate accounts, no shared default logins)?',
    'Granulare Zugriffskontrolle senkt das Risiko unbefugter Einsicht und Fehlbedienung.':
        'Granular access control reduces the risk of unauthorized access and misuse.',
    'Ist die Weitergabe an Dritte deaktiviert oder klar auf notwendige Dienste begrenzt?':
        'Is third-party sharing disabled or clearly limited to necessary services?',
    'Prüfen Sie in Datenschutz- und Kontoeinstellungen, ob Daten an Werbe-, Analyse- oder Partnerdienste fließen.':
        'Check privacy and account settings to see whether data is sent to advertising, analytics, or partner services.',
    'Ist der Verkauf Ihrer Daten ausgeschlossen (oder aktiv deaktiviert, falls möglich)?':
        'Is the sale of your data excluded (or actively disabled, where possible)?',
    'Eine ausdrückliche "kein Datenverkauf"-Option ist ein starkes Datenschutzsignal.':
        'An explicit "no data sale" option is a strong privacy signal.',
    'Ist bekannt, wie lange der Hersteller Sicherheitsupdates garantiert?':
        'Is it known how long the vendor guarantees security updates?',
    'Eine transparente Update-Zusage reduziert langfristige Sicherheits- und Privatsphärerisiken.':
        'A transparent update commitment reduces long-term security and privacy risks.',
    'Gibt es einen dokumentierten Prozess zur Meldung und Behebung von Sicherheitslücken?':
        'Is there a documented process for reporting and fixing vulnerabilities?',
    'Bevorzugen Sie Hersteller mit Responsible-Disclosure- oder Security-Contact-Informationen.':
        'Prefer vendors that provide responsible disclosure policies or clear security contact information.',
    'Bleibt das Gerät auch mit eingeschränkter Internetverbindung sinnvoll nutzbar?':
        'Does the device remain meaningfully usable with limited internet connectivity?',
    'Mehr Offline-Funktionalität bedeutet oft weniger laufende Datenübertragung in die Cloud.':
        'More offline functionality often means less continuous data transfer to the cloud.',
    'Werden Betroffene im Umfeld transparent informiert (z. B. Sichtbarkeit, Hinweise, klare Aufnahmeanzeige)?':
        'Are people nearby transparently informed (for example via visibility, notices, clear recording indicators)?',
    'Das adressiert Bystander-Privacy und wurde in Unboxing.IoT.Privacy als zentrale Herausforderung hervorgehoben.':
        'This addresses bystander privacy and is highlighted in Unboxing.IoT.Privacy as a key challenge.',
    'Sind Schutzmaßnahmen für Kinderdaten aktiv (Minimierung, keine Profilbildung, restriktive Freigaben)?':
        'Are child-data protections active (minimization, no profiling, restrictive sharing)?',
    'Geräte in kinderbezogenen Kontexten brauchen besonders strenge Datenschutzvorgaben.':
        'Devices in child-related contexts require especially strict privacy safeguards.',
    'Können digitale Schlüssel/Zugriffe schnell und einzeln widerrufen werden?':
        'Can digital keys/access rights be revoked quickly and individually?',
    'Schneller Widerruf ist zentral, wenn Geräte geteilt oder Nutzer gewechselt werden.':
        'Fast revocation is crucial when devices are shared or users change.',
    'Sind Funktionen zur Ableitung sensibler Gesundheits-/Verhaltensprofile eingeschränkt oder deaktivierbar?':
        'Are features that infer sensitive health or behavior profiles restricted or disableable?',
    'Inferenzkontrolle reduziert Risiken durch sekundäre Nutzung sensibler Daten.':
        'Inference controls reduce risks from secondary use of sensitive data.',
    'Aufbewahrungsdauer unklar/zu lang':
        'Retention duration unclear or too long',
    'Granulare Zugriffskontrolle fehlt': 'Granular access control missing',
    'Weitergabe an Dritte nicht begrenzt': 'Third-party sharing not limited',
    'Datenverkauf nicht ausgeschlossen': 'Data sale not excluded',
    'Garantierter Update-Zeitraum unbekannt':
        'Guaranteed update support window unknown',
    'Schwachstellenprozess nicht dokumentiert':
        'Vulnerability process not documented',
    'Sinnvoller Betrieb ohne Internet nicht möglich':
        'Meaningful offline operation not possible',
    'Transparenz für Betroffene im Umfeld fehlt':
        'Transparency for nearby bystanders missing',
    'Schutzmaßnahmen für Kinderdaten fehlen':
        'Child-data protection measures missing',
    'Einzelner Zugriffswiderruf nicht möglich':
        'Individual access revocation not possible',
    'Kontrollen gegen sensible Inferenz fehlen':
        'Controls against sensitive inference missing',
  };

  static String localize(String source) {
    if (AppLocalizations.activeLanguageCode == 'de') {
      return source;
    }
    return _deToEn[source] ?? source;
  }
}

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
      text:
          'Haben Sie das Standard-Passwort des Geräts oder des zugehörigen Kontos geändert?',
      hint:
          'Voreingestellte Passwörter sind oft öffentlich bekannt und leicht zu knacken.',
    );
    const qUpdates = DeviceQuestion(
      id: 'updates',
      text: 'Sind automatische Sicherheits-Updates für das Gerät aktiviert?',
      hint: 'Updates schließen bekannte Sicherheitslücken zeitnah.',
    );
    const qNetwork = DeviceQuestion(
      id: 'network',
      text:
          'Ist das Gerät in einem separaten Smart-Home- oder IoT-WLAN eingebunden?',
      hint:
          'Ein eigenes Netz für smarte Geräte schützt Ihr restliches Heimnetzwerk.',
    );
    const qInformed = DeviceQuestion(
      id: 'informed',
      text:
          'Sind alle Personen im Haushalt über dieses Gerät und seine Funktion informiert?',
      hint:
          'Alle Mitbewohnenden sollten wissen, welche Daten das Gerät erfasst.',
    );
    const qPermissions = DeviceQuestion(
      id: 'permissions',
      text:
          'Haben Sie unnötige App-Berechtigungen (z. B. Standort, Kontakte) deaktiviert?',
      hint: 'Nur wirklich benötigte Berechtigungen sollten aktiviert sein.',
    );
    const qMicActive = DeviceQuestion(
      id: 'mic_active',
      text: 'Deaktivieren Sie das Mikrofon, wenn Sie es nicht aktiv nutzen?',
      hint:
          'Smarte Lautsprecher und Geräte mit Mikrofonen können versehentlich aktiviert werden.',
    );
    // Unused base questions kept for reference (re-enable per device type as needed):
    // const qCameraConsent = DeviceQuestion(
    //   id: 'camera_consent',
    //   text: 'Filmt die Kamera nur Bereiche, für die alle Betroffenen ihr Einverständnis gegeben haben?',
    //   hint: 'Kameras in Gemeinschafts- oder Privatbereichen bedürfen der Zustimmung aller Bewohner.',
    // );

    // ── Sensor: tailored set – no app/password/update concept ─────────────────
    if (template.deviceType == 'sensor') {
      return const [
        // DeviceQuestion(id: 'sensor_informed', ...) // removed – generic, ≈ qInformed
        // DeviceQuestion(id: 'sensor_network', ...)  // removed – generic, ≈ qNetwork
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

    // ── Speaker ───────────────────────────────────────────────────────────────
    if (template.deviceType == 'speaker') {
      return [
        // qPassword,    // removed – generic
        // qUpdates,     // removed – generic
        // qNetwork,     // removed – generic
        // qInformed,    // removed – generic
        // qPermissions, // removed – generic
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
        qMicActive,
      ];
    }

    // ── Camera ────────────────────────────────────────────────────────────────
    if (template.deviceType == 'camera') {
      return const [
        // qPassword,      // removed – generic
        // qUpdates,       // removed – generic
        // qNetwork,       // removed – generic
        // qInformed,      // removed – generic
        // qPermissions,   // removed – generic
        // qCameraConsent, // removed – generic hasCamera flag
        DeviceQuestion(
          id: 'video_encryption',
          text:
              'Ist die Videoaufnahme und -übertragung durchgängig verschlüsselt?',
          hint:
              'BSI-Empfehlung: Verschlüsselte Verbindung verhindert Abhören und Datenklau unterwegs.',
        ),
        DeviceQuestion(
          id: 'video_storage',
          text:
              'Werden Aufnahmen lokal gespeichert (nicht ausschließlich in der Cloud des Anbieters)?',
          hint:
              'Lokale Speicherung gibt Ihnen mehr Kontrolle über Ihre Daten; bei reiner Cloud-Speicherung sind Sie auf die Sicherheit des Anbieters angewiesen.',
        ),
        DeviceQuestion(
          id: 'sharing_restrictions',
          text:
              'Können Sie steuern, wer auf die Live-View und Aufnahmen zugreifen kann?',
          hint:
              'Sie sollten genau kontrollieren können, wer Zugang zu den Videoaufnahmen erhält.',
        ),
        DeviceQuestion(
          id: 'motion_detection',
          text:
              'Können Sie Bewegungserkennung deaktivieren oder zeitlich begrenzen, wenn Sie zu Hause sind?',
          hint:
              'BSI-Empfehlung: Unnötige Aufnahmen vermeiden reduziert Datenmenge und Missbrauchsrisiko.',
        ),
      ];
    }

    // ── Smart TV ──────────────────────────────────────────────────────────────
    if (template.deviceType == 'tv') {
      return [
        // qPassword,    // removed – generic
        qUpdates,
        // qNetwork,     // removed – generic
        // qInformed,    // removed – generic
        // qPermissions, // removed – generic
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
      ];
    }

    // ── Thermostat ────────────────────────────────────────────────────────────
    if (template.deviceType == 'thermostat') {
      return [
        // qPassword,    // removed – generic
        qUpdates,
        // qNetwork,     // removed – generic
        // qInformed,    // removed – generic
        // qPermissions, // removed – generic
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
      ];
    }

    // ── Smart Light / Smart Plug / Motorised Blind ────────────────────────────
    if (template.deviceType == 'light' ||
        template.deviceType == 'plug' ||
        template.deviceType == 'blind') {
      return [
        // qPassword,    // removed – generic
        qUpdates,
        // qNetwork,     // removed – generic
        // qInformed,    // removed – generic
        // qPermissions, // removed – generic
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
      ];
    }

    // ── Smart Lock ────────────────────────────────────────────────────────────
    if (template.deviceType == 'lock') {
      return [
        qPassword,
        // qUpdates,     // removed – generic
        // qNetwork,     // removed – generic
        // qInformed,    // removed – generic
        // qPermissions, // removed – generic
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
      ];
    }

    // ── Robot Vacuum ──────────────────────────────────────────────────────────
    if (template.deviceType == 'robot') {
      return [
        // qPassword,    // removed – generic
        qUpdates,
        // qNetwork,     // removed – generic
        // qInformed,    // removed – generic
        // qPermissions, // removed – generic
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
      ];
    }

    // ── Connected Toy ─────────────────────────────────────────────────────────
    if (template.deviceType == 'toy') {
      return [
        // qPassword,    // removed – generic
        qUpdates,
        // qNetwork,     // removed – generic
        // qInformed,    // removed – generic
        // qPermissions, // removed – generic
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
      ];
    }

    // ── Wearable / Fitness Tracker ────────────────────────────────────────────
    if (template.deviceType == 'wearable') {
      return [
        // qPassword,    // removed – generic
        qUpdates,
        // qNetwork,     // removed – generic
        // qInformed,    // removed – generic
        qPermissions,
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
      ];
    }

    // ── Default / custom device ───────────────────────────────────────────────
    // Keep the 4 most universally important base questions.
    return [
      qPassword,
      qUpdates,
      qNetwork,
      qInformed,
      // qPermissions, // removed – only applicable when device has a companion app
    ];
  }

  static const List<DeviceQuestion> _expertCommonQuestions = [
    DeviceQuestion(
      id: 'expert_data_retention_duration',
      text:
          'Ist die Aufbewahrungsdauer Ihrer personenbezogenen Daten konkret festgelegt und auf das Notwendige begrenzt?',
      hint:
          'Inspiriert durch CMU IoT Security & Privacy Label und Unboxing.IoT.Privacy: kurze, klare Speicherfristen reduzieren Risiken.',
    ),
    DeviceQuestion(
      id: 'expert_access_control_granular',
      text:
          'Können Sie Zugriffsrechte granular steuern (Rollen, getrennte Konten, keine geteilten Standard-Logins)?',
      hint:
          'Granulare Zugriffskontrolle senkt das Risiko unbefugter Einsicht und Fehlbedienung.',
    ),
    DeviceQuestion(
      id: 'expert_third_party_sharing_limited',
      text:
          'Ist die Weitergabe an Dritte deaktiviert oder klar auf notwendige Dienste begrenzt?',
      hint:
          'Prüfen Sie in Datenschutz- und Kontoeinstellungen, ob Daten an Werbe-, Analyse- oder Partnerdienste fließen.',
    ),
    DeviceQuestion(
      id: 'expert_data_sale_disabled',
      text:
          'Ist der Verkauf Ihrer Daten ausgeschlossen (oder aktiv deaktiviert, falls möglich)?',
      hint:
          'Eine ausdrückliche "kein Datenverkauf"-Option ist ein starkes Datenschutzsignal.',
    ),
    DeviceQuestion(
      id: 'expert_update_support_window',
      text:
          'Ist bekannt, wie lange der Hersteller Sicherheitsupdates garantiert?',
      hint:
          'Eine transparente Update-Zusage reduziert langfristige Sicherheits- und Privatsphärerisiken.',
    ),
    DeviceQuestion(
      id: 'expert_vulnerability_process',
      text:
          'Gibt es einen dokumentierten Prozess zur Meldung und Behebung von Sicherheitslücken?',
      hint:
          'Bevorzugen Sie Hersteller mit Responsible-Disclosure- oder Security-Contact-Informationen.',
    ),
    DeviceQuestion(
      id: 'expert_offline_functionality',
      text:
          'Bleibt das Gerät auch mit eingeschränkter Internetverbindung sinnvoll nutzbar?',
      hint:
          'Mehr Offline-Funktionalität bedeutet oft weniger laufende Datenübertragung in die Cloud.',
    ),
  ];

  List<DeviceQuestion> _expertDeviceTypeQuestions() {
    final questions = <DeviceQuestion>[];
    if (template.hasCamera || template.hasMicrophone) {
      questions.add(
        const DeviceQuestion(
          id: 'expert_bystander_transparency',
          text:
              'Werden Betroffene im Umfeld transparent informiert (z. B. Sichtbarkeit, Hinweise, klare Aufnahmeanzeige)?',
          hint:
              'Das adressiert Bystander-Privacy und wurde in Unboxing.IoT.Privacy als zentrale Herausforderung hervorgehoben.',
        ),
      );
    }
    if (template.deviceType == 'toy' || roomId == _childBedroomRoomId) {
      questions.add(
        const DeviceQuestion(
          id: 'expert_child_data_protection',
          text:
              'Sind Schutzmaßnahmen für Kinderdaten aktiv (Minimierung, keine Profilbildung, restriktive Freigaben)?',
          hint:
              'Geräte in kinderbezogenen Kontexten brauchen besonders strenge Datenschutzvorgaben.',
        ),
      );
    }
    if (template.deviceType == 'lock') {
      questions.add(
        const DeviceQuestion(
          id: 'expert_access_revocation',
          text:
              'Können digitale Schlüssel/Zugriffe schnell und einzeln widerrufen werden?',
          hint:
              'Schneller Widerruf ist zentral, wenn Geräte geteilt oder Nutzer gewechselt werden.',
        ),
      );
    }
    if (template.deviceType == 'wearable') {
      questions.add(
        const DeviceQuestion(
          id: 'expert_sensitive_inference_controls',
          text:
              'Sind Funktionen zur Ableitung sensibler Gesundheits-/Verhaltensprofile eingeschränkt oder deaktivierbar?',
          hint:
              'Inferenzkontrolle reduziert Risiken durch sekundäre Nutzung sensibler Daten.',
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
      return 'Sie haben alle Fragen positiv beantwortet. Dennoch bleibt das Grundrisiko bei Kameras höher, weil sie besonders sensible Beobachtungsdaten erfassen und bei Fehlkonfiguration zur Überwachung genutzt werden können.';
    }
    if (template.deviceType == 'speaker' || template.hasMicrophone) {
      return 'Sie haben alle Fragen positiv beantwortet. Dennoch bleibt das Grundrisiko bei Geräten mit Mikrofon erhöht, da Sprachdaten sehr sensibel sind und Fehlaktivierungen bzw. Cloud-Verarbeitung weiterhin Risiken bergen.';
    }
    if (template.deviceType == 'lock') {
      return 'Sie haben alle Fragen positiv beantwortet. Dennoch bleibt bei smarten Schlössern ein erhöhtes Grundrisiko, da ein möglicher Missbrauch direkt den physischen Zugang zur Wohnung betrifft.';
    }
    if (roomId == _childBedroomRoomId) {
      return 'Sie haben alle Fragen positiv beantwortet. Dennoch bleibt im Kinderzimmer ein erhöhtes Grundrisiko, da dort häufig besonders sensible Daten zu Kindern und ihrem Alltag betroffen sind.';
    }

    return 'Sie haben alle Fragen positiv beantwortet. Das Gerät bleibt trotzdem im mittleren/hohen Bereich, weil bereits die Art des Geräts sensible Nutzungs- und Verhaltensdaten offenlegen kann.';
  }

  List<PrivacyAction> get suggestedActions {
    final actions = <PrivacyAction>[];
    const noAnswerActions = <String, PrivacyAction>{
      'password': PrivacyAction(
        title: 'Standard-Passwort ändern',
        description:
            'Ersetzen Sie das voreingestellte Passwort durch ein starkes, einzigartiges Passwort. Nutzen Sie einen Passwortmanager.',
        type: ActionType.security,
        priority: ActionPriority.high,
      ),
      'updates': PrivacyAction(
        title: 'Automatische Updates aktivieren',
        description:
            'Aktivieren Sie automatische Sicherheits-Updates in den Geräte- oder App-Einstellungen.',
        type: ActionType.security,
        priority: ActionPriority.high,
      ),
      'network': PrivacyAction(
        title: 'Separates IoT-WLAN einrichten',
        description:
            'Richten Sie ein eigenes WLAN für Smart-Home-Geräte ein, z. B. über die Gastnetz-Funktion Ihres Routers.',
        type: ActionType.technical,
        priority: ActionPriority.medium,
      ),
      'informed': PrivacyAction(
        title: 'Haushaltsmitglieder informieren',
        description:
            'Informieren Sie alle Bewohner: welche Daten das Gerät erfasst, wer Zugriff hat und wie es sich deaktivieren lässt.',
        type: ActionType.social,
        priority: ActionPriority.medium,
      ),
      'permissions': PrivacyAction(
        title: 'App-Berechtigungen einschränken',
        description:
            'Prüfen Sie in den Smartphone-Einstellungen die Berechtigungen der zugehörigen App und deaktivieren Sie nicht benötigte.',
        type: ActionType.technical,
        priority: ActionPriority.medium,
      ),
      'camera_consent': PrivacyAction(
        title: 'Kameraausrichtung mit Bewohnern abstimmen',
        description:
            'Holen Sie das Einverständnis aller Betroffenen ein. Die Kamera darf keine Bereiche ohne Zustimmung erfassen.',
        type: ActionType.social,
        priority: ActionPriority.high,
      ),
      'mic_active': PrivacyAction(
        title: 'Mikrofon bei Nichtnutzung deaktivieren',
        description:
            'Nutzen Sie den physischen Stummschalter oder deaktivieren Sie das Mikrofon in den Einstellungen.',
        type: ActionType.technical,
        priority: ActionPriority.high,
      ),
      'sensor_frequency': PrivacyAction(
        title: 'Messintervall reduzieren',
        description:
            'Verringern Sie, wenn möglich, die Messfrequenz des Sensors. Weniger häufige Messungen erzeugen weniger Verhaltensdaten.',
        type: ActionType.technical,
        priority: ActionPriority.medium,
      ),
      'sensor_data_deletion': PrivacyAction(
        title: 'Alte Messwerte löschen',
        description:
            'Prüfen Sie Aufbewahrungsfristen in App oder Weboberfläche und aktivieren Sie automatische Löschung oder löschen Sie ältere Daten regelmäßig manuell.',
        type: ActionType.technical,
        priority: ActionPriority.high,
      ),
      'sensor_granularity': PrivacyAction(
        title: 'Daten weniger detailliert anzeigen',
        description:
            'Stellen Sie, wenn möglich, eine gröbere Anzeige oder Auswertung ein, zum Beispiel Tageswerte statt Minutenwerte.',
        type: ActionType.technical,
        priority: ActionPriority.medium,
      ),
      'sensor_local': PrivacyAction(
        title: 'Lokale Verarbeitung bevorzugen',
        description:
            'Prüfen Sie, ob sich Cloud-Synchronisation deaktivieren oder eine lokale Speicherung aktivieren lässt, damit Messdaten nicht an den Hersteller übertragen werden.',
        type: ActionType.technical,
        priority: ActionPriority.high,
      ),
      'voice_history': PrivacyAction(
        title: 'Sprachaufzeichnungen löschen',
        description:
            'BSI-Empfehlung: Löschen Sie Sprachaufzeichnungen regelmäßig und deaktivieren Sie die Speicherung von Sprachverlauf, falls die Option verfügbar ist.',
        type: ActionType.technical,
        priority: ActionPriority.high,
      ),
      'voice_local': PrivacyAction(
        title: 'Lokale Sprachverarbeitung aktivieren',
        description:
            'Aktivieren Sie lokale Sprachverarbeitung, falls verfügbar. Falls nicht verfügbar, minimieren Sie Cloud-Speicherung von Sprachdaten.',
        type: ActionType.technical,
        priority: ActionPriority.high,
      ),
      'skills_permissions': PrivacyAction(
        title: 'Skills/Fähigkeiten überprüfen',
        description:
            'Überprüfen Sie, welche Drittanbieter-Skills Zugriff haben. Deaktivieren Sie unnötige Skills.',
        type: ActionType.technical,
        priority: ActionPriority.medium,
      ),
      'video_encryption': PrivacyAction(
        title: 'WLAN-Verschlüsselung prüfen',
        description:
            'BSI-Empfehlung: Verwenden Sie WPA2 oder WPA3 für Ihr Heimnetz. WEP und WPA sind veraltet.',
        type: ActionType.security,
        priority: ActionPriority.high,
      ),
      'video_storage': PrivacyAction(
        title: 'Aufnahmen lokal speichern',
        description:
            'Stellen Sie, wenn möglich, lokale Speicherung ein. Falls nur Cloud-Speicherung möglich ist, reduzieren Sie die Aufbewahrungsdauer und löschen Sie Aufnahmen regelmäßig.',
        type: ActionType.technical,
        priority: ActionPriority.high,
      ),
      'sharing_restrictions': PrivacyAction(
        title: 'Kamera-Zugriffe einschränken',
        description:
            'Entfernen Sie in der App alle unnötigen Freigaben und erlauben Sie Live-View/Aufnahmen nur für benötigte Konten.',
        type: ActionType.social,
        priority: ActionPriority.high,
      ),
      'motion_detection': PrivacyAction(
        title: 'Bewegungserkennung bei Anwesenheit deaktivieren',
        description:
            'Deaktivieren Sie Bewegungserkennung, wenn Personen zu Hause sind, oder setzen Sie einen Zeitplan, der sie nur in Abwesenheitszeiten aktiviert.',
        type: ActionType.technical,
        priority: ActionPriority.medium,
      ),
      'account_required': PrivacyAction(
        title: 'Kontopflicht datenschutzarm umsetzen',
        description:
            'Falls kein kontoloser Betrieb möglich ist, verwenden Sie ein separates Konto mit minimalen Profildaten und deaktivieren Sie personalisierte Dienste.',
        type: ActionType.social,
        priority: ActionPriority.medium,
      ),
      'tracking_disabled': PrivacyAction(
        title: 'Tracking und Werbung deaktivieren',
        description:
            'Deaktivieren Sie in den Datenschutzoptionen Tracking, personalisierte Werbung und optionale Telemetrie.',
        type: ActionType.technical,
        priority: ActionPriority.high,
      ),
      'local_mode': PrivacyAction(
        title: 'Offline-Nutzung bevorzugen',
        description:
            'Nutzen Sie das Gerät primär über lokale Quellen (z. B. HDMI), um Datenübertragung an den Hersteller zu reduzieren.',
        type: ActionType.social,
        priority: ActionPriority.medium,
      ),
      'data_collection': PrivacyAction(
        title: 'Historien-Upload deaktivieren',
        description:
            'Deaktivieren Sie in der Thermostat-App die Übertragung von Temperaturhistorien an den Hersteller und verkürzen Sie die Speicherdauer.',
        type: ActionType.technical,
        priority: ActionPriority.high,
      ),
      'offline_control': PrivacyAction(
        title: 'Lokale Steuerung einrichten',
        description:
            'Konfigurieren Sie lokale Zeitpläne und eine Bedienung ohne Cloud-Abhängigkeit, falls das Gerät dies unterstützt.',
        type: ActionType.technical,
        priority: ActionPriority.medium,
      ),
      'family_access': PrivacyAction(
        title: 'Zugriffsrechte für Haushaltsmitglieder trennen',
        description:
            'Richten Sie getrennte Rollen/Konten ein, damit nur berechtigte Personen Änderungen an der Heizung vornehmen können.',
        type: ActionType.social,
        priority: ActionPriority.medium,
      ),
      'local_control': PrivacyAction(
        title: 'Lokale Automatisierungen aktivieren',
        description:
            'Nutzen Sie lokale Szenen/Zeitpläne statt Cloud-Automatisierungen, sofern verfügbar.',
        type: ActionType.technical,
        priority: ActionPriority.medium,
      ),
      'usage_tracking': PrivacyAction(
        title: 'Nutzungs-Tracking deaktivieren',
        description:
            'Schalten Sie in den App-Einstellungen Analyse-, Telemetrie- und Nutzungsdatenerfassung aus.',
        type: ActionType.technical,
        priority: ActionPriority.high,
      ),
      'offline_fallback': PrivacyAction(
        title: 'Offline-Notbetrieb sicherstellen',
        description:
            'Prüfen Sie lokale Schalter/Taster und richten Sie Fallback-Bedienung ein, damit das Gerät auch ohne Internet nutzbar bleibt.',
        type: ActionType.security,
        priority: ActionPriority.medium,
      ),
      'offline_unlock': PrivacyAction(
        title: 'Offline-Zugang absichern',
        description:
            'Richten Sie einen physischen Schlüssel oder einen Notfall-Code ein und testen Sie den Zugriff bei Ausfall der Internetverbindung.',
        type: ActionType.security,
        priority: ActionPriority.high,
      ),
      'access_logging': PrivacyAction(
        title: 'Zugriffsprotokoll aktivieren',
        description:
            'Aktivieren Sie Protokollierung und Benachrichtigungen für Schlossöffnungen, damit unbefugte Zugriffe auffallen.',
        type: ActionType.security,
        priority: ActionPriority.medium,
      ),
      'two_factor': PrivacyAction(
        title: 'Zwei-Faktor-Authentifizierung aktivieren',
        description:
            'BSI-Empfehlung: Aktivieren Sie 2FA für Ihr Schlosskonto um Remote-Zugriffe zu schützen.',
        type: ActionType.security,
        priority: ActionPriority.high,
      ),
      'map_privacy': PrivacyAction(
        title: 'Cloud-Grundrissspeicherung deaktivieren',
        description:
            'Stellen Sie die Speicherung auf lokal um und deaktivieren Sie Cloud-Backups von Grundrissen, falls diese Option verfügbar ist.',
        type: ActionType.social,
        priority: ActionPriority.high,
      ),
      'cloud_required': PrivacyAction(
        title: 'Cloud-Abhängigkeit reduzieren',
        description:
            'Aktivieren Sie lokale Navigation oder Offline-Modus, falls verfügbar. Wenn nicht verfügbar, bewerten Sie einen Wechsel zu einem datenschutzfreundlicheren Modell.',
        type: ActionType.technical,
        priority: ActionPriority.medium,
      ),
      'vision_data': PrivacyAction(
        title: 'Kameradaten nur lokal verarbeiten',
        description:
            'Deaktivieren Sie Upload/Speicherung von Kamerabildern und nutzen Sie, wenn möglich, ausschließlich lokale Navigationsverarbeitung.',
        type: ActionType.technical,
        priority: ActionPriority.high,
      ),
      'parental_control': PrivacyAction(
        title: 'Elternkontrolle einrichten',
        description:
            'Aktivieren Sie Elternkontrolle mit PIN und beschränken Sie Kontakte, Funktionen und Freigaben auf das Notwendige.',
        type: ActionType.social,
        priority: ActionPriority.high,
      ),
      'child_data_limits': PrivacyAction(
        title: 'Datenerfassung minimieren',
        description:
            'Deaktivieren Sie optionale Profildaten und erfassen Sie nur die für die Kernfunktion erforderlichen Kinderdaten.',
        type: ActionType.technical,
        priority: ActionPriority.high,
      ),
      'recording_disable': PrivacyAction(
        title: 'Audio/Video-Aufnahmen deaktivieren',
        description:
            'Schalten Sie Aufnahmefunktionen standardmäßig aus und aktivieren Sie sie nur bei konkretem Bedarf kurzzeitig.',
        type: ActionType.security,
        priority: ActionPriority.high,
      ),
      'health_sharing': PrivacyAction(
        title: 'Gesundheitsdaten-Freigaben einschränken',
        description:
            'Entziehen Sie unnötigen Drittanbieter-Apps den Zugriff auf Gesundheitsdaten in App- und Kontoeinstellungen.',
        type: ActionType.technical,
        priority: ActionPriority.high,
      ),
      'location_tracking': PrivacyAction(
        title: 'Standortfreigabe reduzieren',
        description:
            'Deaktivieren Sie Standortverfolgung außerhalb aktiver Nutzung oder erlauben Sie sie nur beim Verwenden der App.',
        type: ActionType.technical,
        priority: ActionPriority.medium,
      ),
      'expert_data_retention_duration': PrivacyAction(
        title: 'Speicherfristen festlegen',
        description:
            'Setzen Sie klare kurze Aufbewahrungsfristen in den Einstellungen und löschen Sie Altbestände regelmäßig.',
        type: ActionType.technical,
        priority: ActionPriority.high,
      ),
      'expert_access_control_granular': PrivacyAction(
        title: 'Granulare Rollen und Konten einführen',
        description:
            'Nutzen Sie getrennte Konten statt Shared-Logins und vergeben Sie nur die minimal nötigen Rechte.',
        type: ActionType.security,
        priority: ActionPriority.high,
      ),
      'expert_third_party_sharing_limited': PrivacyAction(
        title: 'Drittweitergabe begrenzen',
        description:
            'Deaktivieren Sie Partner-, Werbe- und Analyseweitergaben in Datenschutz- und Kontoeinstellungen.',
        type: ActionType.technical,
        priority: ActionPriority.high,
      ),
      'expert_data_sale_disabled': PrivacyAction(
        title: 'Datenverkauf widersprechen',
        description:
            'Aktivieren Sie vorhandene "Do not sell"-Optionen bzw. widersprechen Sie der Datenweitergabe für Vermarktung.',
        type: ActionType.social,
        priority: ActionPriority.high,
      ),
      'expert_update_support_window': PrivacyAction(
        title: 'Update-Zusage verifizieren',
        description:
            'Prüfen Sie die offizielle Update-Policy des Herstellers und planen Sie bei fehlender Zusage einen Gerätewechsel ein.',
        type: ActionType.social,
        priority: ActionPriority.medium,
      ),
      'expert_vulnerability_process': PrivacyAction(
        title: 'Hersteller-Sicherheitsprozess prüfen',
        description:
            'Bevorzugen Sie Hersteller mit klarer Security-Kontaktstelle und Responsible-Disclosure-Prozess.',
        type: ActionType.social,
        priority: ActionPriority.medium,
      ),
      'expert_offline_functionality': PrivacyAction(
        title: 'Offline-Funktionalität priorisieren',
        description:
            'Aktivieren Sie lokale Betriebsmodi und minimieren Sie Cloud-Pflichtfunktionen, sofern das Gerät dies erlaubt.',
        type: ActionType.technical,
        priority: ActionPriority.medium,
      ),
      'expert_bystander_transparency': PrivacyAction(
        title: 'Transparenzhinweise für Umfeld ergänzen',
        description:
            'Sorgen Sie für sichtbare Hinweise, Aufnahmeanzeigen und klare Information für betroffene Personen im Umfeld.',
        type: ActionType.social,
        priority: ActionPriority.medium,
      ),
      'expert_child_data_protection': PrivacyAction(
        title: 'Kinderdatenschutz verschärfen',
        description:
            'Aktivieren Sie kindgerechte Profile, minimieren Sie Datenerhebung und deaktivieren Sie Profilbildung/Weitergabe.',
        type: ActionType.security,
        priority: ActionPriority.high,
      ),
      'expert_access_revocation': PrivacyAction(
        title: 'Schnellen Zugriffswiderruf einrichten',
        description:
            'Stellen Sie sicher, dass digitale Schlüssel einzeln und sofort widerrufen werden können, z. B. bei Geräteverlust.',
        type: ActionType.security,
        priority: ActionPriority.high,
      ),
      'expert_sensitive_inference_controls': PrivacyAction(
        title: 'Inferenzfunktionen einschränken',
        description:
            'Deaktivieren Sie Funktionen, die sensible Gesundheits- oder Verhaltensprofile ableiten, sofern diese nicht zwingend benötigt werden.',
        type: ActionType.technical,
        priority: ActionPriority.high,
      ),
    };

    for (final question in questions) {
      final answer = answerFor(question.id);
      if (answer != QuestionAnswer.no) {
        continue;
      }
      final action = noAnswerActions[question.id];
      if (action != null) {
        actions.add(action);
      }
    }

    if (dontKnowAnswerCount > 0) {
      actions.add(
        const PrivacyAction(
          title: 'Geräteeinstellungen besser kennenlernen',
          description:
              'Mindestens eine Frage wurde mit "Weiß ich nicht" beantwortet. Prüfen Sie die Einstellungen und Dokumentation Ihres Geräts, damit Sie Risiken künftig gezielt reduzieren können.',
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
          label: 'Grundrisiko des Gerätetyps',
          penalty: template.baseRiskScore,
          isDontKnow: false,
          isBaseRisk: true,
        ),
      );
    }
    if (roomId == _childBedroomRoomId) {
      factors.add(
        const ScoringFactor(
          label: 'Erhöhte Sensibilität: Kinderzimmer',
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

    check('password', 'Standard-Passwort nicht geändert', 20, 10);
    check('updates', 'Automatische Updates nicht aktiv', 15, 8);
    check('network', 'Kein separates IoT-WLAN eingerichtet', 10, 5);
    check('informed', 'Haushaltsmitglieder nicht informiert', 10, 5);
    check('permissions', 'App-Berechtigungen nicht reduziert', 5, 3);
    if (template.hasCamera) {
      check('camera_consent', 'Kein Einverständnis für Kamerabereich', 15, 8);
    }
    if (template.hasMicrophone) {
      check('mic_active', 'Mikrofon nicht bei Nichtnutzung deaktiviert', 10, 5);
    }

    // Device-specific questions — use short labels instead of full question text.
    const Map<String, String> shortLabels = {
      // Sensor
      'sensor_frequency': 'Messintervall nicht reduziert',
      'sensor_data_deletion': 'Alte Messwerte nicht gelöscht',
      'sensor_granularity': 'Daten zu fein granular gespeichert',
      'sensor_local': 'Daten in die Cloud übertragen',
      // Speaker
      'voice_history': 'Sprachaufnahmen nicht löschbar',
      'voice_local': 'Keine lokale Sprachverarbeitung',
      'skills_permissions': 'Skills nicht regelmäßig geprüft',
      // Camera
      'video_encryption': 'Videoübertragung nicht verschlüsselt',
      'video_storage': 'Aufnahmen nur in Anbieter-Cloud',
      'sharing_restrictions': 'Zugriff auf Aufnahmen nicht kontrolliert',
      'motion_detection': 'Bewegungserkennung immer aktiv',
      // TV
      'account_required': 'Pflichtdkonto beim Hersteller nötig',
      'tracking_disabled': 'Werbe-Tracking nicht deaktiviert',
      'local_mode': 'Kein Offline-Betrieb möglich',
      // Thermostat
      'data_collection': 'Temperaturverlauf an Hersteller übertragen',
      'offline_control': 'Kein Offline-Betrieb möglich',
      'family_access': 'Zugriff nicht einschränkbar',
      // Light / Plug / Blind
      'local_control': 'Automatisierungen nur mit Internet',
      'usage_tracking': 'Schaltmuster vom Hersteller erfasst',
      'offline_fallback': 'Gerät offline nicht nutzbar',
      // Lock
      'offline_unlock': 'Kein Offline-Öffnen möglich',
      'access_logging': 'Kein Zugriffsprotokoll verfügbar',
      'two_factor': '2-Faktor-Authentifizierung fehlt',
      // Robot
      'map_privacy': 'Grundriss an Hersteller übertragen',
      'cloud_required': 'Navigation nur mit Cloud möglich',
      'vision_data': 'Kamerabilder gespeichert oder übertragen',
      // Toy
      'parental_control': 'Elternkontrolle nicht eingerichtet',
      'child_data_limits': 'Datenmenge nicht eingeschränkt',
      'recording_disable': 'Aufnahmen nicht deaktivierbar',
      // Wearable
      'health_sharing': 'Gesundheitsdaten mit Dritten geteilt',
      'location_tracking': 'Standortverfolgung aktiv',
      // Expert mode
      'expert_data_retention_duration': 'Aufbewahrungsdauer unklar/zu lang',
      'expert_access_control_granular': 'Granulare Zugriffskontrolle fehlt',
      'expert_third_party_sharing_limited':
          'Weitergabe an Dritte nicht begrenzt',
      'expert_data_sale_disabled': 'Datenverkauf nicht ausgeschlossen',
      'expert_update_support_window': 'Garantierter Update-Zeitraum unbekannt',
      'expert_vulnerability_process':
          'Schwachstellenprozess nicht dokumentiert',
      'expert_offline_functionality':
          'Sinnvoller Betrieb ohne Internet nicht möglich',
      'expert_bystander_transparency':
          'Transparenz für Betroffene im Umfeld fehlt',
      'expert_child_data_protection': 'Schutzmaßnahmen für Kinderdaten fehlen',
      'expert_access_revocation': 'Einzelner Zugriffswiderruf nicht möglich',
      'expert_sensitive_inference_controls':
          'Kontrollen gegen sensible Inferenz fehlen',
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
