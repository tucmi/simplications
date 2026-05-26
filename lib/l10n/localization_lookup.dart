import 'dart:ui';

class LocalizationLookup {
  static Locale _activeLocale = const Locale('de');

  static void activate(Locale locale) {
    _activeLocale = locale;
  }

  static String get activeLanguageCode => _activeLocale.languageCode;

  static const Map<String, Map<String, String>>
  valuesByLocale = <String, Map<String, String>>{
    'cs': <String, String>{
      "about": "O aplikaci",
      "aboutPartnerHsAnhalt": "Vysoká škola Anhalt",
      "aboutPartnerTuChemnitz": "Technická univerzita v Chemnitzu",
      "aboutPartnerVzSachsen": "Spotřebitelské centrum Sasko",
      "aboutProjectName": "Simplications",
      "aboutScreenTitle": "O aplikaci",
      "aboutSubtitle":
          "Výzkumný projekt zaměřený na soukromí chytré domácnosti",
      "aboutWebsiteFundingAgencyLabel": "bmftr.bund.de",
      "aboutWebsiteFundingAgencyUrl": "https://www.bmftr.bund.de",
      "aboutWebsiteHsAnhaltLabel": "hs-anhalt.de",
      "aboutWebsiteHsAnhaltUrl": "https://www.hs-anhalt.de",
      "aboutWebsitePlatformPrivacyLabel": "plattform-privatheit.de",
      "aboutWebsitePlatformPrivacyUrl": "https://www.plattform-privatheit.de",
      "aboutWebsiteSimplicationsLabel": "simplications.tucmi.de",
      "aboutWebsiteSimplicationsUrl": "https://simplications.tucmi.de",
      "aboutWebsiteTuChemnitzLabel": "tu-chemnitz.de",
      "aboutWebsiteTuChemnitzUrl": "https://www.tu-chemnitz.de",
      "aboutWebsiteVzSachsenLabel": "verbraucherzentrale-sachsen.de",
      "aboutWebsiteVzSachsenUrl": "https://www.verbraucherzentrale-sachsen.de",
      "add": "Přidat",
      "addDevice": "Přidat\nzařízení",
      "addDeviceDialogTitle": "Přidat nové zařízení",
      "addRoom": "Přidat místnost",
      "addRoomDialogTitle": "Přidat novou místnost",
      "allDataDeleted": "Všechna uložená data byla smazána.",
      "alreadyEvaluated": "Již vyhodnoceno",
      "appTitle": "Simplications",
      "baseRiskHint": "např. 30 (nízké) až 60 (vysoké)",
      "baseRiskLabel": "Základní skóre rizika (0-100)",
      "camera": "Kamera",
      "cancel": "Zrušit",
      "catalogButton": "Otevřít úplný katalog opatření",
      "catalogSnackBarPrefix": "Katalog",
      "chooseIcon": "Vyberte ikonu:",
      "confirm": "Potvrdit",
      "connectedDevice": "Připojené zařízení",
      "coordination": "Koordinace",
      "coordinationFunding": "Koordinace a financování",
      "currentLanguage": "Aktuální jazyk",
      "dangerZone": "Nebezpečná zóna",
      "dangerZoneWarning":
          "Pozor: Tato akce trvale odstraní všechna uložená data aplikace.",
      "delete": "Smazat",
      "deleteAllDataBody":
          "Všechny zaznamenané místnosti, zařízení a odpovědi budou trvale smazány. Tuto akci nelze vrátit zpět.",
      "deleteAllDataButton": "Smazat data",
      "deleteAllDataTitle": "Smazat všechna data?",
      "deleteDeviceBody":
          "Toto vlastní zařízení bude smazáno. Všechny navázané instance budou také odstraněny.",
      "deleteDeviceTitle": "Smazat zařízení?",
      "deviceName": "Název zařízení",
      "deviceNameHint": "např. Můj chytrý reproduktor",
      "deviceQuestion": "Která chytrá zařízení používáte v této místnosti?",
      "deviceQuestionHint": "Klepněte na zařízení a odpovězte na otázky.",
      "deviceTitlePrefix": "Zařízení",
      "devicesRated": "hodnocených zařízení",
      "done": "Hotovo",
      "dontKnow": "Nevím",
      "dontKnowHint":
          " {count} odpověď{suffix} byla označena jako \"Nevím\" - věnujte čas lepšímu poznání nastavení svých zařízení.",
      "evaluatedDevices": "Vyhodnocená zařízení",
      "exportFailed": "Export se nezdařil",
      "faq": "FAQ",
      "faqAnswerCanShare":
          "Ano. Na obrazovce výsledků můžete přehled exportovat a sdílet jako text nebo PDF.",
      "faqAnswerDataStored":
          "Vaše hodnocení je uloženo lokálně ve vašem zařízení. V obrazovce O aplikaci můžete všechna uložená data kdykoli smazat.",
      "faqAnswerHowWorks":
          "Vyberete místnost, přidáte chytrá zařízení, odpovíte na otázky pro konkrétní zařízení a získáte profil rizik s prioritizovanými kroky.",
      "faqAnswerLegalAdvice":
          "Ne. Simplications poskytuje praktickou orientaci a doporučení, nenahrazuje však právní nebo profesionální bezpečnostní poradenství.",
      "faqAnswerNoDevice":
          "Můžete přidat vlastní zařízení a kontrolu dokončit. Doporučení pak vycházejí z vaší konfigurace a odpovědí.",
      "faqAnswerNoPolicy": "Protože neshromažďujeme vaše data.",
      "faqAnswerRiskMeaning":
          "Tyto úrovně ukazují, jak silně může vaše současné nastavení zvyšovat rizika pro soukromí. Jde o orientační úrovně, ne o právní nebo technickou certifikaci.",
      "faqAnswerWhatIs":
          "Simplications je výzkumný projekt zaměřený na soukromí v chytré domácnosti. Tato aplikace je jednou z částí projektu a provede vás místnost po místnosti vašimi zařízeními s praktickými doporučeními na základě vašich odpovědí.",
      "faqQuestionCanShare": "Mohu sdílet své výsledky?",
      "faqQuestionDataStored": "Kde jsou moje data uložena?",
      "faqQuestionHowWorks": "Jak kontrola funguje?",
      "faqQuestionLegalAdvice": "Jde o právní poradenství?",
      "faqQuestionNoDevice": "Co když moje zařízení není v seznamu?",
      "faqQuestionNoPolicy": "Proč tu není zásada ochrany osobních údajů?",
      "faqQuestionRiskMeaning": "Co znamená nízké, střední a vysoké riziko?",
      "faqQuestionWhatIs": "Co je Simplications?",
      "faqScreenTitle": "Často kladené otázky",
      "fullCatalog": "Úplný katalog opatření",
      "fundingAgency": "Poskytovatel financování",
      "fundingAgencyValue":
          "Spolkové ministerstvo pro výzkum, technologie a vesmír\nFKZ 16KIS1868K",
      "generalRecommendations": "Obecná doporučení",
      "generalRecommendationsHint":
          "Tato opatření platí pro celou vaši chytrou domácnost bez ohledu na jednotlivá zařízení.",
      "hasCamera": "Má kameru?",
      "hasMicrophone": "Má mikrofon?",
      "highRisk": "Vysoké riziko",
      "howRiskCalculated": "Jak se riziko počítá?",
      "languageDialogTitle": "Vyberte jazyk",
      "lowRisk": "Nízké riziko",
      "mediumRisk": "Střední riziko",
      "microphone": "Mikrofon",
      "nextRoom": "Další místnost",
      "no": "Ne",
      "noActionHigh":
          "Z vašich odpovědí nyní nelze odvodit konkrétní opatření, ale zůstává vysoké zbytkové riziko.",
      "noActionLow": "Vše je v pořádku - nejsou nutná žádná opatření.",
      "noActionMedium":
          "Z vašich odpovědí nyní nelze odvodit konkrétní opatření, ale zůstává střední zbytkové riziko.",
      "noDevice": "Žádné zařízení",
      "noDeviceDialogBody":
          "Tato místnost bude uzavřena bez zařízení a neovlivní hodnocení.",
      "noDeviceDialogBodyWithExisting":
          "Existující výběry zařízení pro tuto místnost budou zahozeny. Tato místnost bude uzavřena bez zařízení a neovlivní hodnocení.",
      "noDeviceDialogTitle": "V této místnosti nejsou zařízení?",
      "noDevicesCaptured": "Nebyla zaznamenána žádná zařízení.",
      "noDevicesHint":
          "Spusťte to znovu a přidejte zařízení, abyste získali hodnocení.",
      "noKnownDevices":
          "Pro tuto místnost nejsou známá žádná zařízení. Můžete přidat vlastní zařízení.",
      "notApplicableForDevice": "Tato otázka se na moje zařízení nevztahuje",
      "notCompleted": "Nedokončeno",
      "note": "Poznámka",
      "optional": "Volitelné",
      "overallHigh":
          "Několik zařízení má významná rizika pro soukromí/ochranu dat. Prosím co nejdříve zaveďte opatření s vysokou prioritou.",
      "overallLow":
          "Skvělá práce! Vaše zařízení jsou většinou bezpečně nastavena. Přesto si projděte obecná doporučení.",
      "overallMedium":
          "Je zde prostor ke zlepšení. Projděte si doporučení pro jednotlivá zařízení.",
      "overallRisk": "Celkové riziko",
      "overview": "Přehled",
      "platformPrivacy": "Plattform Privatheit",
      "projectPartners": "Projektoví partneři",
      "questionnaireTitle": "Otázky",
      "recommendations": "Doporučení",
      "recommended": "Doporučeno",
      "reportExportedAt": "Exportováno",
      "restart": "Začít znovu",
      "results": "Výsledky",
      "resume": "Pokračovat",
      "risk": "Riziko",
      "roomCheck": "Kontrola místnosti",
      "roomDeleteBody":
          "Tato vlastní místnost bude smazána. Všechna propojená zařízení budou také odstraněna.",
      "roomDeleteTitle": "Smazat místnost?",
      "roomInstruction":
          "Klepněte na místnost, zaznamenejte v ní zařízení a vraťte se sem, kde vyberete další místnost.",
      "roomName": "Název místnosti",
      "roomNameHint": "např. Obývací pokoj, Garáž",
      "roomQuestion": "Kterou místnost chcete nyní zkontrolovat?",
      "roomSelectionTitle": "Výběr místnosti",
      "security": "Zabezpečení",
      "shareAsPdf": "Sdílet jako PDF",
      "shareAsText": "Sdílet jako text",
      "shareResult": "Sdílet výsledek",
      "skippedDevicesHint":
          "{count} zařízení přeskočeno, protože dotazník nebyl dokončen.",
      "smartHomePrivacyHeader": "Vaše soukromí chytré domácnosti",
      "social": "Sociální",
      "start": "Začít",
      "stepAnswerQuestions": "Odpovězte na otázky",
      "stepCaptureDevices": "Zaznamenejte zařízení",
      "stepGetRisk": "Získejte rizikový profil a doporučení",
      "stepSelectRooms": "Vyberte místnost",
      "summarySharePdfText": "Zpráva Simplications jako PDF",
      "summaryShareSubject": "Výsledek Simplications",
      "summaryTitle": "Váš výsledek",
      "technical": "Technické",
      "totalScore": "Celkem",
      "urgent": "Naléhavé",
      "website": "Web",
      "websiteOpenFailed": "Web se nepodařilo otevřít.",
      "welcomeDescription":
          "Zaznamenejte svá chytrá zařízení místnost po místnosti a získejte hodnocení soukromí s konkrétními doporučeními.",
      "welcomeTitle": "Simplications\nKontrola soukromí\nchytré domácnosti",
      "yes": "Ano",
    },
    'da': <String, String>{
      "about": "Om",
      "aboutPartnerHsAnhalt": "Anhalt University of Applied Sciences",
      "aboutPartnerTuChemnitz": "Teknisk Universitet i Chemnitz",
      "aboutPartnerVzSachsen": "Forbrugercenter Sachsen",
      "aboutProjectName": "Simplications",
      "aboutScreenTitle": "Om appen",
      "aboutSubtitle": "Forskningsprojekt om privatliv i smarte hjem",
      "aboutWebsiteFundingAgencyLabel": "bmftr.bund.de",
      "aboutWebsiteFundingAgencyUrl": "https://www.bmftr.bund.de",
      "aboutWebsiteHsAnhaltLabel": "hs-anhalt.de",
      "aboutWebsiteHsAnhaltUrl": "https://www.hs-anhalt.de",
      "aboutWebsitePlatformPrivacyLabel": "plattform-privatheit.de",
      "aboutWebsitePlatformPrivacyUrl": "https://www.plattform-privatheit.de",
      "aboutWebsiteSimplicationsLabel": "simplications.tucmi.de",
      "aboutWebsiteSimplicationsUrl": "https://simplications.tucmi.de",
      "aboutWebsiteTuChemnitzLabel": "tu-chemnitz.de",
      "aboutWebsiteTuChemnitzUrl": "https://www.tu-chemnitz.de",
      "aboutWebsiteVzSachsenLabel": "verbraucherzentrale-sachsen.de",
      "aboutWebsiteVzSachsenUrl": "https://www.verbraucherzentrale-sachsen.de",
      "add": "Tilføj",
      "addDevice": "Tilføj\nenhed",
      "addDeviceDialogTitle": "Tilføj ny enhed",
      "addRoom": "Tilføj rum",
      "addRoomDialogTitle": "Tilføj nyt rum",
      "allDataDeleted": "Alle gemte data er blevet slettet.",
      "alreadyEvaluated": "Allerede vurderet",
      "appTitle": "Simplications",
      "baseRiskHint": "f.eks. 30 (lav) til 60 (høj)",
      "baseRiskLabel": "Basisrisikoscore (0-100)",
      "camera": "Kamera",
      "cancel": "Annuller",
      "catalogButton": "Åbn fuldt handlingskatalog",
      "catalogSnackBarPrefix": "Katalog",
      "chooseIcon": "Vælg ikon:",
      "confirm": "Bekræft",
      "connectedDevice": "Tilsluttet enhed",
      "coordination": "Koordination",
      "coordinationFunding": "Koordination og finansiering",
      "currentLanguage": "Nuværende sprog",
      "dangerZone": "Farezone",
      "dangerZoneWarning":
          "Advarsel: Denne handling fjerner alle gemte app-data permanent.",
      "delete": "Slet",
      "deleteAllDataBody":
          "Alle registrerede rum, enheder og svar slettes permanent. Handlingen kan ikke fortrydes.",
      "deleteAllDataButton": "Slet data",
      "deleteAllDataTitle": "Slet alle data?",
      "deleteDeviceBody":
          "Denne brugerdefinerede enhed slettes. Alle tilknyttede instanser fjernes også.",
      "deleteDeviceTitle": "Slet enhed?",
      "deviceName": "Enhedsnavn",
      "deviceNameHint": "f.eks. Min smarte højttaler",
      "deviceQuestion": "Hvilke smarte enheder bruger du i dette rum?",
      "deviceQuestionHint": "Tryk på en enhed for at besvare spørgsmålene.",
      "deviceTitlePrefix": "Enheder",
      "devicesRated": "vurderede enheder",
      "done": "Færdig",
      "dontKnow": "Ved ikke",
      "dontKnowHint":
          " {count} svar{suffix} er markeret som \"Ved ikke\" - brug tid på at lære dine enhedsindstillinger bedre at kende.",
      "evaluatedDevices": "Vurderede enheder",
      "exportFailed": "Eksport mislykkedes",
      "faq": "FAQ",
      "faqAnswerCanShare":
          "Ja. På resultatskærmen kan du eksportere og dele din opsummering som tekst eller PDF.",
      "faqAnswerDataStored":
          "Dine vurderingsdata gemmes lokalt på din enhed. På Om-skærmen kan du til enhver tid slette alle gemte data.",
      "faqAnswerHowWorks":
          "Du vælger et rum, tilføjer dine smarte enheder, besvarer enhedsspecifikke spørgsmål og får en risikoprofil med prioriterede handlinger.",
      "faqAnswerLegalAdvice":
          "Nej. Simplications giver praktisk vejledning og anbefalinger, men erstatter ikke juridisk rådgivning eller professionel sikkerhedsrådgivning.",
      "faqAnswerNoDevice":
          "Du kan tilføje brugerdefinerede enheder og stadig gennemføre tjekket. Anbefalingerne bygger så på din opsætning og dine svar.",
      "faqAnswerNoPolicy": "Fordi vi ikke indsamler dine data.",
      "faqAnswerRiskMeaning":
          "Disse niveauer viser, hvor meget din nuværende konfiguration kan øge privatlivsrisici. De er vejledende niveauer, ikke juridisk eller teknisk certificering.",
      "faqAnswerWhatIs":
          "Simplications er et forskningsprojekt om privatliv i smarte hjem. Denne app er en del af projektet og guider dig rum for rum gennem dine enheder med praktiske anbefalinger baseret på dine svar.",
      "faqQuestionCanShare": "Kan jeg dele mine resultater?",
      "faqQuestionDataStored": "Hvor gemmes mine data?",
      "faqQuestionHowWorks": "Hvordan fungerer tjekket?",
      "faqQuestionLegalAdvice": "Er dette juridisk rådgivning?",
      "faqQuestionNoDevice": "Hvad hvis min enhed ikke er på listen?",
      "faqQuestionNoPolicy": "Hvorfor er der ingen privatlivspolitik?",
      "faqQuestionRiskMeaning": "Hvad betyder lav, mellem og høj risiko?",
      "faqQuestionWhatIs": "Hvad er Simplications?",
      "faqScreenTitle": "Ofte stillede spørgsmål",
      "fullCatalog": "Fuldt handlingskatalog",
      "fundingAgency": "Finansieringsorgan",
      "fundingAgencyValue":
          "Tysk forbundsministerium for forskning, teknologi og rumfart\nBevilling 16KIS1868K",
      "generalRecommendations": "Generelle anbefalinger",
      "generalRecommendationsHint":
          "Disse tiltag gælder for hele dit smarte hjem uanset individuelle enheder.",
      "hasCamera": "Har kamera?",
      "hasMicrophone": "Har mikrofon?",
      "highRisk": "Høj risiko",
      "howRiskCalculated": "Hvordan beregnes risiko?",
      "languageDialogTitle": "Vælg sprog",
      "lowRisk": "Lav risiko",
      "mediumRisk": "Middel risiko",
      "microphone": "Mikrofon",
      "nextRoom": "Næste rum",
      "no": "Nej",
      "noActionHigh":
          "Der kan i øjeblikket ikke udledes konkrete handlinger fra dine svar, men der er fortsat en høj rest-risiko.",
      "noActionLow": "Alt er i orden - ingen handlinger nødvendige.",
      "noActionMedium":
          "Der kan i øjeblikket ikke udledes konkrete handlinger fra dine svar, men der er fortsat en middel rest-risiko.",
      "noDevice": "Ingen enhed",
      "noDeviceDialogBody":
          "Dette rum afsluttes uden enheder og påvirker ikke scoren.",
      "noDeviceDialogBodyWithExisting":
          "Eksisterende enhedsvalg for dette rum kasseres. Dette rum afsluttes uden enheder og påvirker ikke scoren.",
      "noDeviceDialogTitle": "Ingen enheder i dette rum?",
      "noDevicesCaptured": "Ingen enheder registreret.",
      "noDevicesHint": "Start forfra og tilføj enheder for at få en vurdering.",
      "noKnownDevices":
          "Ingen kendte enheder for dette rum. Du kan tilføje din egen enhed.",
      "notApplicableForDevice": "Dette spørgsmål gælder ikke for min enhed",
      "notCompleted": "Ikke afsluttet",
      "note": "Bemærkning",
      "optional": "Valgfri",
      "overallHigh":
          "Flere enheder har betydelige privatlivs-/databeskyttelsesrisici. Implementér venligst højprioriterede tiltag hurtigt.",
      "overallLow":
          "Godt klaret! Dine enheder er overvejende sikkert konfigureret. Gennemgå alligevel de generelle anbefalinger.",
      "overallMedium":
          "Der er plads til forbedringer. Gennemgå anbefalingerne for hver enhed.",
      "overallRisk": "Samlet risiko",
      "overview": "Oversigt",
      "platformPrivacy": "Plattform Privatheit",
      "projectPartners": "Projektpartnere",
      "questionnaireTitle": "Spørgsmål",
      "recommendations": "Anbefalinger",
      "recommended": "Anbefalet",
      "reportExportedAt": "Eksporteret den",
      "restart": "Start forfra",
      "results": "Resultater",
      "resume": "Fortsæt",
      "risk": "Risiko",
      "roomCheck": "Rumtjek",
      "roomDeleteBody":
          "Dette brugerdefinerede rum bliver slettet. Alle tilknyttede enheder bliver også fjernet.",
      "roomDeleteTitle": "Slet rum?",
      "roomInstruction":
          "Tryk på et rum, registrer enhederne dér, og kom tilbage hertil for at vælge næste rum.",
      "roomName": "Rumnavn",
      "roomNameHint": "f.eks. Stue, Garage",
      "roomQuestion": "Hvilket rum vil du tjekke nu?",
      "roomSelectionTitle": "Vælg rum",
      "security": "Sikkerhed",
      "shareAsPdf": "Del som PDF",
      "shareAsText": "Del som tekst",
      "shareResult": "Del resultat",
      "skippedDevicesHint":
          "{count} enheder er sprunget over, fordi spørgeskemaet ikke er afsluttet.",
      "smartHomePrivacyHeader": "Dit smart-home-privatliv",
      "social": "Social",
      "start": "Start",
      "stepAnswerQuestions": "Besvar spørgsmål",
      "stepCaptureDevices": "Registrer enheder",
      "stepGetRisk": "Få risikoprofil og anbefalinger",
      "stepSelectRooms": "Vælg ét rum",
      "summarySharePdfText": "Simplications-rapport som PDF",
      "summaryShareSubject": "Simplications-resultat",
      "summaryTitle": "Dit resultat",
      "technical": "Teknisk",
      "totalScore": "I alt",
      "urgent": "Haster",
      "website": "Websted",
      "websiteOpenFailed": "Kunne ikke åbne webstedet.",
      "welcomeDescription":
          "Registrer dine smarte enheder rum for rum, og få en privatlivsvurdering med konkrete anbefalinger.",
      "welcomeTitle": "Simplications\nSmart Home\nprivatlivstjek",
      "yes": "Ja",
    },
    'de': <String, String>{
      "a_access_logging_desc":
          "Aktivieren Sie Protokollierung und Benachrichtigungen für Schlossöffnungen, damit unbefugte Zugriffe auffallen.",
      "a_access_logging_title": "Zugriffsprotokoll aktivieren",
      "a_account_required_desc":
          "Falls kein kontoloser Betrieb möglich ist, verwenden Sie ein separates Konto mit minimalen Profildaten und deaktivieren Sie personalisierte Dienste.",
      "a_account_required_title": "Kontopflicht datenschutzarm umsetzen",
      "a_camera_consent_desc":
          "Holen Sie das Einverständnis aller Betroffenen ein. Die Kamera darf keine Bereiche ohne Zustimmung erfassen.",
      "a_camera_consent_title": "Kameraausrichtung mit Bewohnern abstimmen",
      "a_child_data_limits_desc":
          "Deaktivieren Sie optionale Profildaten und erfassen Sie nur die für die Kernfunktion erforderlichen Kinderdaten.",
      "a_child_data_limits_title": "Datenerfassung minimieren",
      "a_cloud_required_desc":
          "Aktivieren Sie lokale Navigation oder Offline-Modus, falls verfügbar. Wenn nicht verfügbar, bewerten Sie einen Wechsel zu einem datenschutzfreundlicheren Modell.",
      "a_cloud_required_title": "Cloud-Abhängigkeit reduzieren",
      "a_data_collection_desc":
          "Deaktivieren Sie in der Thermostat-App die Übertragung von Temperaturhistorien an den Hersteller und verkürzen Sie die Speicherdauer.",
      "a_data_collection_title": "Historien-Upload deaktivieren",
      "a_dont_know_desc":
          "Mindestens eine Frage wurde mit \"Weiß ich nicht\" beantwortet. Prüfen Sie die Einstellungen und Dokumentation Ihres Geräts, damit Sie Risiken künftig gezielt reduzieren können.",
      "a_dont_know_title": "Geräteeinstellungen besser kennenlernen",
      "a_expert_access_control_granular_desc":
          "Nutzen Sie getrennte Konten statt Shared-Logins und vergeben Sie nur die minimal nötigen Rechte.",
      "a_expert_access_control_granular_title":
          "Granulare Rollen und Konten einführen",
      "a_expert_access_revocation_desc":
          "Stellen Sie sicher, dass digitale Schlüssel einzeln und sofort widerrufen werden können, z. B. bei Geräteverlust.",
      "a_expert_access_revocation_title":
          "Schnellen Zugriffswiderruf einrichten",
      "a_expert_bystander_transparency_desc":
          "Sorgen Sie für sichtbare Hinweise, Aufnahmeanzeigen und klare Information für betroffene Personen im Umfeld.",
      "a_expert_bystander_transparency_title":
          "Transparenzhinweise für Umfeld ergänzen",
      "a_expert_child_data_protection_desc":
          "Aktivieren Sie kindgerechte Profile, minimieren Sie Datenerhebung und deaktivieren Sie Profilbildung/Weitergabe.",
      "a_expert_child_data_protection_title": "Kinderdatenschutz verschärfen",
      "a_expert_data_retention_duration_desc":
          "Setzen Sie klare kurze Aufbewahrungsfristen in den Einstellungen und löschen Sie Altbestände regelmäßig.",
      "a_expert_data_retention_duration_title": "Speicherfristen festlegen",
      "a_expert_data_sale_disabled_desc":
          "Aktivieren Sie vorhandene \"Do not sell\"-Optionen bzw. widersprechen Sie der Datenweitergabe für Vermarktung.",
      "a_expert_data_sale_disabled_title": "Datenverkauf widersprechen",
      "a_expert_offline_functionality_desc":
          "Aktivieren Sie lokale Betriebsmodi und minimieren Sie Cloud-Pflichtfunktionen, sofern das Gerät dies erlaubt.",
      "a_expert_offline_functionality_title":
          "Offline-Funktionalität priorisieren",
      "a_expert_sensitive_inference_controls_desc":
          "Deaktivieren Sie Funktionen, die sensible Gesundheits- oder Verhaltensprofile ableiten, sofern diese nicht zwingend benötigt werden.",
      "a_expert_sensitive_inference_controls_title":
          "Inferenzfunktionen einschränken",
      "a_expert_third_party_sharing_limited_desc":
          "Deaktivieren Sie Partner-, Werbe- und Analyseweitergaben in Datenschutz- und Kontoeinstellungen.",
      "a_expert_third_party_sharing_limited_title": "Drittweitergabe begrenzen",
      "a_expert_update_support_window_desc":
          "Prüfen Sie die offizielle Update-Policy des Herstellers und planen Sie bei fehlender Zusage einen Gerätewechsel ein.",
      "a_expert_update_support_window_title": "Update-Zusage verifizieren",
      "a_expert_vulnerability_process_desc":
          "Bevorzugen Sie Hersteller mit klarer Security-Kontaktstelle und Responsible-Disclosure-Prozess.",
      "a_expert_vulnerability_process_title":
          "Hersteller-Sicherheitsprozess prüfen",
      "a_family_access_desc":
          "Richten Sie getrennte Rollen/Konten ein, damit nur berechtigte Personen Änderungen an der Heizung vornehmen können.",
      "a_family_access_title": "Zugriffsrechte für Haushaltsmitglieder trennen",
      "a_health_sharing_desc":
          "Entziehen Sie unnötigen Drittanbieter-Apps den Zugriff auf Gesundheitsdaten in App- und Kontoeinstellungen.",
      "a_health_sharing_title": "Gesundheitsdaten-Freigaben einschränken",
      "a_informed_desc":
          "Informieren Sie alle Bewohner: welche Daten das Gerät erfasst, wer Zugriff hat und wie es sich deaktivieren lässt.",
      "a_informed_title": "Haushaltsmitglieder informieren",
      "a_local_control_desc":
          "Nutzen Sie lokale Szenen/Zeitpläne statt Cloud-Automatisierungen, sofern verfügbar.",
      "a_local_control_title": "Lokale Automatisierungen aktivieren",
      "a_local_mode_desc":
          "Nutzen Sie das Gerät primär über lokale Quellen (z. B. HDMI), um Datenübertragung an den Hersteller zu reduzieren.",
      "a_local_mode_title": "Offline-Nutzung bevorzugen",
      "a_location_tracking_desc":
          "Deaktivieren Sie Standortverfolgung außerhalb aktiver Nutzung oder erlauben Sie sie nur beim Verwenden der App.",
      "a_location_tracking_title": "Standortfreigabe reduzieren",
      "a_map_privacy_desc":
          "Stellen Sie die Speicherung auf lokal um und deaktivieren Sie Cloud-Backups von Grundrissen, falls diese Option verfügbar ist.",
      "a_map_privacy_title": "Cloud-Grundrissspeicherung deaktivieren",
      "a_mic_active_desc":
          "Nutzen Sie den physischen Stummschalter oder deaktivieren Sie das Mikrofon in den Einstellungen.",
      "a_mic_active_title": "Mikrofon bei Nichtnutzung deaktivieren",
      "a_motion_detection_desc":
          "Deaktivieren Sie Bewegungserkennung, wenn Personen zu Hause sind, oder setzen Sie einen Zeitplan, der sie nur in Abwesenheitszeiten aktiviert.",
      "a_motion_detection_title":
          "Bewegungserkennung bei Anwesenheit deaktivieren",
      "a_network_desc":
          "Richten Sie ein eigenes WLAN für Smart-Home-Geräte ein, z. B. über die Gastnetz-Funktion Ihres Routers.",
      "a_network_title": "Separates IoT-WLAN einrichten",
      "a_offline_control_desc":
          "Konfigurieren Sie lokale Zeitpläne und eine Bedienung ohne Cloud-Abhängigkeit, falls das Gerät dies unterstützt.",
      "a_offline_control_title": "Lokale Steuerung einrichten",
      "a_offline_fallback_desc":
          "Prüfen Sie lokale Schalter/Taster und richten Sie Fallback-Bedienung ein, damit das Gerät auch ohne Internet nutzbar bleibt.",
      "a_offline_fallback_title": "Offline-Notbetrieb sicherstellen",
      "a_offline_unlock_desc":
          "Richten Sie einen physischen Schlüssel oder einen Notfall-Code ein und testen Sie den Zugriff bei Ausfall der Internetverbindung.",
      "a_offline_unlock_title": "Offline-Zugang absichern",
      "a_parental_control_desc":
          "Aktivieren Sie Elternkontrolle mit PIN und beschränken Sie Kontakte, Funktionen und Freigaben auf das Notwendige.",
      "a_parental_control_title": "Elternkontrolle einrichten",
      "a_password_desc":
          "Ersetzen Sie das voreingestellte Passwort durch ein starkes, einzigartiges Passwort. Nutzen Sie einen Passwortmanager.",
      "a_password_title": "Standard-Passwort ändern",
      "a_permissions_desc":
          "Prüfen Sie in den Smartphone-Einstellungen die Berechtigungen der zugehörigen App und deaktivieren Sie nicht benötigte.",
      "a_permissions_title": "App-Berechtigungen einschränken",
      "a_recording_disable_desc":
          "Schalten Sie Aufnahmefunktionen standardmäßig aus und aktivieren Sie sie nur bei konkretem Bedarf kurzzeitig.",
      "a_recording_disable_title": "Audio/Video-Aufnahmen deaktivieren",
      "a_sensor_data_deletion_desc":
          "Prüfen Sie Aufbewahrungsfristen in App oder Weboberfläche und aktivieren Sie automatische Löschung oder löschen Sie ältere Daten regelmäßig manuell.",
      "a_sensor_data_deletion_title": "Alte Messwerte löschen",
      "a_sensor_frequency_desc":
          "Verringern Sie, wenn möglich, die Messfrequenz des Sensors. Weniger häufige Messungen erzeugen weniger Verhaltensdaten.",
      "a_sensor_frequency_title": "Messintervall reduzieren",
      "a_sensor_granularity_desc":
          "Stellen Sie, wenn möglich, eine gröbere Anzeige oder Auswertung ein, zum Beispiel Tageswerte statt Minutenwerte.",
      "a_sensor_granularity_title": "Daten weniger detailliert anzeigen",
      "a_sensor_local_desc":
          "Prüfen Sie, ob sich Cloud-Synchronisation deaktivieren oder eine lokale Speicherung aktivieren lässt, damit Messdaten nicht an den Hersteller übertragen werden.",
      "a_sensor_local_title": "Lokale Verarbeitung bevorzugen",
      "a_sharing_restrictions_desc":
          "Entfernen Sie in der App alle unnötigen Freigaben und erlauben Sie Live-View/Aufnahmen nur für benötigte Konten.",
      "a_sharing_restrictions_title": "Kamera-Zugriffe einschränken",
      "a_skills_permissions_desc":
          "Überprüfen Sie, welche Drittanbieter-Skills Zugriff haben. Deaktivieren Sie unnötige Skills.",
      "a_skills_permissions_title": "Skills/Fähigkeiten überprüfen",
      "a_tracking_disabled_desc":
          "Deaktivieren Sie in den Datenschutzoptionen Tracking, personalisierte Werbung und optionale Telemetrie.",
      "a_tracking_disabled_title": "Tracking und Werbung deaktivieren",
      "a_two_factor_desc":
          "BSI-Empfehlung: Aktivieren Sie 2FA für Ihr Schlosskonto um Remote-Zugriffe zu schützen.",
      "a_two_factor_title": "Zwei-Faktor-Authentifizierung aktivieren",
      "a_updates_desc":
          "Aktivieren Sie automatische Sicherheits-Updates in den Geräte- oder App-Einstellungen.",
      "a_updates_title": "Automatische Updates aktivieren",
      "a_usage_tracking_desc":
          "Schalten Sie in den App-Einstellungen Analyse-, Telemetrie- und Nutzungsdatenerfassung aus.",
      "a_usage_tracking_title": "Nutzungs-Tracking deaktivieren",
      "a_video_encryption_desc":
          "Aktivieren Sie in den Kamera-Einstellungen eine Ende-zu-Ende-verschlüsselte Übertragung für Livebild und Aufnahmen.",
      "a_video_encryption_title": "Ende-zu-Ende-Verschlüsselung aktivieren",
      "a_video_storage_desc":
          "Stellen Sie, wenn möglich, lokale Speicherung ein. Falls nur Cloud-Speicherung möglich ist, reduzieren Sie die Aufbewahrungsdauer und löschen Sie Aufnahmen regelmäßig.",
      "a_video_storage_title": "Aufnahmen lokal speichern",
      "a_vision_data_desc":
          "Deaktivieren Sie Upload/Speicherung von Kamerabildern und nutzen Sie, wenn möglich, ausschließlich lokale Navigationsverarbeitung.",
      "a_vision_data_title": "Kameradaten nur lokal verarbeiten",
      "a_voice_history_desc":
          "BSI-Empfehlung: Löschen Sie Sprachaufzeichnungen regelmäßig und deaktivieren Sie die Speicherung von Sprachverlauf, falls die Option verfügbar ist.",
      "a_voice_history_title": "Sprachaufzeichnungen löschen",
      "a_voice_local_desc":
          "Aktivieren Sie lokale Sprachverarbeitung, falls verfügbar. Falls nicht verfügbar, minimieren Sie Cloud-Speicherung von Sprachdaten.",
      "a_voice_local_title": "Lokale Sprachverarbeitung aktivieren",
      "about": "Über",
      "aboutPartnerHsAnhalt": "Hochschule Anhalt",
      "aboutPartnerTuChemnitz": "Technische Universität Chemnitz",
      "aboutPartnerVzSachsen": "Verbraucherzentrale Sachsen e.V.",
      "aboutProjectName": "Simplications",
      "aboutScreenTitle": "Über die App",
      "aboutSubtitle": "Forschungsprojekt Smart Home Privatsphäre",
      "aboutWebsiteFundingAgencyLabel": "bmftr.bund.de",
      "aboutWebsiteFundingAgencyUrl": "https://www.bmftr.bund.de",
      "aboutWebsiteHsAnhaltLabel": "hs-anhalt.de",
      "aboutWebsiteHsAnhaltUrl": "https://www.hs-anhalt.de",
      "aboutWebsitePlatformPrivacyLabel": "plattform-privatheit.de",
      "aboutWebsitePlatformPrivacyUrl": "https://www.plattform-privatheit.de",
      "aboutWebsiteSimplicationsLabel": "simplications.tucmi.de",
      "aboutWebsiteSimplicationsUrl": "https://simplications.tucmi.de",
      "aboutWebsiteTuChemnitzLabel": "tu-chemnitz.de",
      "aboutWebsiteTuChemnitzUrl": "https://www.tu-chemnitz.de",
      "aboutWebsiteVzSachsenLabel": "verbraucherzentrale-sachsen.de",
      "aboutWebsiteVzSachsenUrl": "https://www.verbraucherzentrale-sachsen.de",
      "add": "Hinzufügen",
      "addDevice": "Gerät\nhinzufügen",
      "addDeviceDialogTitle": "Neues Gerät hinzufügen",
      "addRoom": "Raum hinzufügen",
      "addRoomDialogTitle": "Neuen Raum hinzufügen",
      "allDataDeleted": "Alle gespeicherten Daten wurden gelöscht.",
      "alreadyEvaluated": "Bereits ausgewertet",
      "appTitle": "Simplications",
      "baseRiskHint": "z. B. 30 (niedrig) bis 60 (hoch)",
      "baseRiskLabel": "Basis-Risiko-Punktzahl (0-100)",
      "camera": "Kamera",
      "cancel": "Abbrechen",
      "catalogButton": "Zum vollständigen Maßnahmenkatalog",
      "catalogSnackBarPrefix": "Maßnahmenkatalog",
      "chooseIcon": "Symbol wählen:",
      "confirm": "Bestätigen",
      "connectedDevice": "Verbundenes Gerät",
      "coordination": "Koordination",
      "coordinationFunding": "Koordination & Förderung",
      "currentLanguage": "Aktuelle Sprache",
      "dangerZone": "Gefahrenbereich",
      "dangerZoneWarning":
          "Achtung: Diese Aktion entfernt alle gespeicherten App-Daten dauerhaft.",
      "delete": "Löschen",
      "deleteAllDataBody":
          "Alle erfassten Räume, Geräte und Antworten werden dauerhaft gelöscht. Diese Aktion kann nicht rückgängig gemacht werden.",
      "deleteAllDataButton": "Daten löschen",
      "deleteAllDataTitle": "Alle Daten löschen?",
      "deleteDeviceBody":
          "Dieses benutzerdefinierte Gerät wird gelöscht. Alle verknüpften Instanzen werden auch entfernt.",
      "deleteDeviceTitle": "Gerät löschen?",
      "deviceName": "Gerätename",
      "deviceNameHint": "z. B. Mein Smart Speaker",
      "deviceQuestion": "Welche smarten Geräte nutzen Sie in diesem Raum?",
      "deviceQuestionHint":
          "Tippen Sie auf ein Gerät, um die Fragen dafür zu beantworten.",
      "deviceTitlePrefix": "Geräte",
      "device_baby_monitor": "Babymonitor / Babykamera",
      "device_doorbell_camera": "Smarte Türklingel mit Kamera",
      "device_fitness_tracker": "Fitness-Tracker / Smartwatch",
      "device_humidity_sensor": "Feuchtigkeitssensor",
      "device_indoor_camera": "Smarte Innenkamera",
      "device_light_sensor": "Lichtsensor",
      "device_outdoor_camera": "Smarte Außenkamera",
      "device_robot_vacuum": "Saugroboter",
      "device_simple_sensor":
          "Sensor (z. B. Tür-, Bewegungs-, Temperatur-, Feuchtigkeits- oder Lichtsensor)",
      "device_smart_blind": "Smarte Jalousie / Rolllade",
      "device_smart_coffee": "Smarte Kaffeemaschine",
      "device_smart_display": "Smart Display (z. B. Nest Hub)",
      "device_smart_fridge": "Smarter Kühlschrank",
      "device_smart_hub": "Smart-Home-Hub (z. B. Homey, Home Assistant)",
      "device_smart_irrigation": "Smarte Bewässerungsanlage",
      "device_smart_light": "Smarte Beleuchtung",
      "device_smart_lock": "Smartes Türschloss",
      "device_smart_meter": "Intelligenter Stromzähler / Smart Meter",
      "device_smart_oven": "Smarter Backofen / Herd",
      "device_smart_plug": "Smarte Steckdose",
      "device_smart_printer": "Smarter Drucker",
      "device_smart_router": "Smart Router / Mesh-System",
      "device_smart_scale": "Smarte Waage",
      "device_smart_speaker": "Smart Speaker / Sprachassistent",
      "device_smart_thermostat": "Smarter Thermostat / Heizungssteuerung",
      "device_smart_toy": "Smartes Spielzeug",
      "device_smart_tv": "Smart TV",
      "device_smart_washing": "Smarte Waschmaschine / Trockner",
      "device_temperature_sensor": "Temperatursensor",
      "devicesRated": "bewertete Geräte",
      "done": "Fertig",
      "dontKnow": "Weiß ich nicht",
      "dontKnowHint":
          " Es wurden {count} Antwort{suffix} mit \"Weiß ich nicht\" gegeben - nehmen Sie sich Zeit, die Einstellungen Ihrer Geräte besser kennenzulernen.",
      "evaluatedDevices": "Bewertete Geräte",
      "expertModeQuestionnaireHint":
          "Expertenmodus: Diese Fragen vertiefen Datenpraktiken und Governance (u. a. Speicherfristen, Zugriffskontrolle, Drittweitergabe) nach Ansätzen aus CMU IoT Label und Unboxing.IoT.Privacy.",
      "expertModeSourceCmuLabel": "CMU IoT Security & Privacy Label (CISPL)",
      "expertModeSourceCmuUrl": "https://iotsecurityprivacy.org/labels",
      "expertModeSourceUnboxingLabel":
          "Unboxing.IoT.Privacy (Community-Plattform)",
      "expertModeSourceUnboxingUrl": "https://iot-privacy.info/project/",
      "expertModeSourcesHint":
          "Methodisch angelehnt an folgende Forschungsprojekte:",
      "expertModeTitle": "Expertenmodus",
      "expertModeToggleHint":
          "Gleicher Ablauf, aber deutlich detailliertere Fragen pro Gerät (z. B. Aufbewahrungsdauer, Zugriffskontrolle, Drittweitergabe).",
      "expertModeToggleLabel": "Detaillierten Expertenmodus aktivieren",
      "exportFailed": "Export fehlgeschlagen",
      "faq": "FAQ",
      "faqAnswerCanShare":
          "Ja. Im Ergebnisbildschirm können Sie Ihre Zusammenfassung direkt als Text oder PDF exportieren und teilen.",
      "faqAnswerDataStored":
          "Ihre Eingaben werden lokal auf Ihrem Gerät gespeichert. In der Über-Seite können Sie alle gespeicherten Daten jederzeit löschen.",
      "faqAnswerHowWorks":
          "Sie wählen einen Raum, erfassen Ihre smarten Geräte, beantworten gerätespezifische Fragen und erhalten ein Risikoprofil mit priorisierten Maßnahmen.",
      "faqAnswerLegalAdvice":
          "Nein. Simplications bietet praktische Orientierung und Empfehlungen, ersetzt aber keine rechtliche oder professionelle Sicherheitsberatung.",
      "faqAnswerNoDevice":
          "Sie können eigene Geräte hinzufügen und den Check trotzdem durchführen. Die Empfehlungen basieren dann auf Ihrer Konfiguration und Ihren Antworten.",
      "faqAnswerNoPolicy": "Weil wir keine Daten von Ihnen erheben.",
      "faqAnswerRiskMeaning":
          "Diese Stufen zeigen, wie stark Ihre aktuelle Konfiguration Privatsphäre-Risiken begünstigen kann. Sie sind eine Orientierung und keine rechtliche oder technische Zertifizierung.",
      "faqAnswerWhatIs":
          "Simplications ist ein Forschungsprojekt zum Smart-Home-Datenschutz. Diese App ist ein Teil des Projekts und führt Sie Raum für Raum durch Ihre Geräte mit praktischen Empfehlungen auf Basis Ihrer Antworten.",
      "faqQuestionCanShare": "Kann ich mein Ergebnis teilen?",
      "faqQuestionDataStored": "Wo werden meine Daten gespeichert?",
      "faqQuestionHowWorks": "Wie funktioniert der Check?",
      "faqQuestionLegalAdvice": "Ist das eine Rechtsberatung?",
      "faqQuestionNoDevice": "Was ist, wenn mein Gerät nicht in der Liste ist?",
      "faqQuestionNoPolicy": "Warum gibt es keine Datenschutzerklärung?",
      "faqQuestionRiskMeaning":
          "Was bedeuten niedriges, mittleres und hohes Risiko?",
      "faqQuestionWhatIs": "Was ist Simplications?",
      "faqScreenTitle": "Häufige Fragen",
      "fullCatalog": "Vollständiger Maßnahmenkatalog",
      "fundingAgency": "Fördermittelgeber",
      "fundingAgencyValue":
          "Bundesministerium für Forschung, Technologie und Raumfahrt\nFKZ 16KIS1868K",
      "gen_rec_0":
          "Richten Sie ein separates WLAN nur für Smart-Home-Geräte ein (z. B. Gastnetz Ihres Routers).",
      "gen_rec_1":
          "Nutzen Sie einen Passwortmanager und vergeben Sie für jedes Gerät ein einzigartiges, starkes Passwort.",
      "gen_rec_2":
          "Aktivieren Sie Mehrfaktor-Authentifizierung (MFA) für alle Hersteller-Konten.",
      "gen_rec_3":
          "Legen Sie im Haushalt fest, wer für Updates, Backups und Konten verantwortlich ist.",
      "gen_rec_4":
          "Überprüfen Sie regelmäßig (mind. 1× pro Quartal) alle Zugriffsberechtigungen und Konten.",
      "gen_rec_5":
          "Entsorgen Sie alte Geräte datenschutzgerecht: Werksreset durchführen und aus der Hersteller-Cloud austragen.",
      "gen_rec_6":
          "Nutzen Sie ein Konsens-Protokoll, bevor Sie neue Geräte kaufen - beziehen Sie alle Haushaltsmitglieder ein.",
      "generalRecommendations": "Allgemeine Empfehlungen",
      "generalRecommendationsHint":
          "Diese Maßnahmen gelten unabhängig von einzelnen Geräten für Ihr gesamtes Smart Home.",
      "hasCamera": "Hat Kamera?",
      "hasMicrophone": "Hat Mikrofon?",
      "highRisk": "Hohes Risiko",
      "howRiskCalculated": "Wie wird das Risiko berechnet?",
      "languageDialogTitle": "Sprache wählen",
      "lowRisk": "Niedriges Risiko",
      "mediumRisk": "Mittleres Risiko",
      "microphone": "Mikrofon",
      "nextRoom": "Nächster Raum",
      "no": "Nein",
      "noActionHigh":
          "Aktuell keine konkreten Maßnahmen aus Ihren Antworten ableitbar, aber es bleibt ein hohes Restrisiko.",
      "noActionLow": "Alles in Ordnung - keine Maßnahmen erforderlich.",
      "noActionMedium":
          "Aktuell keine konkreten Maßnahmen aus Ihren Antworten ableitbar, aber es bleibt ein mittleres Restrisiko.",
      "noDevice": "Kein Gerät",
      "noDeviceDialogBody":
          "Dieser Raum wird ohne Geräte abgeschlossen und fließt nicht in die Bewertung ein.",
      "noDeviceDialogBodyWithExisting":
          "Vorhandene Geräteauswahlen für diesen Raum werden verworfen. Dieser Raum wird ohne Geräte abgeschlossen und fließt nicht in die Bewertung ein.",
      "noDeviceDialogTitle": "Keine Geräte in diesem Raum?",
      "noDevicesCaptured": "Keine Geräte erfasst.",
      "noDevicesHint":
          "Starten Sie erneut und fügen Sie Geräte hinzu, um eine Bewertung zu erhalten.",
      "noKnownDevices":
          "Keine bekannten Geräte für diesen Raum. Sie können ein eigenes Gerät hinzufügen.",
      "notApplicableForDevice": "Diese Frage trifft auf mein Gerät nicht zu",
      "notCompleted": "Nicht abgeschlossen",
      "note": "Hinweis",
      "optional": "Optional",
      "overallHigh":
          "Mehrere Geräte haben erhebliche Privatsphäre-/Datenschutzrisiken. Bitte setzen Sie die Maßnahmen mit hoher Priorität zeitnah um.",
      "overallLow":
          "Gut gemacht! Ihre Geräte sind überwiegend sicher konfiguriert. Schauen Sie trotzdem in die allgemeinen Empfehlungen.",
      "overallMedium":
          "Es gibt Verbesserungspotenzial. Schauen Sie sich die Empfehlungen zu den einzelnen Geräten an.",
      "overallRisk": "Gesamtrisiko",
      "overview": "Übersicht",
      "platformPrivacy": "Plattform Privatheit",
      "projectPartners": "Projektpartner",
      "q_access_logging_hint":
          "Ein Zugriffsverlauf ermöglicht Ihnen, verdächtige Aktivitäten zu erkennen.",
      "q_access_logging_text":
          "Können Sie nachvollziehen, wer wann das Schloss geöffnet hat?",
      "q_account_required_hint":
          "Pflichtkonten ermöglichen dem Hersteller Werbe-Tracking und das Speichern Ihrer Sehgewohnheiten. Ein kontoloser Betrieb schützt Ihre Privatsphäre.",
      "q_account_required_text":
          "Können Sie das Gerät ohne obligatorisches Online-Konto nutzen?",
      "q_camera_consent_hint":
          "Kameras in Gemeinschafts- oder Privatbereichen bedürfen der Zustimmung aller Bewohner.",
      "q_camera_consent_text":
          "Filmt die Kamera nur Bereiche, für die alle Betroffenen ihr Einverständnis gegeben haben?",
      "q_child_data_limits_hint":
          "Kinder-spezifische Geräte sollten minimale Datenmenge erfassen und speichern.",
      "q_child_data_limits_text":
          "Können Sie einschränken, welche persönlichen Daten das Spielzeug sammelt?",
      "q_cloud_required_hint":
          "Geräte mit lokaler Navigation sind datenschutzfreundlicher, da keine Raumdaten in die Cloud übertragen werden.",
      "q_cloud_required_text":
          "Funktioniert die Grundriss-Navigation auch ohne Cloud-Verbindung?",
      "q_data_collection_hint":
          "Historien können Anwesenheitsmuster und Lebensgewohnheiten offenbaren. Lokale Speicherung schützt vor unerwünschter Auswertung.",
      "q_data_collection_text":
          "Bleiben Ihre Temperatur-Historien und Zeitpläne auf dem Gerät (keine Übertragung an den Hersteller)?",
      "q_expert_access_control_granular_hint":
          "Granulare Zugriffskontrolle senkt das Risiko unbefugter Einsicht und Fehlbedienung.",
      "q_expert_access_control_granular_text":
          "Können Sie Zugriffsrechte granular steuern (Rollen, getrennte Konten, keine geteilten Standard-Logins)?",
      "q_expert_access_revocation_hint":
          "Schneller Widerruf ist zentral, wenn Geräte geteilt oder Nutzer gewechselt werden.",
      "q_expert_access_revocation_text":
          "Können digitale Schlüssel/Zugriffe schnell und einzeln widerrufen werden?",
      "q_expert_bystander_transparency_hint":
          "Das adressiert Bystander-Privacy und wurde in Unboxing.IoT.Privacy als zentrale Herausforderung hervorgehoben.",
      "q_expert_bystander_transparency_text":
          "Werden Betroffene im Umfeld transparent informiert (z. B. Sichtbarkeit, Hinweise, klare Aufnahmeanzeige)?",
      "q_expert_child_data_protection_hint":
          "Geräte in kinderbezogenen Kontexten brauchen besonders strenge Datenschutzvorgaben.",
      "q_expert_child_data_protection_text":
          "Sind Schutzmaßnahmen für Kinderdaten aktiv (Minimierung, keine Profilbildung, restriktive Freigaben)?",
      "q_expert_data_retention_duration_hint":
          "Inspiriert durch CMU IoT Security & Privacy Label und Unboxing.IoT.Privacy: kurze, klare Speicherfristen reduzieren Risiken.",
      "q_expert_data_retention_duration_text":
          "Ist die Aufbewahrungsdauer Ihrer personenbezogenen Daten konkret festgelegt und auf das Notwendige begrenzt?",
      "q_expert_data_sale_disabled_hint":
          "Eine ausdrückliche \"kein Datenverkauf\"-Option ist ein starkes Datenschutzsignal.",
      "q_expert_data_sale_disabled_text":
          "Ist der Verkauf Ihrer Daten ausgeschlossen (oder aktiv deaktiviert, falls möglich)?",
      "q_expert_offline_functionality_hint":
          "Mehr Offline-Funktionalität bedeutet oft weniger laufende Datenübertragung in die Cloud.",
      "q_expert_offline_functionality_text":
          "Bleibt das Gerät auch mit eingeschränkter Internetverbindung sinnvoll nutzbar?",
      "q_expert_sensitive_inference_controls_hint":
          "Inferenzkontrolle reduziert Risiken durch sekundäre Nutzung sensibler Daten.",
      "q_expert_sensitive_inference_controls_text":
          "Sind Funktionen zur Ableitung sensibler Gesundheits-/Verhaltensprofile eingeschränkt oder deaktivierbar?",
      "q_expert_third_party_sharing_limited_hint":
          "Prüfen Sie in Datenschutz- und Kontoeinstellungen, ob Daten an Werbe-, Analyse- oder Partnerdienste fließen.",
      "q_expert_third_party_sharing_limited_text":
          "Ist die Weitergabe an Dritte deaktiviert oder klar auf notwendige Dienste begrenzt?",
      "q_expert_update_support_window_hint":
          "Eine transparente Update-Zusage reduziert langfristige Sicherheits- und Privatsphärerisiken.",
      "q_expert_update_support_window_text":
          "Ist bekannt, wie lange der Hersteller Sicherheitsupdates garantiert?",
      "q_expert_vulnerability_process_hint":
          "Bevorzugen Sie Hersteller mit Responsible-Disclosure- oder Security-Contact-Informationen.",
      "q_expert_vulnerability_process_text":
          "Gibt es einen dokumentierten Prozess zur Meldung und Behebung von Sicherheitslücken?",
      "q_family_access_hint":
          "Haushaltsmitglieder sollten Kontrolle haben, ohne dass Besucher alles ändern können.",
      "q_family_access_text":
          "Können Sie steuern, wer die Heizung anpassen darf (z. B. nur Gäste einschränken)?",
      "q_health_sharing_hint":
          "Gesundheitsdaten sind sensibel. Nur autorisierte Apps sollten Zugriff erhalten.",
      "q_health_sharing_text":
          "Können Sie steuern, welche Drittanbieter Zugriff auf Ihre Gesundheitsdaten haben?",
      "q_informed_hint":
          "Alle Mitbewohnenden sollten wissen, welche Daten das Gerät erfasst.",
      "q_informed_text":
          "Sind alle Personen im Haushalt über dieses Gerät und seine Funktion informiert?",
      "q_local_control_hint":
          "Lokale Ausführung von Szenen und Zeitplänen schützt Ihre Privatsphäre besser.",
      "q_local_control_text":
          "Können Automatisierungen lokal ohne Internetverbindung erfolgen?",
      "q_local_mode_hint":
          "Offline-Betrieb schützt Ihre Nutzungsdaten vor Übertragung an den Hersteller.",
      "q_local_mode_text":
          "Können Sie das Gerät über HDMI oder lokale Quellen ohne Internetverbindung nutzen?",
      "q_location_tracking_hint":
          "GPS-Tracking verbraucht Akku und kann Ihre Bewegungsmuster offenbaren.",
      "q_location_tracking_text":
          "Können Sie Standortverfolgung deaktivieren, wenn Sie sie nicht benötigen?",
      "q_map_privacy_hint":
          "Grundrisse Ihres Hauses sind sensible Informationen und sollten nicht an den Hersteller übermittelt werden.",
      "q_map_privacy_text":
          "Werden die erstellten Grundrisse ausschließlich lokal auf dem Gerät gespeichert?",
      "q_mic_active_hint":
          "Smarte Lautsprecher und Geräte mit Mikrofonen können versehentlich aktiviert werden.",
      "q_mic_active_text":
          "Deaktivieren Sie das Mikrofon, wenn Sie es nicht aktiv nutzen?",
      "q_motion_detection_hint":
          "BSI-Empfehlung: Unnötige Aufnahmen vermeiden reduziert Datenmenge und Missbrauchsrisiko.",
      "q_motion_detection_text":
          "Können Sie Bewegungserkennung deaktivieren oder zeitlich begrenzen, wenn Sie zu Hause sind?",
      "q_network_hint":
          "Ein eigenes Netz für smarte Geräte schützt Ihr restliches Heimnetzwerk.",
      "q_network_text":
          "Ist das Gerät in einem separaten Smart-Home- oder IoT-WLAN eingebunden?",
      "q_offline_control_hint":
          "Offline-Betrieb oder lokale Automatisierung schützt Ihre Daten vor Cloud-Zugriff.",
      "q_offline_control_text":
          "Können Sie das Thermostat auch offline betreiben (ohne Internet)?",
      "q_offline_fallback_hint":
          "Zuverlässige lokale Funktion ist wichtig für alltägliche Nutzung und Privatsphäre.",
      "q_offline_fallback_text":
          "Funktionieren die Geräte noch, wenn die Internet- oder App-Verbindung ausfällt?",
      "q_offline_unlock_hint":
          "Backup-Optionen verhindern Aussperrung bei Internet- oder Stromausfällen.",
      "q_offline_unlock_text":
          "Können Sie das Schloss auch offline (z. B. mit Code oder Schlüssel) öffnen?",
      "q_parental_control_hint":
          "Elternkontrolle sollte ermöglichen, Kontakte und Funktionen zu beschränken.",
      "q_parental_control_text":
          "Gibt es Elternkontroll-Funktionen zur Verwaltung des Spielzeugs?",
      "q_password_hint":
          "Voreingestellte Passwörter sind oft öffentlich bekannt und leicht zu knacken.",
      "q_password_text":
          "Haben Sie das Standard-Passwort des Geräts oder des zugehörigen Kontos geändert?",
      "q_permissions_hint":
          "Nur wirklich benötigte Berechtigungen sollten aktiviert sein.",
      "q_permissions_text":
          "Haben Sie unnötige App-Berechtigungen (z. B. Standort, Kontakte) deaktiviert?",
      "q_recording_disable_hint":
          "BSI-Empfehlung: Aufnahmen von Kindern sollten nur mit expliziter Kontrolle möglich sein.",
      "q_recording_disable_text":
          "Können Sie Audio- und Videoaufnahmen auf dem Gerät deaktivieren?",
      "q_sensor_data_deletion_hint":
          "Alte Verlaufsdaten sollten nicht dauerhaft gespeichert bleiben. Prüfen Sie die Aufbewahrungszeit in den Einstellungen.",
      "q_sensor_data_deletion_text":
          "Werden ältere Messwerte automatisch oder auf Wunsch gelöscht?",
      "q_sensor_frequency_hint":
          "Eine niedrigere Messfrequenz erzeugt weniger Daten und schränkt Rückschlüsse auf Ihr Verhalten ein.",
      "q_sensor_frequency_text":
          "Können Sie das Messintervall des Sensors reduzieren (z. B. seltener messen)?",
      "q_sensor_granularity_hint":
          "Weniger granulare Anzeigen schützen vor Rückschlüssen auf genaue Anwesenheits- oder Verhaltensmuster.",
      "q_sensor_granularity_text":
          "Zeigt das System die Sensordaten nur in zusammengefasster Form an (z. B. Tages- statt Minutenwerte)?",
      "q_sensor_local_hint":
          "Lokale Verarbeitung verhindert, dass der Hersteller Einblick in Ihre Messwerte erhält.",
      "q_sensor_local_text":
          "Werden die Messdaten lokal verarbeitet und gespeichert, ohne in eine Cloud übertragen zu werden?",
      "q_sharing_restrictions_hint":
          "Sie sollten genau kontrollieren können, wer Zugang zu den Videoaufnahmen erhält.",
      "q_sharing_restrictions_text":
          "Können Sie steuern, wer auf die Live-View und Aufnahmen zugreifen kann?",
      "q_skills_permissions_hint":
          "Skills von Drittanbietern können sensible Daten abfangen. Nur notwendige Skills aktivieren.",
      "q_skills_permissions_text":
          "Überprüfen Sie regelmäßig, welche Fähigkeiten/Skills Zugriff auf Ihr Konto haben?",
      "q_tracking_disabled_hint":
          "Smart-TVs sammeln oft Daten über Ihre Sehgewohnheiten. Suchen Sie nach Datenschutzoptionen.",
      "q_tracking_disabled_text":
          "Können Sie Werbe- und Tracking-Funktionen vollständig deaktivieren?",
      "q_two_factor_hint":
          "BSI-Empfehlung: 2FA schützt Ihr Konto vor unbefugtem Fernzugriff auf das Schloss.",
      "q_two_factor_text":
          "Ist Zwei-Faktor-Authentifizierung (2FA) für das Sperr-Konto verfügbar?",
      "q_updates_hint": "Updates schließen bekannte Sicherheitslücken zeitnah.",
      "q_updates_text":
          "Sind automatische Sicherheits-Updates für das Gerät aktiviert?",
      "q_usage_tracking_hint":
          "Nutzungsmuster können Ihre Anwesenheit und Gewohnheiten offenbaren. Prüfen Sie die Datenschutzeinstellungen der App.",
      "q_usage_tracking_text":
          "Haben Sie die Erfassung von Schaltmustern und Nutzungszeiten durch den Hersteller deaktiviert oder eingeschränkt?",
      "q_video_encryption_hint":
          "BSI-Empfehlung: Verschlüsselte Verbindung verhindert Abhören und Datenklau unterwegs.",
      "q_video_encryption_text":
          "Ist die Videoaufnahme und -übertragung durchgängig verschlüsselt?",
      "q_video_storage_hint":
          "Lokale Speicherung gibt Ihnen mehr Kontrolle über Ihre Daten; bei reiner Cloud-Speicherung sind Sie auf die Sicherheit des Anbieters angewiesen.",
      "q_video_storage_text":
          "Werden Aufnahmen lokal gespeichert (nicht ausschließlich in der Cloud des Anbieters)?",
      "q_vision_data_hint":
          "Kamerabilder sollten nur lokal für die Navigation verarbeitet und weder gespeichert noch an den Hersteller gesendet werden.",
      "q_vision_data_text":
          "Wenn der Roboter Kameras nutzt: Werden die Kamerabilder ausschließlich lokal für die Navigation verwendet (kein Speichern oder Übertragen)?",
      "q_voice_history_hint":
          "BSI-Empfehlung: Minimieren Sie die Speicherung von Aufnahmen oder löschen Sie sie regelmäßig.",
      "q_voice_history_text":
          "Können Sie Sprachaufnahmen aus der Geräte-Historie löschen oder diese Funktion deaktivieren?",
      "q_voice_local_hint":
          "Lokale Verarbeitung reduziert die Menge an Daten, die in die Cloud übertragen werden.",
      "q_voice_local_text":
          "Wird die Sprachverarbeitung teilweise lokal auf dem Gerät durchgeführt?",
      "questionnaireTitle": "Fragen",
      "recommendations": "Empfehlungen",
      "recommended": "Empfohlen",
      "reportExportedAt": "Exportiert am",
      "restart": "Neu starten",
      "results": "Ergebnisse",
      "resume": "Fortsetzen",
      "risk": "Risiko",
      "risk_hint_camera":
          "Sie haben alle Fragen positiv beantwortet. Dennoch bleibt das Grundrisiko bei Kameras höher, weil sie besonders sensible Beobachtungsdaten erfassen und bei Fehlkonfiguration zur Überwachung genutzt werden können.",
      "risk_hint_child_room":
          "Sie haben alle Fragen positiv beantwortet. Dennoch bleibt im Kinderzimmer ein erhöhtes Grundrisiko, da dort häufig besonders sensible Daten zu Kindern und ihrem Alltag betroffen sind.",
      "risk_hint_generic":
          "Sie haben alle Fragen positiv beantwortet. Das Gerät bleibt trotzdem im mittleren/hohen Bereich, weil bereits die Art des Geräts sensible Nutzungs- und Verhaltensdaten offenlegen kann.",
      "risk_hint_lock":
          "Sie haben alle Fragen positiv beantwortet. Dennoch bleibt bei smarten Schlössern ein erhöhtes Grundrisiko, da ein möglicher Missbrauch direkt den physischen Zugang zur Wohnung betrifft.",
      "risk_hint_mic":
          "Sie haben alle Fragen positiv beantwortet. Dennoch bleibt das Grundrisiko bei Geräten mit Mikrofon erhöht, da Sprachdaten sehr sensibel sind und Fehlaktivierungen bzw. Cloud-Verarbeitung weiterhin Risiken bergen.",
      "roomCheck": "Raum-Check",
      "roomDeleteBody":
          "Dieser benutzerdefinierte Raum wird gelöscht. Alle verknüpften Geräte werden auch entfernt.",
      "roomDeleteTitle": "Raum löschen?",
      "roomInstruction":
          "Tippen Sie auf einen Raum, erfassen Sie dort Ihre Geräte und kehren Sie dann hierher zurück, um den nächsten Raum zu wählen.",
      "roomName": "Raumname",
      "roomNameHint": "z. B. Wohnzimmer, Garage",
      "roomQuestion": "Welchen Raum möchten Sie jetzt prüfen?",
      "roomSelectionTitle": "Raum auswählen",
      "room_basement": "Keller / Speisekammer",
      "room_bathroom": "Badezimmer",
      "room_bedroom": "Schlafzimmer",
      "room_child_bedroom": "Kinderzimmer",
      "room_garden": "Garten / Außenbereich",
      "room_hallway": "Flur / Eingang",
      "room_kitchen": "Küche",
      "room_living": "Wohnzimmer",
      "room_office": "Arbeitszimmer",
      "room_whole_home": "Ganze Wohnung",
      "security": "Sicherheit",
      "shareAsPdf": "Als PDF teilen",
      "shareAsText": "Als Text teilen",
      "shareResult": "Ergebnis teilen",
      "skippedDevicesHint":
          "{count} Geräte übersprungen, da der Fragebogen nicht abgeschlossen wurde.",
      "sl_access_logging": "Kein Zugriffsprotokoll verfügbar",
      "sl_account_required": "Pflichtkonto beim Hersteller nötig",
      "sl_base_risk": "Grundrisiko des Gerätetyps",
      "sl_camera_consent": "Kein Einverständnis für Kamerabereich",
      "sl_child_data_limits": "Datenmenge nicht eingeschränkt",
      "sl_child_room_bonus": "Erhöhte Sensibilität: Kinderzimmer",
      "sl_cloud_required": "Navigation nur mit Cloud möglich",
      "sl_data_collection": "Temperaturverlauf an Hersteller übertragen",
      "sl_expert_access_control_granular": "Granulare Zugriffskontrolle fehlt",
      "sl_expert_access_revocation": "Einzelner Zugriffswiderruf nicht möglich",
      "sl_expert_bystander_transparency":
          "Transparenz für Betroffene im Umfeld fehlt",
      "sl_expert_child_data_protection":
          "Schutzmaßnahmen für Kinderdaten fehlen",
      "sl_expert_data_retention_duration": "Aufbewahrungsdauer unklar/zu lang",
      "sl_expert_data_sale_disabled": "Datenverkauf nicht ausgeschlossen",
      "sl_expert_offline_functionality":
          "Sinnvoller Betrieb ohne Internet nicht möglich",
      "sl_expert_sensitive_inference_controls":
          "Kontrollen gegen sensible Inferenz fehlen",
      "sl_expert_third_party_sharing_limited":
          "Weitergabe an Dritte nicht begrenzt",
      "sl_expert_update_support_window":
          "Garantierter Update-Zeitraum unbekannt",
      "sl_expert_vulnerability_process":
          "Schwachstellenprozess nicht dokumentiert",
      "sl_family_access": "Zugriff nicht einschränkbar",
      "sl_health_sharing": "Gesundheitsdaten mit Dritten geteilt",
      "sl_informed": "Haushaltsmitglieder nicht informiert",
      "sl_local_control": "Automatisierungen nur mit Internet",
      "sl_local_mode": "Kein Offline-Betrieb möglich",
      "sl_location_tracking": "Standortverfolgung aktiv",
      "sl_map_privacy": "Grundriss an Hersteller übertragen",
      "sl_mic_active": "Mikrofon nicht bei Nichtnutzung deaktiviert",
      "sl_motion_detection": "Bewegungserkennung immer aktiv",
      "sl_network": "Kein separates IoT-WLAN eingerichtet",
      "sl_offline_control": "Kein Offline-Betrieb möglich",
      "sl_offline_fallback": "Gerät offline nicht nutzbar",
      "sl_offline_unlock": "Kein Offline-Öffnen möglich",
      "sl_parental_control": "Elternkontrolle nicht eingerichtet",
      "sl_password": "Standard-Passwort nicht geändert",
      "sl_permissions": "App-Berechtigungen nicht reduziert",
      "sl_recording_disable": "Aufnahmen nicht deaktivierbar",
      "sl_sensor_data_deletion": "Alte Messwerte nicht gelöscht",
      "sl_sensor_frequency": "Messintervall nicht reduziert",
      "sl_sensor_granularity": "Daten zu fein granular gespeichert",
      "sl_sensor_local": "Daten in die Cloud übertragen",
      "sl_sharing_restrictions": "Zugriff auf Aufnahmen nicht kontrolliert",
      "sl_skills_permissions": "Skills nicht regelmäßig geprüft",
      "sl_tracking_disabled": "Werbe-Tracking nicht deaktiviert",
      "sl_two_factor": "2-Faktor-Authentifizierung fehlt",
      "sl_updates": "Automatische Updates nicht aktiv",
      "sl_usage_tracking": "Schaltmuster vom Hersteller erfasst",
      "sl_video_encryption": "Videoübertragung nicht verschlüsselt",
      "sl_video_storage": "Aufnahmen nur in Anbieter-Cloud",
      "sl_vision_data": "Kamerabilder gespeichert oder übertragen",
      "sl_voice_history": "Sprachaufnahmen nicht löschbar",
      "sl_voice_local": "Keine lokale Sprachverarbeitung",
      "smartHomePrivacyHeader": "Ihr Smart-Home-Datenschutz",
      "social": "Sozial",
      "start": "Starten",
      "stepAnswerQuestions": "Fragen beantworten",
      "stepCaptureDevices": "Geräte erfassen",
      "stepGetRisk": "Risikoprofil & Empfehlungen erhalten",
      "stepSelectRooms": "Raum auswählen",
      "summarySharePdfText": "Simplications Ergebnisbericht als PDF",
      "summaryShareSubject": "Simplications Ergebnis",
      "summaryTitle": "Ihr Ergebnis",
      "technical": "Technisch",
      "totalScore": "Gesamt",
      "urgent": "Dringend",
      "website": "Website",
      "websiteOpenFailed": "Website konnte nicht geöffnet werden.",
      "welcomeDescription":
          "Erfassen Sie Raum für Raum Ihre smarten Geräte und erhalten Sie eine Privatsphärebewertung mit konkreten Empfehlungen.",
      "welcomeTitle": "Der Simplications\nSmart Home\nPrivatsphäre-Check",
      "yes": "Ja",
    },
    'en': <String, String>{
      "a_access_logging_desc":
          "Enable logging and notifications for lock openings so unauthorized access can be detected.",
      "a_access_logging_title": "Enable access log",
      "a_account_required_desc":
          "If account-free operation is not possible, use a separate account with minimal profile data and disable personalized services.",
      "a_account_required_title": "Minimize privacy impact of required account",
      "a_camera_consent_desc":
          "Obtain consent from everyone affected. The camera must not record areas without consent.",
      "a_camera_consent_title": "Align camera positioning with residents",
      "a_child_data_limits_desc":
          "Disable optional profile data and collect only the child data required for core functionality.",
      "a_child_data_limits_title": "Minimize data collection",
      "a_cloud_required_desc":
          "Enable local navigation or offline mode if available. If not, consider switching to a more privacy-friendly model.",
      "a_cloud_required_title": "Reduce cloud dependency",
      "a_data_collection_desc":
          "Disable transmission of temperature history to the vendor in the thermostat app and shorten the retention period.",
      "a_data_collection_title": "Disable history upload",
      "a_dont_know_desc":
          "At least one question was answered with \"I don't know\". Review your device settings and documentation to reduce risk more effectively.",
      "a_dont_know_title": "Get to know device settings better",
      "a_expert_access_control_granular_desc":
          "Use separate accounts instead of shared logins and grant only the minimum necessary permissions.",
      "a_expert_access_control_granular_title":
          "Introduce granular roles and accounts",
      "a_expert_access_revocation_desc":
          "Ensure that digital keys can be revoked individually and immediately, e.g., in case of device loss.",
      "a_expert_access_revocation_title": "Set up rapid access revocation",
      "a_expert_bystander_transparency_desc":
          "Provide visible notices, recording indicators, and clear information for people in the surrounding area.",
      "a_expert_bystander_transparency_title":
          "Add transparency notices for bystanders",
      "a_expert_child_data_protection_desc":
          "Enable child-appropriate profiles, minimize data collection, and disable profiling/sharing.",
      "a_expert_child_data_protection_title":
          "Strengthen child data protection",
      "a_expert_data_retention_duration_desc":
          "Set short, clear retention periods in settings and regularly delete old data.",
      "a_expert_data_retention_duration_title": "Define retention periods",
      "a_expert_data_sale_disabled_desc":
          "Enable available \"Do not sell\" options or object to data sharing for commercial purposes.",
      "a_expert_data_sale_disabled_title": "Opt out of data sale",
      "a_expert_offline_functionality_desc":
          "Enable local operating modes and minimize mandatory cloud features where the device allows.",
      "a_expert_offline_functionality_title":
          "Prioritize offline functionality",
      "a_expert_sensitive_inference_controls_desc":
          "Disable features that infer sensitive health or behavioral profiles unless strictly necessary.",
      "a_expert_sensitive_inference_controls_title":
          "Restrict inference features",
      "a_expert_third_party_sharing_limited_desc":
          "Disable partner, advertising, and analytics sharing in privacy and account settings.",
      "a_expert_third_party_sharing_limited_title": "Limit third-party sharing",
      "a_expert_update_support_window_desc":
          "Review the vendor's official update policy and plan a device replacement if no commitment is given.",
      "a_expert_update_support_window_title": "Verify update commitment",
      "a_expert_vulnerability_process_desc":
          "Prefer vendors with a clear security contact and responsible disclosure process.",
      "a_expert_vulnerability_process_title": "Review vendor security process",
      "a_family_access_desc":
          "Set up separate roles/accounts so that only authorized people can adjust the heating.",
      "a_family_access_title": "Separate access rights for household members",
      "a_health_sharing_desc":
          "Revoke health data access from unnecessary third-party apps in app and account settings.",
      "a_health_sharing_title": "Restrict health data sharing",
      "a_informed_desc":
          "Inform all residents about what data the device collects, who has access, and how it can be disabled.",
      "a_informed_title": "Inform household members",
      "a_local_control_desc":
          "Use local scenes/schedules instead of cloud automations where available.",
      "a_local_control_title": "Enable local automations",
      "a_local_mode_desc":
          "Use the device primarily via local sources (e.g., HDMI) to reduce data transfer to the vendor.",
      "a_local_mode_title": "Prefer offline use",
      "a_location_tracking_desc":
          "Disable location tracking outside active use or allow it only while the app is in use.",
      "a_location_tracking_title": "Reduce location sharing",
      "a_map_privacy_desc":
          "Switch storage to local and disable cloud backups of floor plans if the option is available.",
      "a_map_privacy_title": "Disable cloud floor-plan storage",
      "a_mic_active_desc":
          "Use the physical mute switch or disable the microphone in settings.",
      "a_mic_active_title": "Disable microphone when not in use",
      "a_motion_detection_desc":
          "Disable motion detection when people are home, or set a schedule that activates it only during absence.",
      "a_motion_detection_title": "Disable motion detection when at home",
      "a_network_desc":
          "Set up a dedicated Wi-Fi network for smart home devices, for example with your router's guest network.",
      "a_network_title": "Set up separate IoT Wi-Fi",
      "a_offline_control_desc":
          "Configure local schedules and control without cloud dependency if the device supports it.",
      "a_offline_control_title": "Set up local control",
      "a_offline_fallback_desc":
          "Check local switches/buttons and set up fallback controls so the device remains usable without internet.",
      "a_offline_fallback_title": "Ensure offline fallback",
      "a_offline_unlock_desc":
          "Set up a physical key or emergency code and test access when internet is unavailable.",
      "a_offline_unlock_title": "Secure offline access",
      "a_parental_control_desc":
          "Enable parental controls with a PIN and restrict contacts, features, and sharing to what is necessary.",
      "a_parental_control_title": "Set up parental controls",
      "a_password_desc":
          "Replace the default password with a strong, unique password. Use a password manager.",
      "a_password_title": "Change default password",
      "a_permissions_desc":
          "Check companion-app permissions in phone settings and disable unnecessary ones.",
      "a_permissions_title": "Restrict app permissions",
      "a_recording_disable_desc":
          "Disable recording features by default and enable them only briefly when specifically needed.",
      "a_recording_disable_title": "Disable audio/video recordings",
      "a_sensor_data_deletion_desc":
          "Review retention periods in app or web UI and enable auto deletion, or delete older data manually on a regular basis.",
      "a_sensor_data_deletion_title": "Delete old measurement values",
      "a_sensor_frequency_desc":
          "If possible, reduce sensor measurement frequency. Less frequent measurements produce fewer behavior data points.",
      "a_sensor_frequency_title": "Reduce measurement interval",
      "a_sensor_granularity_desc":
          "If possible, switch to less granular display or evaluation, for example daily values instead of minute values.",
      "a_sensor_granularity_title": "Show less detailed data",
      "a_sensor_local_desc":
          "Check whether cloud sync can be disabled or local storage enabled so measurement data is not sent to the vendor.",
      "a_sensor_local_title": "Prefer local processing",
      "a_sharing_restrictions_desc":
          "Remove all unnecessary shares in the app and allow live view/recordings only for required accounts.",
      "a_sharing_restrictions_title": "Restrict camera access",
      "a_skills_permissions_desc":
          "Review which third-party skills have access. Disable unnecessary skills.",
      "a_skills_permissions_title": "Review skills/integrations",
      "a_tracking_disabled_desc":
          "Disable tracking, personalized advertising, and optional telemetry in privacy settings.",
      "a_tracking_disabled_title": "Disable tracking and advertising",
      "a_two_factor_desc":
          "BSI recommendation: Enable 2FA for your lock account to protect remote access.",
      "a_two_factor_title": "Enable two-factor authentication",
      "a_updates_desc":
          "Enable automatic security updates in device or app settings.",
      "a_updates_title": "Enable automatic updates",
      "a_usage_tracking_desc":
          "Disable analytics, telemetry, and usage data collection in app settings.",
      "a_usage_tracking_title": "Disable usage tracking",
      "a_video_encryption_desc":
          "Enable end-to-end encrypted transmission for live view and recordings in your camera app/settings.",
      "a_video_encryption_title": "Enable end-to-end video encryption",
      "a_video_storage_desc":
          "Configure local storage if possible. If cloud-only storage is unavoidable, shorten the retention period and delete recordings regularly.",
      "a_video_storage_title": "Store recordings locally",
      "a_vision_data_desc":
          "Disable upload/storage of camera images and use exclusively local navigation processing where possible.",
      "a_vision_data_title": "Process camera data locally only",
      "a_voice_history_desc":
          "BSI recommendation: Regularly delete voice recordings and disable voice history storage if the option is available.",
      "a_voice_history_title": "Delete voice recordings",
      "a_voice_local_desc":
          "Enable local voice processing if available. If not, minimize cloud storage of voice data.",
      "a_voice_local_title": "Enable local voice processing",
      "about": "About",
      "aboutPartnerHsAnhalt": "Anhalt University of Applied Sciences",
      "aboutPartnerTuChemnitz": "Chemnitz University of Technology",
      "aboutPartnerVzSachsen": "Consumer Center Saxony",
      "aboutProjectName": "Simplications",
      "aboutScreenTitle": "About the app",
      "aboutSubtitle": "Research project on smart home privacy",
      "aboutWebsiteFundingAgencyLabel": "bmftr.bund.de",
      "aboutWebsiteFundingAgencyUrl": "https://www.bmftr.bund.de",
      "aboutWebsiteHsAnhaltLabel": "hs-anhalt.de",
      "aboutWebsiteHsAnhaltUrl": "https://www.hs-anhalt.de",
      "aboutWebsitePlatformPrivacyLabel": "plattform-privatheit.de",
      "aboutWebsitePlatformPrivacyUrl": "https://www.plattform-privatheit.de",
      "aboutWebsiteSimplicationsLabel": "simplications.tucmi.de",
      "aboutWebsiteSimplicationsUrl": "https://simplications.tucmi.de",
      "aboutWebsiteTuChemnitzLabel": "tu-chemnitz.de",
      "aboutWebsiteTuChemnitzUrl": "https://www.tu-chemnitz.de",
      "aboutWebsiteVzSachsenLabel": "verbraucherzentrale-sachsen.de",
      "aboutWebsiteVzSachsenUrl": "https://www.verbraucherzentrale-sachsen.de",
      "add": "Add",
      "addDevice": "Add\ndevice",
      "addDeviceDialogTitle": "Add new device",
      "addRoom": "Add room",
      "addRoomDialogTitle": "Add new room",
      "allDataDeleted": "All saved data has been deleted.",
      "alreadyEvaluated": "Already evaluated",
      "appTitle": "Simplications",
      "baseRiskHint": "e.g. 30 (low) to 60 (high)",
      "baseRiskLabel": "Base risk score (0-100)",
      "camera": "Camera",
      "cancel": "Cancel",
      "catalogButton": "Open full action catalog",
      "catalogSnackBarPrefix": "Catalog",
      "chooseIcon": "Choose icon:",
      "confirm": "Confirm",
      "connectedDevice": "Connected device",
      "coordination": "Coordination",
      "coordinationFunding": "Coordination & Funding",
      "currentLanguage": "Current language",
      "dangerZone": "Danger zone",
      "dangerZoneWarning":
          "Warning: This action permanently removes all saved app data.",
      "delete": "Delete",
      "deleteAllDataBody":
          "All captured rooms, devices, and answers will be permanently deleted. This action cannot be undone.",
      "deleteAllDataButton": "Delete data",
      "deleteAllDataTitle": "Delete all data?",
      "deleteDeviceBody":
          "This custom device will be deleted. All linked instances will also be removed.",
      "deleteDeviceTitle": "Delete device?",
      "deviceName": "Device name",
      "deviceNameHint": "e.g. My smart speaker",
      "deviceQuestion": "Which smart devices do you use in this room?",
      "deviceQuestionHint": "Tap a device to answer its questions.",
      "deviceTitlePrefix": "Devices",
      "device_baby_monitor": "Baby monitor / baby camera",
      "device_doorbell_camera": "Smart doorbell with camera",
      "device_fitness_tracker": "Fitness tracker / smartwatch",
      "device_humidity_sensor": "Humidity sensor",
      "device_indoor_camera": "Smart indoor camera",
      "device_light_sensor": "Light sensor",
      "device_outdoor_camera": "Smart outdoor camera",
      "device_robot_vacuum": "Robot vacuum",
      "device_simple_sensor":
          "Sensor (e.g., door, motion, temperature, humidity, or light sensor)",
      "device_smart_blind": "Smart blind / shutter",
      "device_smart_coffee": "Smart coffee machine",
      "device_smart_display": "Smart display (e.g., Nest Hub)",
      "device_smart_fridge": "Smart fridge",
      "device_smart_hub": "Smart home hub (e.g., Homey, Home Assistant)",
      "device_smart_irrigation": "Smart irrigation system",
      "device_smart_light": "Smart lighting",
      "device_smart_lock": "Smart door lock",
      "device_smart_meter": "Intelligent electricity meter / smart meter",
      "device_smart_oven": "Smart oven / stove",
      "device_smart_plug": "Smart plug",
      "device_smart_printer": "Smart printer",
      "device_smart_router": "Smart router / mesh system",
      "device_smart_scale": "Smart scale",
      "device_smart_speaker": "Smart speaker / voice assistant",
      "device_smart_thermostat": "Smart thermostat / heating control",
      "device_smart_toy": "Smart toy",
      "device_smart_tv": "Smart TV",
      "device_smart_washing": "Smart washer / dryer",
      "device_temperature_sensor": "Temperature sensor",
      "devicesRated": "rated devices",
      "done": "Done",
      "dontKnow": "I don't know",
      "dontKnowHint":
          " {count} answer{suffix} were marked as \"I don't know\" - take time to understand your device settings better.",
      "evaluatedDevices": "Evaluated devices",
      "expertModeQuestionnaireHint":
          "Expert mode: these questions deepen data-practice and governance coverage (including retention, access control, and third-party sharing) based on CMU IoT Label and Unboxing.IoT.Privacy approaches.",
      "expertModeSourceCmuLabel": "CMU IoT Security & Privacy Label (CISPL)",
      "expertModeSourceCmuUrl": "https://iotsecurityprivacy.org/labels",
      "expertModeSourceUnboxingLabel":
          "Unboxing.IoT.Privacy (community platform)",
      "expertModeSourceUnboxingUrl": "https://iot-privacy.info/project/",
      "expertModeSourcesHint":
          "Methodologically inspired by the following research projects:",
      "expertModeTitle": "Expert mode",
      "expertModeToggleHint":
          "Same workflow, but much more detailed device questions (e.g., retention duration, access control, third-party sharing).",
      "expertModeToggleLabel": "Enable detailed expert mode",
      "exportFailed": "Export failed",
      "faq": "FAQ",
      "faqAnswerCanShare":
          "Yes. You can export and share your summary as text or PDF directly from the results screen.",
      "faqAnswerDataStored":
          "Your assessment data is stored locally on your device. You can delete all stored data at any time in the About screen.",
      "faqAnswerHowWorks":
          "You select a room, add your smart devices, answer device-specific questions, and receive a risk profile with prioritized actions.",
      "faqAnswerLegalAdvice":
          "No. Simplications provides practical orientation and recommendations, but does not replace legal or professional security consultation.",
      "faqAnswerNoDevice":
          "You can add custom devices and still complete the check. The recommendations then rely on your provided setup and answers.",
      "faqAnswerNoPolicy": "Because we do not collect your data.",
      "faqAnswerRiskMeaning":
          "They indicate how strongly your current configuration may expose privacy-related risks. They are guidance levels, not legal or technical certification.",
      "faqAnswerWhatIs":
          "Simplications is a research project on smart-home privacy. This app is one part of the project and guides you room by room through your devices with practical recommendations based on your answers.",
      "faqQuestionCanShare": "Can I share my results?",
      "faqQuestionDataStored": "Where is my data stored?",
      "faqQuestionHowWorks": "How does the check work?",
      "faqQuestionLegalAdvice": "Is this legal advice?",
      "faqQuestionNoDevice": "What if my device is not listed?",
      "faqQuestionNoPolicy": "Why is there no data protection policy?",
      "faqQuestionRiskMeaning": "What do low, medium, and high risk mean?",
      "faqQuestionWhatIs": "What is Simplications?",
      "faqScreenTitle": "Frequently Asked Questions",
      "fullCatalog": "Full action catalog",
      "fundingAgency": "Funding body",
      "fundingAgencyValue":
          "German Federal Ministry of Research, Technology and Space\nGrant 16KIS1868K",
      "gen_rec_0":
          "Set up a separate Wi-Fi network for smart home devices (e.g., your router's guest network).",
      "gen_rec_1":
          "Use a password manager and assign a unique, strong password to each device.",
      "gen_rec_2":
          "Enable multi-factor authentication (MFA) for all vendor accounts.",
      "gen_rec_3":
          "Define who in your household is responsible for updates, backups, and accounts.",
      "gen_rec_4":
          "Regularly review (at least once per quarter) all access permissions and accounts.",
      "gen_rec_5":
          "Dispose of old devices in a privacy-safe way: perform a factory reset and remove them from vendor cloud accounts.",
      "gen_rec_6":
          "Use a household consent check before buying new devices and involve all household members.",
      "generalRecommendations": "General recommendations",
      "generalRecommendationsHint":
          "These measures apply to your whole smart home regardless of individual devices.",
      "hasCamera": "Has camera?",
      "hasMicrophone": "Has microphone?",
      "highRisk": "High risk",
      "howRiskCalculated": "How is risk calculated?",
      "languageDialogTitle": "Choose language",
      "lowRisk": "Low risk",
      "mediumRisk": "Medium risk",
      "microphone": "Microphone",
      "nextRoom": "Next room",
      "no": "No",
      "noActionHigh":
          "No concrete actions can currently be derived from your answers, but a high residual risk remains.",
      "noActionLow": "Everything is fine - no actions required.",
      "noActionMedium":
          "No concrete actions can currently be derived from your answers, but a medium residual risk remains.",
      "noDevice": "No device",
      "noDeviceDialogBody":
          "This room will be completed without devices and will not affect scoring.",
      "noDeviceDialogBodyWithExisting":
          "Existing device selections for this room will be discarded. This room will be completed without devices and will not affect scoring.",
      "noDeviceDialogTitle": "No devices in this room?",
      "noDevicesCaptured": "No devices captured.",
      "noDevicesHint": "Restart and add devices to receive an assessment.",
      "noKnownDevices":
          "No known devices for this room. You can add your own device.",
      "notApplicableForDevice": "This question does not apply to my device",
      "notCompleted": "Not completed",
      "note": "Note",
      "optional": "Optional",
      "overallHigh":
          "Several devices have significant privacy/data-protection risks. Please implement high-priority measures promptly.",
      "overallLow":
          "Well done! Your devices are mostly configured securely. Still review the general recommendations.",
      "overallMedium":
          "There is room for improvement. Review the recommendations for each device.",
      "overallRisk": "Overall risk",
      "overview": "Overview",
      "platformPrivacy": "Platform Privacy",
      "projectPartners": "Project partners",
      "q_access_logging_hint":
          "An access log helps you detect suspicious activity.",
      "q_access_logging_text": "Can you track who opened the lock and when?",
      "q_account_required_hint":
          "Mandatory accounts enable ad tracking and storage of viewing habits. Account-free use protects privacy.",
      "q_account_required_text":
          "Can you use the device without a mandatory online account?",
      "q_camera_consent_hint":
          "Cameras in communal or private areas require the consent of all residents.",
      "q_camera_consent_text":
          "Does the camera only record areas for which everyone affected has given their consent?",
      "q_child_data_limits_hint":
          "Child-focused devices should collect and store minimal data.",
      "q_child_data_limits_text":
          "Can you limit which personal data the toy collects?",
      "q_cloud_required_hint":
          "Devices with local navigation are more privacy-friendly because no room data is uploaded.",
      "q_cloud_required_text":
          "Does floor-plan navigation work without cloud connection?",
      "q_data_collection_hint":
          "History can reveal presence patterns and habits. Local storage reduces unwanted analysis.",
      "q_data_collection_text":
          "Do temperature history and schedules stay on-device (not sent to the vendor)?",
      "q_expert_access_control_granular_hint":
          "Granular access control reduces the risk of unauthorized access and misuse.",
      "q_expert_access_control_granular_text":
          "Can you control access rights granularly (roles, separate accounts, no shared default logins)?",
      "q_expert_access_revocation_hint":
          "Fast revocation is crucial when devices are shared or users change.",
      "q_expert_access_revocation_text":
          "Can digital keys/access rights be revoked quickly and individually?",
      "q_expert_bystander_transparency_hint":
          "This addresses bystander privacy and is highlighted in Unboxing.IoT.Privacy as a key challenge.",
      "q_expert_bystander_transparency_text":
          "Are people nearby transparently informed (for example via visibility, notices, clear recording indicators)?",
      "q_expert_child_data_protection_hint":
          "Devices in child-related contexts require especially strict privacy safeguards.",
      "q_expert_child_data_protection_text":
          "Are child-data protections active (minimization, no profiling, restrictive sharing)?",
      "q_expert_data_retention_duration_hint":
          "Inspired by the CMU IoT Security & Privacy Label and Unboxing.IoT.Privacy: short, clear retention periods reduce risk.",
      "q_expert_data_retention_duration_text":
          "Is the retention duration for your personal data explicitly defined and limited to what is necessary?",
      "q_expert_data_sale_disabled_hint":
          "An explicit \"no data sale\" option is a strong privacy signal.",
      "q_expert_data_sale_disabled_text":
          "Is the sale of your data excluded (or actively disabled, where possible)?",
      "q_expert_offline_functionality_hint":
          "More offline functionality often means less continuous data transfer to the cloud.",
      "q_expert_offline_functionality_text":
          "Does the device remain meaningfully usable with limited internet connectivity?",
      "q_expert_sensitive_inference_controls_hint":
          "Inference controls reduce risks from secondary use of sensitive data.",
      "q_expert_sensitive_inference_controls_text":
          "Are features that infer sensitive health or behavior profiles restricted or disableable?",
      "q_expert_third_party_sharing_limited_hint":
          "Check privacy and account settings to see whether data is sent to advertising, analytics, or partner services.",
      "q_expert_third_party_sharing_limited_text":
          "Is third-party sharing disabled or clearly limited to necessary services?",
      "q_expert_update_support_window_hint":
          "A transparent update commitment reduces long-term security and privacy risks.",
      "q_expert_update_support_window_text":
          "Is it known how long the vendor guarantees security updates?",
      "q_expert_vulnerability_process_hint":
          "Prefer vendors that provide responsible disclosure policies or clear security contact information.",
      "q_expert_vulnerability_process_text":
          "Is there a documented process for reporting and fixing vulnerabilities?",
      "q_family_access_hint":
          "Household members should have control without visitors changing everything.",
      "q_family_access_text":
          "Can you control who may adjust heating (e.g., restrict guests)?",
      "q_health_sharing_hint":
          "Health data is sensitive. Only authorized apps should have access.",
      "q_health_sharing_text":
          "Can you control which third parties can access your health data?",
      "q_informed_hint":
          "All household members should know what data the device captures.",
      "q_informed_text":
          "Are all people in the household informed about this device and its function?",
      "q_local_control_hint":
          "Local scenes and schedules protect your privacy better.",
      "q_local_control_text": "Can automations run locally without internet?",
      "q_local_mode_hint":
          "Offline use protects usage data from being sent to the vendor.",
      "q_local_mode_text":
          "Can you use the device via HDMI or local sources without internet?",
      "q_location_tracking_hint":
          "GPS tracking uses battery and can reveal movement patterns.",
      "q_location_tracking_text":
          "Can you disable location tracking when not needed?",
      "q_map_privacy_hint":
          "Home floor plans are sensitive information and should not be sent to the vendor.",
      "q_map_privacy_text":
          "Are created floor plans stored exclusively on the device locally?",
      "q_mic_active_hint":
          "Smart speakers and devices with microphones can be activated unintentionally.",
      "q_mic_active_text":
          "Do you deactivate the microphone when you are not actively using it?",
      "q_motion_detection_hint":
          "BSI recommendation: Avoiding unnecessary recordings reduces data volume and misuse risk.",
      "q_motion_detection_text":
          "Can you disable or schedule motion detection when you are at home?",
      "q_network_hint":
          "A dedicated network for smart devices protects your main home network.",
      "q_network_text":
          "Is the device connected to a separate smart home or IoT Wi-Fi network?",
      "q_offline_control_hint":
          "Offline operation or local automation protects data from cloud access.",
      "q_offline_control_text":
          "Can you operate the thermostat offline (without internet)?",
      "q_offline_fallback_hint":
          "Reliable local operation is important for daily use and privacy.",
      "q_offline_fallback_text":
          "Do devices still work if internet or app connection fails?",
      "q_offline_unlock_hint":
          "Backup options prevent lockout during internet or power outages.",
      "q_offline_unlock_text":
          "Can you unlock the lock offline (e.g., with code or key)?",
      "q_parental_control_hint":
          "Parental controls should allow restricting contacts and features.",
      "q_parental_control_text":
          "Are there parental control features to manage the toy?",
      "q_password_hint":
          "Default passwords are often publicly known and easy to crack.",
      "q_password_text":
          "Have you changed the default password of the device or its linked account?",
      "q_permissions_hint":
          "Only permissions that are truly needed should be enabled.",
      "q_permissions_text":
          "Have you disabled unnecessary app permissions (e.g., location, contacts)?",
      "q_recording_disable_hint":
          "BSI recommendation: Recordings of children should only be possible with explicit control.",
      "q_recording_disable_text":
          "Can you disable audio and video recording on the device?",
      "q_sensor_data_deletion_hint":
          "Old historical data should not be stored permanently. Check retention settings.",
      "q_sensor_data_deletion_text":
          "Are older measurement values deleted automatically or on request?",
      "q_sensor_frequency_hint":
          "A lower measurement frequency produces less data and limits inferences about your behavior.",
      "q_sensor_frequency_text":
          "Can you reduce the sensor measurement interval (e.g., measure less frequently)?",
      "q_sensor_granularity_hint":
          "Less granular views help prevent inferences about precise presence or behavior patterns.",
      "q_sensor_granularity_text":
          "Does the system show sensor data only in aggregated form (e.g., daily instead of minute values)?",
      "q_sensor_local_hint":
          "Local processing prevents the vendor from accessing your measurement data.",
      "q_sensor_local_text":
          "Is measurement data processed and stored locally without being transferred to the cloud?",
      "q_sharing_restrictions_hint":
          "You should be able to precisely control access to video recordings.",
      "q_sharing_restrictions_text":
          "Can you control who can access live view and recordings?",
      "q_skills_permissions_hint":
          "Third-party skills can access sensitive data. Enable only necessary skills.",
      "q_skills_permissions_text":
          "Do you regularly review which skills have access to your account?",
      "q_tracking_disabled_hint":
          "Smart TVs often collect viewing habit data. Look for privacy settings.",
      "q_tracking_disabled_text":
          "Can you completely disable advertising and tracking features?",
      "q_two_factor_hint":
          "BSI recommendation: 2FA protects your account from unauthorized remote access.",
      "q_two_factor_text":
          "Is two-factor authentication (2FA) available for the lock account?",
      "q_updates_hint":
          "Updates close known security vulnerabilities promptly.",
      "q_updates_text":
          "Are automatic security updates enabled for the device?",
      "q_usage_tracking_hint":
          "Usage patterns can reveal presence and habits. Check app privacy settings.",
      "q_usage_tracking_text":
          "Have you disabled or limited vendor collection of switching patterns and usage times?",
      "q_video_encryption_hint":
          "BSI recommendation: Encrypted connections prevent interception and data theft in transit.",
      "q_video_encryption_text":
          "Is video recording and transmission encrypted end-to-end?",
      "q_video_storage_hint":
          "Local storage gives you more control over your data; cloud-only storage depends on vendor security.",
      "q_video_storage_text":
          "Are recordings stored locally (not only in the vendor cloud)?",
      "q_vision_data_hint":
          "Camera images should be processed locally for navigation and neither stored nor sent to the vendor.",
      "q_vision_data_text":
          "If the robot uses cameras: are camera images used locally only for navigation (no storing or transfer)?",
      "q_voice_history_hint":
          "BSI recommendation: Minimize recording retention or delete recordings regularly.",
      "q_voice_history_text":
          "Can you delete voice recordings from device history or disable this feature?",
      "q_voice_local_hint":
          "Local processing reduces the amount of data sent to the cloud.",
      "q_voice_local_text":
          "Is voice processing performed partly on the device locally?",
      "questionnaireTitle": "Questions",
      "recommendations": "Recommendations",
      "recommended": "Recommended",
      "reportExportedAt": "Exported at",
      "restart": "Restart",
      "results": "Results",
      "resume": "Resume",
      "risk": "Risk",
      "risk_hint_camera":
          "You answered all questions positively. However, baseline risk remains higher for cameras because they capture highly sensitive observation data and can be misused for surveillance if misconfigured.",
      "risk_hint_child_room":
          "You answered all questions positively. However, baseline risk remains elevated in a child's bedroom because especially sensitive data about children and their daily life can be affected there.",
      "risk_hint_generic":
          "You answered all questions positively. The device can still remain medium/high risk because its type may reveal sensitive usage and behavior data.",
      "risk_hint_lock":
          "You answered all questions positively. However, smart locks still have elevated baseline risk because misuse directly affects physical access to your home.",
      "risk_hint_mic":
          "You answered all questions positively. However, baseline risk remains elevated for microphone devices because voice data is highly sensitive and accidental activation or cloud processing still carries risks.",
      "roomCheck": "Room check",
      "roomDeleteBody":
          "This custom room will be deleted. All linked devices will also be removed.",
      "roomDeleteTitle": "Delete room?",
      "roomInstruction":
          "Tap a room, capture your devices there, then return here to choose the next room.",
      "roomName": "Room name",
      "roomNameHint": "e.g. Living room, Garage",
      "roomQuestion": "Which room would you like to check now?",
      "roomSelectionTitle": "Select room",
      "room_basement": "Basement / Pantry",
      "room_bathroom": "Bathroom",
      "room_bedroom": "Bedroom",
      "room_child_bedroom": "Child's bedroom",
      "room_garden": "Garden / Outdoor area",
      "room_hallway": "Hallway / Entrance",
      "room_kitchen": "Kitchen",
      "room_living": "Living room",
      "room_office": "Office",
      "room_whole_home": "Entire home",
      "security": "Security",
      "shareAsPdf": "Share as PDF",
      "shareAsText": "Share as text",
      "shareResult": "Share result",
      "skippedDevicesHint":
          "{count} devices skipped because the questionnaire was not completed.",
      "sl_access_logging": "No access log available",
      "sl_account_required": "Mandatory vendor account required",
      "sl_base_risk": "Baseline risk of device type",
      "sl_camera_consent": "No consent for camera-covered area",
      "sl_child_data_limits": "Data collection not limited",
      "sl_child_room_bonus": "Increased sensitivity: child's bedroom",
      "sl_cloud_required": "Navigation only possible via cloud",
      "sl_data_collection": "Temperature history sent to vendor",
      "sl_expert_access_control_granular": "Granular access control missing",
      "sl_expert_access_revocation":
          "Individual access revocation not possible",
      "sl_expert_bystander_transparency":
          "Transparency for nearby bystanders missing",
      "sl_expert_child_data_protection":
          "Child-data protection measures missing",
      "sl_expert_data_retention_duration":
          "Retention duration unclear or too long",
      "sl_expert_data_sale_disabled": "Data sale not excluded",
      "sl_expert_offline_functionality":
          "Meaningful offline operation not possible",
      "sl_expert_sensitive_inference_controls":
          "Controls against sensitive inference missing",
      "sl_expert_third_party_sharing_limited":
          "Third-party sharing not limited",
      "sl_expert_update_support_window":
          "Guaranteed update support window unknown",
      "sl_expert_vulnerability_process": "Vulnerability process not documented",
      "sl_family_access": "Access cannot be restricted",
      "sl_health_sharing": "Health data shared with third parties",
      "sl_informed": "Household members not informed",
      "sl_local_control": "Automations require internet connection",
      "sl_local_mode": "No offline operation possible",
      "sl_location_tracking": "Location tracking enabled",
      "sl_map_privacy": "Floor plan transmitted to vendor",
      "sl_mic_active": "Microphone not disabled when unused",
      "sl_motion_detection": "Motion detection always active",
      "sl_network": "No separate IoT Wi-Fi configured",
      "sl_offline_control": "No offline operation possible",
      "sl_offline_fallback": "Device unusable offline",
      "sl_offline_unlock": "No offline unlock possible",
      "sl_parental_control": "Parental controls not configured",
      "sl_password": "Default password not changed",
      "sl_permissions": "App permissions not reduced",
      "sl_recording_disable": "Recording cannot be disabled",
      "sl_sensor_data_deletion": "Old measurement values not deleted",
      "sl_sensor_frequency": "Measurement interval not reduced",
      "sl_sensor_granularity": "Data stored with too much granularity",
      "sl_sensor_local": "Data transferred to cloud",
      "sl_sharing_restrictions": "Recording access not controlled",
      "sl_skills_permissions": "Skills not reviewed regularly",
      "sl_tracking_disabled": "Ad tracking not disabled",
      "sl_two_factor": "Two-factor authentication missing",
      "sl_updates": "Automatic updates not enabled",
      "sl_usage_tracking": "Switching patterns collected by vendor",
      "sl_video_encryption": "Video transmission not encrypted",
      "sl_video_storage": "Recordings only in vendor cloud",
      "sl_vision_data": "Camera images stored or transmitted",
      "sl_voice_history": "Voice recordings not deletable",
      "sl_voice_local": "No local voice processing",
      "smartHomePrivacyHeader": "Your smart home privacy",
      "social": "Social",
      "start": "Start",
      "stepAnswerQuestions": "Answer questions",
      "stepCaptureDevices": "Capture devices",
      "stepGetRisk": "Get risk profile & recommendations",
      "stepSelectRooms": "Select room",
      "summarySharePdfText": "Simplications report as PDF",
      "summaryShareSubject": "Simplications result",
      "summaryTitle": "Your result",
      "technical": "Technical",
      "totalScore": "Total",
      "urgent": "Urgent",
      "website": "Website",
      "websiteOpenFailed": "Could not open website.",
      "welcomeDescription":
          "Capture your smart devices room by room and receive a privacy assessment with concrete recommendations.",
      "welcomeTitle": "Simplications\nSmart Home\nPrivacy Check",
      "yes": "Yes",
    },
    'fr': <String, String>{
      "about": "À propos",
      "aboutPartnerHsAnhalt": "Haute école d’Anhalt",
      "aboutPartnerTuChemnitz": "Université technique de Chemnitz",
      "aboutPartnerVzSachsen": "Centre des consommateurs de Saxe",
      "aboutProjectName": "Simplications",
      "aboutScreenTitle": "À propos de l’application",
      "aboutSubtitle":
          "Projet de recherche sur la confidentialité des maisons connectées",
      "aboutWebsiteFundingAgencyLabel": "bmftr.bund.de",
      "aboutWebsiteFundingAgencyUrl": "https://www.bmftr.bund.de",
      "aboutWebsiteHsAnhaltLabel": "hs-anhalt.de",
      "aboutWebsiteHsAnhaltUrl": "https://www.hs-anhalt.de",
      "aboutWebsitePlatformPrivacyLabel": "plattform-privatheit.de",
      "aboutWebsitePlatformPrivacyUrl": "https://www.plattform-privatheit.de",
      "aboutWebsiteSimplicationsLabel": "simplications.tucmi.de",
      "aboutWebsiteSimplicationsUrl": "https://simplications.tucmi.de",
      "aboutWebsiteTuChemnitzLabel": "tu-chemnitz.de",
      "aboutWebsiteTuChemnitzUrl": "https://www.tu-chemnitz.de",
      "aboutWebsiteVzSachsenLabel": "verbraucherzentrale-sachsen.de",
      "aboutWebsiteVzSachsenUrl": "https://www.verbraucherzentrale-sachsen.de",
      "add": "Ajouter",
      "addDevice": "Ajouter\nun appareil",
      "addDeviceDialogTitle": "Ajouter un nouvel appareil",
      "addRoom": "Ajouter une pièce",
      "addRoomDialogTitle": "Ajouter une nouvelle pièce",
      "allDataDeleted": "Toutes les données enregistrées ont été supprimées.",
      "alreadyEvaluated": "Déjà évalué",
      "appTitle": "Simplications",
      "baseRiskHint": "ex. 30 (faible) à 60 (élevé)",
      "baseRiskLabel": "Score de risque de base (0-100)",
      "camera": "Caméra",
      "cancel": "Annuler",
      "catalogButton": "Ouvrir le catalogue complet des actions",
      "catalogSnackBarPrefix": "Catalogue",
      "chooseIcon": "Choisir une icône :",
      "confirm": "Confirmer",
      "connectedDevice": "Appareil connecté",
      "coordination": "Coordination",
      "coordinationFunding": "Coordination et financement",
      "currentLanguage": "Langue actuelle",
      "dangerZone": "Zone de danger",
      "dangerZoneWarning":
          "Attention : cette action supprime définitivement toutes les données enregistrées de l’application.",
      "delete": "Supprimer",
      "deleteAllDataBody":
          "Toutes les pièces, appareils et réponses enregistrés seront supprimés définitivement. Cette action est irréversible.",
      "deleteAllDataButton": "Supprimer les données",
      "deleteAllDataTitle": "Supprimer toutes les données ?",
      "deleteDeviceBody":
          "Cet appareil personnalisé sera supprimé. Toutes les instances liées seront également supprimées.",
      "deleteDeviceTitle": "Supprimer l'appareil ?",
      "deviceName": "Nom de l’appareil",
      "deviceNameHint": "ex. Mon haut-parleur intelligent",
      "deviceQuestion":
          "Quels appareils intelligents utilisez-vous dans cette pièce ?",
      "deviceQuestionHint": "Touchez un appareil pour répondre aux questions.",
      "deviceTitlePrefix": "Appareils",
      "devicesRated": "appareils évalués",
      "done": "Terminé",
      "dontKnow": "Je ne sais pas",
      "dontKnowHint":
          " {count} réponse{suffix} a été marquée \"Je ne sais pas\" - prenez le temps de mieux comprendre les paramètres de vos appareils.",
      "evaluatedDevices": "Appareils évalués",
      "exportFailed": "Échec de l’export",
      "faq": "FAQ",
      "faqAnswerCanShare":
          "Oui. Depuis l’écran des résultats, vous pouvez exporter et partager votre résumé en texte ou en PDF.",
      "faqAnswerDataStored":
          "Vos données d’évaluation sont stockées localement sur votre appareil. Vous pouvez supprimer toutes les données enregistrées à tout moment depuis l’écran À propos.",
      "faqAnswerHowWorks":
          "Vous choisissez une pièce, ajoutez vos appareils intelligents, répondez à des questions spécifiques, puis recevez un profil de risque avec des actions priorisées.",
      "faqAnswerLegalAdvice":
          "Non. Simplications fournit une orientation pratique et des recommandations, mais ne remplace pas un conseil juridique ou une consultation professionnelle en sécurité.",
      "faqAnswerNoDevice":
          "Vous pouvez ajouter des appareils personnalisés et terminer le contrôle. Les recommandations s’appuieront alors sur votre configuration et vos réponses.",
      "faqAnswerNoPolicy": "Parce que nous ne collectons pas vos données.",
      "faqAnswerRiskMeaning":
          "Ces niveaux indiquent dans quelle mesure votre configuration actuelle peut exposer des risques de confidentialité. Ce sont des niveaux d’orientation, pas une certification juridique ou technique.",
      "faqAnswerWhatIs":
          "Simplications est un projet de recherche sur la confidentialité des maisons connectées. Cette application est une composante du projet et vous guide pièce par pièce à travers vos appareils avec des recommandations pratiques selon vos réponses.",
      "faqQuestionCanShare": "Puis-je partager mes résultats ?",
      "faqQuestionDataStored": "Où sont stockées mes données ?",
      "faqQuestionHowWorks": "Comment fonctionne le contrôle ?",
      "faqQuestionLegalAdvice": "Est-ce un conseil juridique ?",
      "faqQuestionNoDevice":
          "Que faire si mon appareil n’est pas dans la liste ?",
      "faqQuestionNoPolicy":
          "Pourquoi n’y a-t-il pas de politique de protection des données ?",
      "faqQuestionRiskMeaning":
          "Que signifient risque faible, moyen et élevé ?",
      "faqQuestionWhatIs": "Qu’est-ce que Simplications ?",
      "faqScreenTitle": "Questions fréquentes",
      "fullCatalog": "Catalogue complet des actions",
      "fundingAgency": "Organisme financeur",
      "fundingAgencyValue":
          "Ministère fédéral allemand de la Recherche, de la Technologie et de l’Espace\nSubvention 16KIS1868K",
      "generalRecommendations": "Recommandations générales",
      "generalRecommendationsHint":
          "Ces mesures s’appliquent à toute votre maison connectée, indépendamment des appareils individuels.",
      "hasCamera": "Possède une caméra ?",
      "hasMicrophone": "Possède un microphone ?",
      "highRisk": "Risque élevé",
      "howRiskCalculated": "Comment le risque est-il calculé ?",
      "languageDialogTitle": "Choisir la langue",
      "lowRisk": "Risque faible",
      "mediumRisk": "Risque moyen",
      "microphone": "Microphone",
      "nextRoom": "Pièce suivante",
      "no": "Non",
      "noActionHigh":
          "Aucune action concrète ne peut actuellement être déduite de vos réponses, mais un risque résiduel élevé demeure.",
      "noActionLow": "Tout va bien - aucune action n’est nécessaire.",
      "noActionMedium":
          "Aucune action concrète ne peut actuellement être déduite de vos réponses, mais un risque résiduel moyen demeure.",
      "noDevice": "Aucun appareil",
      "noDeviceDialogBody":
          "Cette pièce sera terminée sans appareil et n'affectera pas le score.",
      "noDeviceDialogBodyWithExisting":
          "Les sélections d'appareils existantes pour cette pièce seront ignorées. Cette pièce sera terminée sans appareil et n'affectera pas le score.",
      "noDeviceDialogTitle": "Aucun appareil dans cette pièce ?",
      "noDevicesCaptured": "Aucun appareil enregistré.",
      "noDevicesHint":
          "Redémarrez et ajoutez des appareils pour obtenir une évaluation.",
      "noKnownDevices":
          "Aucun appareil connu pour cette pièce. Vous pouvez ajouter votre propre appareil.",
      "notApplicableForDevice":
          "Cette question ne s'applique pas à mon appareil",
      "notCompleted": "Non terminé",
      "note": "Remarque",
      "optional": "Optionnel",
      "overallHigh":
          "Plusieurs appareils présentent des risques importants pour la confidentialité/protection des données. Veuillez mettre en œuvre rapidement les mesures prioritaires.",
      "overallLow":
          "Bien joué ! Vos appareils sont globalement configurés de façon sûre. Consultez tout de même les recommandations générales.",
      "overallMedium":
          "Il y a une marge d’amélioration. Consultez les recommandations pour chaque appareil.",
      "overallRisk": "Risque global",
      "overview": "Vue d’ensemble",
      "platformPrivacy": "Plattform Privatheit",
      "projectPartners": "Partenaires du projet",
      "questionnaireTitle": "Questions",
      "recommendations": "Recommandations",
      "recommended": "Recommandé",
      "reportExportedAt": "Exporté le",
      "restart": "Recommencer",
      "results": "Résultats",
      "resume": "Continuer",
      "risk": "Risque",
      "roomCheck": "Vérification de la pièce",
      "roomDeleteBody":
          "Cette pièce personnalisée sera supprimée. Tous les appareils liés seront également supprimés.",
      "roomDeleteTitle": "Supprimer la pièce ?",
      "roomInstruction":
          "Touchez une pièce, recensez-y vos appareils, puis revenez ici pour choisir la pièce suivante.",
      "roomName": "Nom de la pièce",
      "roomNameHint": "ex. Salon, Garage",
      "roomQuestion": "Quelle pièce souhaitez-vous vérifier maintenant ?",
      "roomSelectionTitle": "Sélectionner une pièce",
      "security": "Sécurité",
      "shareAsPdf": "Partager en PDF",
      "shareAsText": "Partager en texte",
      "shareResult": "Partager le résultat",
      "skippedDevicesHint":
          "{count} appareils ignorés car le questionnaire n'a pas été terminé.",
      "smartHomePrivacyHeader": "La confidentialité de votre maison connectée",
      "social": "Social",
      "start": "Démarrer",
      "stepAnswerQuestions": "Répondre aux questions",
      "stepCaptureDevices": "Recenser les appareils",
      "stepGetRisk": "Obtenir le profil de risque et les recommandations",
      "stepSelectRooms": "Choisir une pièce",
      "summarySharePdfText": "Rapport Simplications en PDF",
      "summaryShareSubject": "Résultat Simplications",
      "summaryTitle": "Votre résultat",
      "technical": "Technique",
      "totalScore": "Total",
      "urgent": "Urgent",
      "website": "Site web",
      "websiteOpenFailed": "Impossible d’ouvrir le site web.",
      "welcomeDescription":
          "Renseignez vos appareils intelligents pièce par pièce et obtenez une évaluation de confidentialité avec des recommandations concrètes.",
      "welcomeTitle": "Simplications\nContrôle de confidentialité\nSmart Home",
      "yes": "Oui",
    },
    'nl': <String, String>{
      "about": "Over",
      "aboutPartnerHsAnhalt": "Hogeschool Anhalt",
      "aboutPartnerTuChemnitz": "Technische Universiteit Chemnitz",
      "aboutPartnerVzSachsen": "Consumentenorganisatie Saksen",
      "aboutProjectName": "Simplications",
      "aboutScreenTitle": "Over de app",
      "aboutSubtitle": "Onderzoeksproject over smart-home-privacy",
      "aboutWebsiteFundingAgencyLabel": "bmftr.bund.de",
      "aboutWebsiteFundingAgencyUrl": "https://www.bmftr.bund.de",
      "aboutWebsiteHsAnhaltLabel": "hs-anhalt.de",
      "aboutWebsiteHsAnhaltUrl": "https://www.hs-anhalt.de",
      "aboutWebsitePlatformPrivacyLabel": "plattform-privatheit.de",
      "aboutWebsitePlatformPrivacyUrl": "https://www.plattform-privatheit.de",
      "aboutWebsiteSimplicationsLabel": "simplications.tucmi.de",
      "aboutWebsiteSimplicationsUrl": "https://simplications.tucmi.de",
      "aboutWebsiteTuChemnitzLabel": "tu-chemnitz.de",
      "aboutWebsiteTuChemnitzUrl": "https://www.tu-chemnitz.de",
      "aboutWebsiteVzSachsenLabel": "verbraucherzentrale-sachsen.de",
      "aboutWebsiteVzSachsenUrl": "https://www.verbraucherzentrale-sachsen.de",
      "add": "Toevoegen",
      "addDevice": "Apparaat\ntoevoegen",
      "addDeviceDialogTitle": "Nieuw apparaat toevoegen",
      "addRoom": "Kamer toevoegen",
      "addRoomDialogTitle": "Nieuwe kamer toevoegen",
      "allDataDeleted": "Alle opgeslagen gegevens zijn verwijderd.",
      "alreadyEvaluated": "Al beoordeeld",
      "appTitle": "Simplications",
      "baseRiskHint": "bijv. 30 (laag) tot 60 (hoog)",
      "baseRiskLabel": "Basisscore risico (0-100)",
      "camera": "Camera",
      "cancel": "Annuleren",
      "catalogButton": "Open volledige actiecatalogus",
      "catalogSnackBarPrefix": "Catalogus",
      "chooseIcon": "Kies een pictogram:",
      "confirm": "Bevestigen",
      "connectedDevice": "Verbonden apparaat",
      "coordination": "Coordinatie",
      "coordinationFunding": "Coordinatie en financiering",
      "currentLanguage": "Huidige taal",
      "dangerZone": "Gevarenzone",
      "dangerZoneWarning":
          "Waarschuwing: deze actie verwijdert alle opgeslagen app-gegevens permanent.",
      "delete": "Verwijderen",
      "deleteAllDataBody":
          "Alle vastgelegde kamers, apparaten en antwoorden worden permanent verwijderd. Deze actie kan niet ongedaan worden gemaakt.",
      "deleteAllDataButton": "Gegevens verwijderen",
      "deleteAllDataTitle": "Alle gegevens verwijderen?",
      "deleteDeviceBody":
          "Dit aangepaste apparaat wordt verwijderd. Alle gekoppelde instanties worden ook verwijderd.",
      "deleteDeviceTitle": "Apparaat verwijderen?",
      "deviceName": "Apparaatnaam",
      "deviceNameHint": "bijv. Mijn slimme speaker",
      "deviceQuestion": "Welke slimme apparaten gebruikt u in deze kamer?",
      "deviceQuestionHint": "Tik op een apparaat om de vragen te beantwoorden.",
      "deviceTitlePrefix": "Apparaten",
      "devicesRated": "beoordeelde apparaten",
      "done": "Klaar",
      "dontKnow": "Weet ik niet",
      "dontKnowHint":
          " {count} antwoord{suffix} is gemarkeerd als \"Weet ik niet\" - neem de tijd om de instellingen van je apparaten beter te leren kennen.",
      "evaluatedDevices": "Beoordeelde apparaten",
      "exportFailed": "Export mislukt",
      "faq": "FAQ",
      "faqAnswerCanShare":
          "Ja. In het resultatenscherm kun je je samenvatting exporteren en delen als tekst of PDF.",
      "faqAnswerDataStored":
          "Je beoordelingsgegevens worden lokaal op je apparaat opgeslagen. In het Over-scherm kun je alle opgeslagen gegevens op elk moment verwijderen.",
      "faqAnswerHowWorks":
          "Je kiest een kamer, voegt je slimme apparaten toe, beantwoordt apparaatspecifieke vragen en ontvangt een risicoprofiel met geprioriteerde acties.",
      "faqAnswerLegalAdvice":
          "Nee. Simplications biedt praktische oriëntatie en aanbevelingen, maar vervangt geen juridisch advies of professionele beveiligingsconsultatie.",
      "faqAnswerNoDevice":
          "Je kunt aangepaste apparaten toevoegen en de check toch voltooien. De aanbevelingen zijn dan gebaseerd op je configuratie en antwoorden.",
      "faqAnswerNoPolicy": "Omdat we jouw gegevens niet verzamelen.",
      "faqAnswerRiskMeaning":
          "Deze niveaus geven aan in hoeverre je huidige configuratie privacyrisico’s kan vergroten. Het zijn richtniveaus, geen juridische of technische certificering.",
      "faqAnswerWhatIs":
          "Simplications is een onderzoeksproject over smart-home-privacy. Deze app is een onderdeel van het project en begeleidt je kamer voor kamer door je apparaten met praktische aanbevelingen op basis van je antwoorden.",
      "faqQuestionCanShare": "Kan ik mijn resultaten delen?",
      "faqQuestionDataStored": "Waar worden mijn gegevens opgeslagen?",
      "faqQuestionHowWorks": "Hoe werkt de check?",
      "faqQuestionLegalAdvice": "Is dit juridisch advies?",
      "faqQuestionNoDevice": "Wat als mijn apparaat niet in de lijst staat?",
      "faqQuestionNoPolicy": "Waarom is er geen privacybeleid?",
      "faqQuestionRiskMeaning": "Wat betekenen laag, gemiddeld en hoog risico?",
      "faqQuestionWhatIs": "Wat is Simplications?",
      "faqScreenTitle": "Veelgestelde vragen",
      "fullCatalog": "Volledige actiecatalogus",
      "fundingAgency": "Financierende instantie",
      "fundingAgencyValue":
          "Duits Federaal Ministerie voor Onderzoek, Technologie en Ruimtevaart\nSubsidie 16KIS1868K",
      "generalRecommendations": "Algemene aanbevelingen",
      "generalRecommendationsHint":
          "Deze maatregelen gelden voor je hele smart home, ongeacht afzonderlijke apparaten.",
      "hasCamera": "Heeft camera?",
      "hasMicrophone": "Heeft microfoon?",
      "highRisk": "Hoog risico",
      "howRiskCalculated": "Hoe wordt risico berekend?",
      "languageDialogTitle": "Taal kiezen",
      "lowRisk": "Laag risico",
      "mediumRisk": "Gemiddeld risico",
      "microphone": "Microfoon",
      "nextRoom": "Volgende kamer",
      "no": "Nee",
      "noActionHigh":
          "Er kunnen momenteel geen concrete acties uit je antwoorden worden afgeleid, maar er blijft een hoog restrisico.",
      "noActionLow": "Alles is in orde - geen acties vereist.",
      "noActionMedium":
          "Er kunnen momenteel geen concrete acties uit je antwoorden worden afgeleid, maar er blijft een gemiddeld restrisico.",
      "noDevice": "Geen apparaat",
      "noDeviceDialogBody":
          "Deze kamer wordt zonder apparaten afgerond en telt niet mee in de score.",
      "noDeviceDialogBodyWithExisting":
          "Bestaande apparaatkeuzes voor deze kamer worden verwijderd. Deze kamer wordt zonder apparaten afgerond en telt niet mee in de score.",
      "noDeviceDialogTitle": "Geen apparaten in deze kamer?",
      "noDevicesCaptured": "Geen apparaten vastgelegd.",
      "noDevicesHint":
          "Start opnieuw en voeg apparaten toe om een beoordeling te krijgen.",
      "noKnownDevices":
          "Geen bekende apparaten voor deze kamer. U kunt een eigen apparaat toevoegen.",
      "notApplicableForDevice":
          "Deze vraag is niet van toepassing op mijn apparaat",
      "notCompleted": "Niet voltooid",
      "note": "Opmerking",
      "optional": "Optioneel",
      "overallHigh":
          "Meerdere apparaten hebben aanzienlijke privacy-/gegevensbeschermingsrisico’s. Voer maatregelen met hoge prioriteit zo snel mogelijk uit.",
      "overallLow":
          "Goed gedaan! Je apparaten zijn grotendeels veilig geconfigureerd. Bekijk alsnog de algemene aanbevelingen.",
      "overallMedium":
          "Er is ruimte voor verbetering. Bekijk de aanbevelingen per apparaat.",
      "overallRisk": "Totaal risico",
      "overview": "Overzicht",
      "platformPrivacy": "Plattform Privatheit",
      "projectPartners": "Projectpartners",
      "questionnaireTitle": "Vragen",
      "recommendations": "Aanbevelingen",
      "recommended": "Aanbevolen",
      "reportExportedAt": "Geëxporteerd op",
      "restart": "Opnieuw starten",
      "results": "Resultaten",
      "resume": "Doorgaan",
      "risk": "Risico",
      "roomCheck": "Kamercheck",
      "roomDeleteBody":
          "Deze aangepaste kamer wordt verwijderd. Alle gekoppelde apparaten worden ook verwijderd.",
      "roomDeleteTitle": "Kamer verwijderen?",
      "roomInstruction":
          "Tik op een kamer, leg daar uw apparaten vast en keer terug om de volgende kamer te kiezen.",
      "roomName": "Kamernaam",
      "roomNameHint": "bijv. Woonkamer, Garage",
      "roomQuestion": "Welke kamer wilt u nu controleren?",
      "roomSelectionTitle": "Kamer kiezen",
      "security": "Beveiliging",
      "shareAsPdf": "Delen als PDF",
      "shareAsText": "Delen als tekst",
      "shareResult": "Resultaat delen",
      "skippedDevicesHint":
          "{count} apparaten overgeslagen omdat de vragenlijst niet is voltooid.",
      "smartHomePrivacyHeader": "Jouw smart-home-privacy",
      "social": "Sociaal",
      "start": "Starten",
      "stepAnswerQuestions": "Vragen beantwoorden",
      "stepCaptureDevices": "Apparaten vastleggen",
      "stepGetRisk": "Risicoprofiel en aanbevelingen ontvangen",
      "stepSelectRooms": "Kamer kiezen",
      "summarySharePdfText": "Simplications-rapport als PDF",
      "summaryShareSubject": "Simplications-resultaat",
      "summaryTitle": "Jouw resultaat",
      "technical": "Technisch",
      "totalScore": "Totaal",
      "urgent": "Urgent",
      "website": "Website",
      "websiteOpenFailed": "Kon website niet openen.",
      "welcomeDescription":
          "Leg je slimme apparaten kamer voor kamer vast en ontvang een privacybeoordeling met concrete aanbevelingen.",
      "welcomeTitle": "Simplications\nSmart Home\nprivacycheck",
      "yes": "Ja",
    },
    'pl': <String, String>{
      "about": "O aplikacji",
      "aboutPartnerHsAnhalt": "Anhalt University of Applied Sciences",
      "aboutPartnerTuChemnitz": "Uniwersytet Techniczny w Chemnitz",
      "aboutPartnerVzSachsen": "Centrum Konsumenckie Saksonii",
      "aboutProjectName": "Simplications",
      "aboutScreenTitle": "O aplikacji",
      "aboutSubtitle": "Projekt badawczy dotyczący prywatności smart home",
      "aboutWebsiteFundingAgencyLabel": "bmftr.bund.de",
      "aboutWebsiteFundingAgencyUrl": "https://www.bmftr.bund.de",
      "aboutWebsiteHsAnhaltLabel": "hs-anhalt.de",
      "aboutWebsiteHsAnhaltUrl": "https://www.hs-anhalt.de",
      "aboutWebsitePlatformPrivacyLabel": "plattform-privatheit.de",
      "aboutWebsitePlatformPrivacyUrl": "https://www.plattform-privatheit.de",
      "aboutWebsiteSimplicationsLabel": "simplications.tucmi.de",
      "aboutWebsiteSimplicationsUrl": "https://simplications.tucmi.de",
      "aboutWebsiteTuChemnitzLabel": "tu-chemnitz.de",
      "aboutWebsiteTuChemnitzUrl": "https://www.tu-chemnitz.de",
      "aboutWebsiteVzSachsenLabel": "verbraucherzentrale-sachsen.de",
      "aboutWebsiteVzSachsenUrl": "https://www.verbraucherzentrale-sachsen.de",
      "add": "Dodaj",
      "addDevice": "Dodaj\nurządzenie",
      "addDeviceDialogTitle": "Dodaj nowe urządzenie",
      "addRoom": "Dodaj pokój",
      "addRoomDialogTitle": "Dodaj nowy pokój",
      "allDataDeleted": "Wszystkie zapisane dane zostały usunięte.",
      "alreadyEvaluated": "Już oceniono",
      "appTitle": "Simplications",
      "baseRiskHint": "np. 30 (niskie) do 60 (wysokie)",
      "baseRiskLabel": "Bazowy wynik ryzyka (0-100)",
      "camera": "Kamera",
      "cancel": "Anuluj",
      "catalogButton": "Otwórz pełny katalog działań",
      "catalogSnackBarPrefix": "Katalog",
      "chooseIcon": "Wybierz ikonę:",
      "confirm": "Potwierdź",
      "connectedDevice": "Podłączone urządzenie",
      "coordination": "Koordynacja",
      "coordinationFunding": "Koordynacja i finansowanie",
      "currentLanguage": "Bieżący język",
      "dangerZone": "Strefa zagrożenia",
      "dangerZoneWarning":
          "Uwaga: Ta operacja trwale usunie wszystkie zapisane dane aplikacji.",
      "delete": "Usuń",
      "deleteAllDataBody":
          "Wszystkie zapisane pokoje, urządzenia i odpowiedzi zostaną trwale usunięte. Tej operacji nie można cofnąć.",
      "deleteAllDataButton": "Usuń dane",
      "deleteAllDataTitle": "Usunąć wszystkie dane?",
      "deleteDeviceBody":
          "To niestandardowe urządzenie zostanie usunięte. Wszystkie powiązane instancje również zostaną usunięte.",
      "deleteDeviceTitle": "Usunąć urządzenie?",
      "deviceName": "Nazwa urządzenia",
      "deviceNameHint": "np. Mój inteligentny głośnik",
      "deviceQuestion": "Jakich inteligentnych urządzeń używasz w tym pokoju?",
      "deviceQuestionHint": "Stuknij urządzenie, aby odpowiedzieć na pytania.",
      "deviceTitlePrefix": "Urządzenia",
      "devicesRated": "ocenionych urządzeń",
      "done": "Gotowe",
      "dontKnow": "Nie wiem",
      "dontKnowHint":
          " {count} odpowiedź{suffix} oznaczono jako \"Nie wiem\" - poświęć czas na lepsze poznanie ustawień swoich urządzeń.",
      "evaluatedDevices": "Ocenione urządzenia",
      "exportFailed": "Eksport nie powiódł się",
      "faq": "FAQ",
      "faqAnswerCanShare":
          "Tak. Na ekranie wyników możesz wyeksportować i udostępnić podsumowanie jako tekst lub PDF.",
      "faqAnswerDataStored":
          "Twoje dane z oceny są przechowywane lokalnie na urządzeniu. W ekranie O aplikacji możesz w każdej chwili usunąć wszystkie zapisane dane.",
      "faqAnswerHowWorks":
          "Wybierasz pokój, dodajesz inteligentne urządzenia, odpowiadasz na pytania dotyczące danego urządzenia i otrzymujesz profil ryzyka z priorytetowymi działaniami.",
      "faqAnswerLegalAdvice":
          "Nie. Simplications zapewnia praktyczne wskazówki i rekomendacje, ale nie zastępuje porady prawnej ani profesjonalnej konsultacji bezpieczeństwa.",
      "faqAnswerNoDevice":
          "Możesz dodać własne urządzenia i nadal ukończyć kontrolę. Zalecenia będą wtedy oparte na Twojej konfiguracji i odpowiedziach.",
      "faqAnswerNoPolicy": "Ponieważ nie zbieramy Twoich danych.",
      "faqAnswerRiskMeaning":
          "Poziomy te pokazują, jak bardzo obecna konfiguracja może zwiększać ryzyka dla prywatności. Są to poziomy orientacyjne, a nie certyfikacja prawna lub techniczna.",
      "faqAnswerWhatIs":
          "Simplications to projekt badawczy dotyczący prywatności w inteligentnym domu. Ta aplikacja jest jedną z części projektu i prowadzi Cię pokój po pokoju przez Twoje urządzenia, oferując praktyczne zalecenia na podstawie odpowiedzi.",
      "faqQuestionCanShare": "Czy mogę udostępnić wyniki?",
      "faqQuestionDataStored": "Gdzie przechowywane są moje dane?",
      "faqQuestionHowWorks": "Jak działa kontrola?",
      "faqQuestionLegalAdvice": "Czy to porada prawna?",
      "faqQuestionNoDevice": "Co jeśli mojego urządzenia nie ma na liście?",
      "faqQuestionNoPolicy": "Dlaczego nie ma polityki prywatności?",
      "faqQuestionRiskMeaning": "Co oznacza niskie, średnie i wysokie ryzyko?",
      "faqQuestionWhatIs": "Czym jest Simplications?",
      "faqScreenTitle": "Najczęściej zadawane pytania",
      "fullCatalog": "Pełny katalog działań",
      "fundingAgency": "Instytucja finansująca",
      "fundingAgencyValue":
          "Federalne Ministerstwo Badań, Technologii i Przestrzeni Kosmicznej\nGrant 16KIS1868K",
      "generalRecommendations": "Ogólne zalecenia",
      "generalRecommendationsHint":
          "Te środki dotyczą całego Twojego smart home, niezależnie od pojedynczych urządzeń.",
      "hasCamera": "Ma kamerę?",
      "hasMicrophone": "Ma mikrofon?",
      "highRisk": "Wysokie ryzyko",
      "howRiskCalculated": "Jak obliczane jest ryzyko?",
      "languageDialogTitle": "Wybierz język",
      "lowRisk": "Niskie ryzyko",
      "mediumRisk": "Średnie ryzyko",
      "microphone": "Mikrofon",
      "nextRoom": "Następny pokój",
      "no": "Nie",
      "noActionHigh":
          "Na podstawie Twoich odpowiedzi nie można obecnie wskazać konkretnych działań, ale pozostaje wysokie ryzyko resztkowe.",
      "noActionLow": "Wszystko w porządku - nie są wymagane żadne działania.",
      "noActionMedium":
          "Na podstawie Twoich odpowiedzi nie można obecnie wskazać konkretnych działań, ale pozostaje średnie ryzyko resztkowe.",
      "noDevice": "Brak urządzenia",
      "noDeviceDialogBody":
          "Ten pokój zostanie zakończony bez urządzeń i nie wpłynie na ocenę.",
      "noDeviceDialogBodyWithExisting":
          "Istniejące wybory urządzeń dla tego pokoju zostaną odrzucone. Ten pokój zostanie zakończony bez urządzeń i nie wpłynie na ocenę.",
      "noDeviceDialogTitle": "Brak urządzeń w tym pokoju?",
      "noDevicesCaptured": "Nie dodano żadnych urządzeń.",
      "noDevicesHint":
          "Uruchom ponownie i dodaj urządzenia, aby otrzymać ocenę.",
      "noKnownDevices":
          "Brak znanych urządzeń dla tego pokoju. Możesz dodać własne urządzenie.",
      "notApplicableForDevice": "To pytanie nie dotyczy mojego urządzenia",
      "notCompleted": "Nieukończone",
      "note": "Uwaga",
      "optional": "Opcjonalne",
      "overallHigh":
          "Kilka urządzeń ma istotne ryzyka prywatności/ochrony danych. Prosimy jak najszybciej wdrożyć działania o wysokim priorytecie.",
      "overallLow":
          "Dobra robota! Twoje urządzenia są w większości skonfigurowane bezpiecznie. Mimo to sprawdź ogólne zalecenia.",
      "overallMedium":
          "Jest miejsce na poprawę. Sprawdź zalecenia dla każdego urządzenia.",
      "overallRisk": "Ryzyko całkowite",
      "overview": "Przegląd",
      "platformPrivacy": "Plattform Privatheit",
      "projectPartners": "Partnerzy projektu",
      "questionnaireTitle": "Pytania",
      "recommendations": "Zalecenia",
      "recommended": "Zalecane",
      "reportExportedAt": "Wyeksportowano",
      "restart": "Uruchom ponownie",
      "results": "Wyniki",
      "resume": "Wznów",
      "risk": "Ryzyko",
      "roomCheck": "Przegląd pokoju",
      "roomDeleteBody":
          "Ten niestandardowy pokój zostanie usunięty. Wszystkie powiązane urządzenia również zostaną usunięte.",
      "roomDeleteTitle": "Usunąć pokój?",
      "roomInstruction":
          "Stuknij pokój, dodaj urządzenia, a potem wróć tutaj, aby wybrać kolejny pokój.",
      "roomName": "Nazwa pokoju",
      "roomNameHint": "np. Salon, Garaż",
      "roomQuestion": "Który pokój chcesz teraz sprawdzić?",
      "roomSelectionTitle": "Wybierz pokój",
      "security": "Bezpieczeństwo",
      "shareAsPdf": "Udostępnij jako PDF",
      "shareAsText": "Udostępnij jako tekst",
      "shareResult": "Udostępnij wynik",
      "skippedDevicesHint":
          "Pominięto {count} urządzeń, ponieważ kwestionariusz nie został ukończony.",
      "smartHomePrivacyHeader": "Prywatność Twojego smart home",
      "social": "Społeczne",
      "start": "Start",
      "stepAnswerQuestions": "Odpowiedz na pytania",
      "stepCaptureDevices": "Dodaj urządzenia",
      "stepGetRisk": "Uzyskaj profil ryzyka i zalecenia",
      "stepSelectRooms": "Wybierz pokój",
      "summarySharePdfText": "Raport Simplications jako PDF",
      "summaryShareSubject": "Wynik Simplications",
      "summaryTitle": "Twój wynik",
      "technical": "Techniczne",
      "totalScore": "Łącznie",
      "urgent": "Pilne",
      "website": "Strona internetowa",
      "websiteOpenFailed": "Nie można otworzyć strony internetowej.",
      "welcomeDescription":
          "Dodaj swoje inteligentne urządzenia pokój po pokoju i otrzymaj ocenę prywatności z konkretnymi zaleceniami.",
      "welcomeTitle": "Simplications\nKontrola prywatności\nSmart Home",
      "yes": "Tak",
    },
  };

  static Map<String, Map<String, String>> get _completedValuesByLocale {
    final enMap = valuesByLocale['en'] ?? const <String, String>{};
    final completed = <String, Map<String, String>>{};

    for (final entry in valuesByLocale.entries) {
      completed[entry.key] = <String, String>{...enMap, ...entry.value};
    }

    completed.putIfAbsent('en', () => Map<String, String>.from(enMap));
    completed.putIfAbsent(
      'de',
      () => Map<String, String>.from(valuesByLocale['de'] ?? enMap),
    );

    return completed;
  }

  static String translate(
    String key, {
    String? fallback,
    Locale? locale,
    Map<String, String>? params,
  }) {
    final completedValues = _completedValuesByLocale;
    final languageCode = (locale ?? _activeLocale).languageCode;
    final langMap = completedValues[languageCode];
    final enMap = completedValues['en'];
    final deMap = completedValues['de'];
    var value = langMap?[key] ?? enMap?[key] ?? deMap?[key] ?? fallback ?? key;
    if (params != null && params.isNotEmpty) {
      for (final entry in params.entries) {
        value = value.replaceAll('{${entry.key}}', entry.value);
      }
    }
    return value;
  }

  static Map<String, Set<String>> localizationKeysByLocale() {
    final completedValues = _completedValuesByLocale;
    return {
      for (final entry in completedValues.entries)
        entry.key: Set<String>.from(entry.value.keys),
    };
  }
}
