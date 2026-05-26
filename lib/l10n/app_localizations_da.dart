// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get appTitle => 'Simplications';

  @override
  String get welcomeTitle => 'Simplications\nSmart Home\nprivatlivstjek';

  @override
  String get welcomeDescription =>
      'Registrer dine smarte enheder rum for rum, og få en privatlivsvurdering med konkrete anbefalinger.';

  @override
  String get stepSelectRooms => 'Vælg ét rum';

  @override
  String get stepCaptureDevices => 'Registrer enheder';

  @override
  String get stepAnswerQuestions => 'Besvar spørgsmål';

  @override
  String get stepGetRisk => 'Få risikoprofil og anbefalinger';

  @override
  String get start => 'Start';

  @override
  String get resume => 'Fortsæt';

  @override
  String get about => 'Om';

  @override
  String get faq => 'FAQ';

  @override
  String get roomSelectionTitle => 'Vælg rum';

  @override
  String get roomQuestion => 'Hvilket rum vil du tjekke nu?';

  @override
  String get roomInstruction =>
      'Tryk på et rum, registrer enhederne dér, og kom tilbage hertil for at vælge næste rum.';

  @override
  String get results => 'Resultater';

  @override
  String get alreadyEvaluated => 'Allerede vurderet';

  @override
  String get notCompleted => 'Ikke afsluttet';

  @override
  String get addRoom => 'Tilføj rum';

  @override
  String get deviceTitlePrefix => 'Enheder';

  @override
  String get roomCheck => 'Rumtjek';

  @override
  String get deviceQuestion => 'Hvilke smarte enheder bruger du i dette rum?';

  @override
  String get deviceQuestionHint =>
      'Tryk på en enhed for at besvare spørgsmålene.';

  @override
  String get noKnownDevices =>
      'Ingen kendte enheder for dette rum. Du kan tilføje din egen enhed.';

  @override
  String get addDevice => 'Tilføj\nenhed';

  @override
  String get noDevice => 'Ingen enhed';

  @override
  String get nextRoom => 'Næste rum';

  @override
  String get deleteDeviceTitle => 'Slet enhed?';

  @override
  String get deleteDeviceBody =>
      'Denne brugerdefinerede enhed slettes. Alle tilknyttede instanser fjernes også.';

  @override
  String get delete => 'Slet';

  @override
  String get cancel => 'Annuller';

  @override
  String get confirm => 'Bekræft';

  @override
  String get noDeviceDialogTitle => 'Ingen enheder i dette rum?';

  @override
  String get noDeviceDialogBody =>
      'Dette rum afsluttes uden enheder og påvirker ikke scoren.';

  @override
  String get noDeviceDialogBodyWithExisting =>
      'Eksisterende enhedsvalg for dette rum kasseres. Dette rum afsluttes uden enheder og påvirker ikke scoren.';

  @override
  String get questionnaireTitle => 'Spørgsmål';

  @override
  String get connectedDevice => 'Tilsluttet enhed';

  @override
  String get done => 'Færdig';

  @override
  String get yes => 'Ja';

  @override
  String get no => 'Nej';

  @override
  String get dontKnow => 'Ved ikke';

  @override
  String get notApplicableForDevice =>
      'Dette spørgsmål gælder ikke for min enhed';

  @override
  String get languageDialogTitle => 'Vælg sprog';

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
  String get currentLanguage => 'Nuværende sprog';

  @override
  String get aboutScreenTitle => 'Om appen';

  @override
  String get faqScreenTitle => 'Ofte stillede spørgsmål';

  @override
  String get aboutSubtitle => 'Forskningsprojekt om privatliv i smarte hjem';

  @override
  String get aboutProjectName => 'Simplications';

  @override
  String get aboutPartnerTuChemnitz => 'Teknisk Universitet i Chemnitz';

  @override
  String get aboutPartnerHsAnhalt => 'Anhalt University of Applied Sciences';

  @override
  String get aboutPartnerVzSachsen => 'Forbrugercenter Sachsen';

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
  String get faqQuestionWhatIs => 'Hvad er Simplications?';

  @override
  String get faqAnswerWhatIs =>
      'Simplications er et forskningsprojekt om privatliv i smarte hjem. Denne app er en del af projektet og guider dig rum for rum gennem dine enheder med praktiske anbefalinger baseret på dine svar.';

  @override
  String get faqQuestionHowWorks => 'Hvordan fungerer tjekket?';

  @override
  String get faqAnswerHowWorks =>
      'Du vælger et rum, tilføjer dine smarte enheder, besvarer enhedsspecifikke spørgsmål og får en risikoprofil med prioriterede handlinger.';

  @override
  String get faqQuestionNoPolicy => 'Hvorfor er der ingen privatlivspolitik?';

  @override
  String get faqAnswerNoPolicy => 'Fordi vi ikke indsamler dine data.';

  @override
  String get faqQuestionDataStored => 'Hvor gemmes mine data?';

  @override
  String get faqAnswerDataStored =>
      'Dine vurderingsdata gemmes lokalt på din enhed. På Om-skærmen kan du til enhver tid slette alle gemte data.';

  @override
  String get faqQuestionNoDevice => 'Hvad hvis min enhed ikke er på listen?';

  @override
  String get faqAnswerNoDevice =>
      'Du kan tilføje brugerdefinerede enheder og stadig gennemføre tjekket. Anbefalingerne bygger så på din opsætning og dine svar.';

  @override
  String get faqQuestionRiskMeaning =>
      'Hvad betyder lav, mellem og høj risiko?';

  @override
  String get faqAnswerRiskMeaning =>
      'Disse niveauer viser, hvor meget din nuværende konfiguration kan øge privatlivsrisici. De er vejledende niveauer, ikke juridisk eller teknisk certificering.';

  @override
  String get faqQuestionLegalAdvice => 'Er dette juridisk rådgivning?';

  @override
  String get faqAnswerLegalAdvice =>
      'Nej. Simplications giver praktisk vejledning og anbefalinger, men erstatter ikke juridisk rådgivning eller professionel sikkerhedsrådgivning.';

  @override
  String get faqQuestionCanShare => 'Kan jeg dele mine resultater?';

  @override
  String get faqAnswerCanShare =>
      'Ja. På resultatskærmen kan du eksportere og dele din opsummering som tekst eller PDF.';

  @override
  String get websiteOpenFailed => 'Kunne ikke åbne webstedet.';

  @override
  String get deleteAllDataTitle => 'Slet alle data?';

  @override
  String get deleteAllDataBody =>
      'Alle registrerede rum, enheder og svar slettes permanent. Handlingen kan ikke fortrydes.';

  @override
  String get deleteAllDataButton => 'Slet data';

  @override
  String get allDataDeleted => 'Alle gemte data er blevet slettet.';

  @override
  String get projectPartners => 'Projektpartnere';

  @override
  String get coordinationFunding => 'Koordination og finansiering';

  @override
  String get coordination => 'Koordination';

  @override
  String get platformPrivacy => 'Plattform Privatheit';

  @override
  String get fundingAgency => 'Finansieringsorgan';

  @override
  String get fundingAgencyValue =>
      'Tysk forbundsministerium for forskning, teknologi og rumfart\nBevilling 16KIS1868K';

  @override
  String get website => 'Websted';

  @override
  String get dangerZone => 'Farezone';

  @override
  String get dangerZoneWarning =>
      'Advarsel: Denne handling fjerner alle gemte app-data permanent.';

  @override
  String get expertModeTitle => 'Eksperttilstand';

  @override
  String get expertModeToggleLabel => 'Aktivér detaljeret eksperttilstand';

  @override
  String get expertModeToggleHint =>
      'Samme arbejdsgang, men langt mere detaljerede spørgsmål om enhederne (f.eks. opbevaringsperiode, adgangskontrol og deling med tredjeparter).';

  @override
  String get expertModeSourcesHint =>
      'Metodisk inspireret af følgende forskningsprojekter:';

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
      'Eksperttilstand: disse spørgsmål går mere i dybden med datapraksis og styring (herunder opbevaringsperiode, adgangskontrol og deling med tredjeparter) med udgangspunkt i CMU IoT Label- og Unboxing.IoT.Privacy-tilgange.';

  @override
  String get roomDeleteTitle => 'Slet rum?';

  @override
  String get roomDeleteBody =>
      'Dette brugerdefinerede rum bliver slettet. Alle tilknyttede enheder bliver også fjernet.';

  @override
  String get add => 'Tilføj';

  @override
  String get addRoomDialogTitle => 'Tilføj nyt rum';

  @override
  String get roomName => 'Rumnavn';

  @override
  String get roomNameHint => 'f.eks. Stue, Garage';

  @override
  String get chooseIcon => 'Vælg ikon:';

  @override
  String get addDeviceDialogTitle => 'Tilføj ny enhed';

  @override
  String get deviceName => 'Enhedsnavn';

  @override
  String get deviceNameHint => 'f.eks. Min smarte højttaler';

  @override
  String get baseRiskLabel => 'Basisrisikoscore (0-100)';

  @override
  String get baseRiskHint => 'f.eks. 30 (lav) til 60 (høj)';

  @override
  String get hasCamera => 'Har kamera?';

  @override
  String get hasMicrophone => 'Har mikrofon?';

  @override
  String get camera => 'Kamera';

  @override
  String get microphone => 'Mikrofon';

  @override
  String get summaryTitle => 'Dit resultat';

  @override
  String get shareResult => 'Del resultat';

  @override
  String get shareAsText => 'Del som tekst';

  @override
  String get shareAsPdf => 'Del som PDF';

  @override
  String get restart => 'Start forfra';

  @override
  String get noDevicesCaptured => 'Ingen enheder registreret.';

  @override
  String get noDevicesHint =>
      'Start forfra og tilføj enheder for at få en vurdering.';

  @override
  String get highRisk => 'Høj risiko';

  @override
  String get mediumRisk => 'Middel risiko';

  @override
  String get lowRisk => 'Lav risiko';

  @override
  String get exportFailed => 'Eksport mislykkedes';

  @override
  String get summaryShareSubject => 'Simplications-resultat';

  @override
  String get summarySharePdfText => 'Simplications-rapport som PDF';

  @override
  String get summaryPdfFileName => 'simplications-resultat.pdf';

  @override
  String get overview => 'Oversigt';

  @override
  String get evaluatedDevices => 'Vurderede enheder';

  @override
  String skippedDevicesHint(Object count) {
    return '$count enheder er sprunget over, fordi spørgeskemaet ikke er afsluttet.';
  }

  @override
  String get overallRisk => 'Samlet risiko';

  @override
  String get generalRecommendations => 'Generelle anbefalinger';

  @override
  String get generalRecommendationsHint =>
      'Disse tiltag gælder for hele dit smarte hjem uanset individuelle enheder.';

  @override
  String get fullCatalog => 'Fuldt handlingskatalog';

  @override
  String get catalogButton => 'Åbn fuldt handlingskatalog';

  @override
  String get risk => 'Risiko';

  @override
  String get note => 'Bemærkning';

  @override
  String get recommendations => 'Anbefalinger';

  @override
  String get urgent => 'Haster';

  @override
  String get recommended => 'Anbefalet';

  @override
  String get optional => 'Valgfri';

  @override
  String get social => 'Social';

  @override
  String get technical => 'Teknisk';

  @override
  String get security => 'Sikkerhed';

  @override
  String get smartHomePrivacyHeader => 'Dit smart-home-privatliv';

  @override
  String get devicesRated => 'vurderede enheder';

  @override
  String get howRiskCalculated => 'Hvordan beregnes risiko?';

  @override
  String get totalScore => 'I alt';

  @override
  String get catalogSnackBarPrefix => 'Katalog';

  @override
  String get reportExportedAt => 'Eksporteret den';

  @override
  String get noActionLow => 'Alt er i orden - ingen handlinger nødvendige.';

  @override
  String get noActionMedium =>
      'Der kan i øjeblikket ikke udledes konkrete handlinger fra dine svar, men der er fortsat en middel rest-risiko.';

  @override
  String get noActionHigh =>
      'Der kan i øjeblikket ikke udledes konkrete handlinger fra dine svar, men der er fortsat en høj rest-risiko.';

  @override
  String get overallLow =>
      'Godt klaret! Dine enheder er overvejende sikkert konfigureret. Gennemgå alligevel de generelle anbefalinger.';

  @override
  String get overallMedium =>
      'Der er plads til forbedringer. Gennemgå anbefalingerne for hver enhed.';

  @override
  String get overallHigh =>
      'Flere enheder har betydelige privatlivs-/databeskyttelsesrisici. Implementér venligst højprioriterede tiltag hurtigt.';

  @override
  String dontKnowHint(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count svar er markeret som \"Ved ikke\" - brug tid på at lære dine enhedsindstillinger bedre at kende.',
      one:
          '1 svar er markeret som \"Ved ikke\" - brug tid på at lære dine enhedsindstillinger bedre at kende.',
    );
    return ' $_temp0';
  }

  @override
  String get room_living => 'Stue';

  @override
  String get room_kitchen => 'Køkken';

  @override
  String get room_bedroom => 'Soveværelse';

  @override
  String get room_child_bedroom => 'Barns soveværelse';

  @override
  String get room_bathroom => 'Badeværelse';

  @override
  String get room_office => 'Kontor';

  @override
  String get room_hallway => 'Entré / Indgang';

  @override
  String get room_garden => 'Have / Udendørsområde';

  @override
  String get room_basement => 'Kælder / Proviantkammer';

  @override
  String get room_whole_home => 'Hele hjemmet';

  @override
  String get device_simple_sensor =>
      'Sensor (f.eks. dør, bevægelse, temperatur, fugt eller lys sensor)';

  @override
  String get device_humidity_sensor => 'Fugtsensor';

  @override
  String get device_temperature_sensor => 'Temperatursensor';

  @override
  String get device_light_sensor => 'Lyssensor';

  @override
  String get device_smart_speaker => 'Smart højtaler / stemmeassistent';

  @override
  String get device_smart_display => 'Smart display (f.eks. Nest Hub)';

  @override
  String get device_smart_tv => 'Smart-TV';

  @override
  String get device_indoor_camera => 'Smart indendørs kamera';

  @override
  String get device_outdoor_camera => 'Smart udendørs kamera';

  @override
  String get device_doorbell_camera => 'Smart ringeklokke med kamera';

  @override
  String get device_baby_monitor => 'Baby monitor / baby kamera';

  @override
  String get device_robot_vacuum => 'Robotstøvsuger';

  @override
  String get device_smart_fridge => 'Smart køleskab';

  @override
  String get device_smart_oven => 'Smart ovn / kogeplader';

  @override
  String get device_smart_coffee => 'Smart kaffemaskine';

  @override
  String get device_smart_washing => 'Smart vaskemaskine / tørretumbler';

  @override
  String get device_smart_thermostat => 'Smart termostat / varmeregulering';

  @override
  String get device_smart_plug => 'Smart stik';

  @override
  String get device_smart_light => 'Smart belysning';

  @override
  String get device_smart_lock => 'Smart dørlås';

  @override
  String get device_smart_blind => 'Smart blind / persienne';

  @override
  String get device_fitness_tracker => 'Fitnesstracke / smartwatch';

  @override
  String get device_smart_toy => 'Smart legetøj';

  @override
  String get device_smart_router => 'Smart router / mesh system';

  @override
  String get device_smart_hub =>
      'Smart home hub (f.eks. Homey, Home Assistant)';

  @override
  String get device_smart_meter => 'Intelligent elmåler / smart meter';

  @override
  String get device_smart_irrigation => 'Smart irrigationssystem';

  @override
  String get device_smart_scale => 'Smart vægt';

  @override
  String get device_smart_printer => 'Smart printer';

  @override
  String get q_password_text =>
      'Har du ændret standardadgangskoden for enheden eller dens tilknyttede konto?';

  @override
  String get q_password_hint =>
      'Standardadgangskoder er ofte offentligt kendt og nemme at knække.';

  @override
  String get q_updates_text =>
      'Er automatiske sikkerhedsopdateringer aktiveret for enheden?';

  @override
  String get q_updates_hint =>
      'Opdateringer lukker kendte sikkerhedssårbarheder prompte.';

  @override
  String get q_network_text =>
      'Er enheden forbundet til et separat smart home eller IoT Wi-Fi-netværk?';

  @override
  String get q_network_hint =>
      'Et dedikeret netværk til smarte enheder beskytter dit hovedhjemmenetværk.';

  @override
  String get q_informed_text =>
      'Er alle personer i husstanden informeret om denne enhed og dens funktion?';

  @override
  String get q_informed_hint =>
      'Alle husholdsmedlemmer bør vide, hvilke data enheden indsamler.';

  @override
  String get q_permissions_text =>
      'Har du deaktiveret unødvendige app-tilladelser (f.eks. lokation, kontakter)?';

  @override
  String get q_permissions_hint =>
      'Kun tilladelser, der er virkelig nødvendige, bør være aktiverede.';

  @override
  String get q_mic_active_text =>
      'Deaktiverer du mikrofonen, når du ikke aktivt bruger den?';

  @override
  String get q_mic_active_hint =>
      'Smarte højttalere og enheder med mikrofon kan aktiveres utilsigtet.';

  @override
  String get q_camera_consent_text =>
      'Optager kameraet kun områder, som alle berørte personer har givet tilladelse til?';

  @override
  String get q_camera_consent_hint =>
      'Kameraer i fælles eller private områder kræver samtykke fra alle beboere.';

  @override
  String get q_sensor_frequency_text =>
      'Kan du reducere sensorens måleinterval (f.eks. måle mindre hyppigt)?';

  @override
  String get q_sensor_frequency_hint =>
      'En lavere målefrekvens producerer færre data og begrænser slutninger om din adfærd.';

  @override
  String get q_sensor_data_deletion_text =>
      'Slettes ældre målværdier automatisk eller på anmodning?';

  @override
  String get q_sensor_data_deletion_hint =>
      'Gamle historiske data bør ikke lagres permanent. Kontroller opbevaringsindstillinger.';

  @override
  String get q_sensor_granularity_text =>
      'Viser systemet sensordata kun i aggregeret form (f.eks. daglige værdier i stedet for minutværdier)?';

  @override
  String get q_sensor_granularity_hint =>
      'Mindre granulære visninger hjælper med at forhindre slutninger om præcis tilstedeværelse eller adfærdsmønstre.';

  @override
  String get q_sensor_local_text =>
      'Behandles og lagres måldata lokalt uden at blive overført til skyen?';

  @override
  String get q_sensor_local_hint =>
      'Lokal behandling forhindrer leverandøren i at få adgang til dine måldata.';

  @override
  String get q_voice_history_text =>
      'Kan du slette stemmeoptagelser fra enhedshistorik eller deaktivere denne funktion?';

  @override
  String get q_voice_history_hint =>
      'BSI anbefaling: Minimér optagelses-opbevaring eller slet optagelser regelmæssigt.';

  @override
  String get q_voice_local_text =>
      'Behandles stemmebehandling delvis på enheden lokalt?';

  @override
  String get q_voice_local_hint =>
      'Lokal behandling reducerer mængden af data sendt til skyen.';

  @override
  String get q_skills_permissions_text =>
      'Gennemgår du regelmæssigt, hvilke funktioner der har adgang til din konto?';

  @override
  String get q_skills_permissions_hint =>
      'Tredjepartsfunktioner kan få adgang til følsomme data. Aktivér kun nødvendige funktioner.';

  @override
  String get q_video_encryption_text =>
      'Er videooptagelse og transmission krypteret ende-til-ende?';

  @override
  String get q_video_encryption_hint =>
      'BSI anbefaling: Krypterede forbindelser forhindrer opsnapping og datatyveri under transport.';

  @override
  String get q_video_storage_text =>
      'Lagres optagelser lokalt (ikke kun i leverandørens sky)?';

  @override
  String get q_video_storage_hint =>
      'Lokal lagring giver dig mere kontrol over dine data; cloud-only lagring afhænger af leverandørens sikkerhed.';

  @override
  String get q_sharing_restrictions_text =>
      'Kan du kontrollere, hvem der kan få adgang til live view og optagelser?';

  @override
  String get q_sharing_restrictions_hint =>
      'Du bør kunne præcist kontrollere adgangen til videooptagelser.';

  @override
  String get q_motion_detection_text =>
      'Kan du deaktivere eller planlægge bevægelsesdetektering, når du er hjemme?';

  @override
  String get q_motion_detection_hint =>
      'BSI anbefaling: Undgåelse af unødvendige optagelser reducerer datamængde og misbrug-risiko.';

  @override
  String get q_account_required_text =>
      'Kan du bruge enheden uden en obligatorisk onlinekonto?';

  @override
  String get q_account_required_hint =>
      'Obligatoriske konti muliggør annonceringssporing og lagring af visningshistorik. Kontofri brug beskytter dit privatliv.';

  @override
  String get q_tracking_disabled_text =>
      'Kan du helt deaktivere annonce- og sporings-funktioner?';

  @override
  String get q_tracking_disabled_hint =>
      'Smarte TV\'er indsamler ofte visningshistorikdata. Søg efter privatlivs-indstillinger.';

  @override
  String get q_local_mode_text =>
      'Kan du bruge enheden via HDMI eller lokale kilder uden internet?';

  @override
  String get q_local_mode_hint =>
      'Offline-brug beskytter brugsdata fra at blive sendt til leverandøren.';

  @override
  String get q_data_collection_text =>
      'Bliver temperaturhistorik og tidsplaner på enheden (ikke sendt til leverandøren)?';

  @override
  String get q_data_collection_hint =>
      'Historik kan afsløre tilstedeværelsesmønstre og vaner. Lokal lagring reducerer uønsket analyse.';

  @override
  String get q_offline_control_text =>
      'Kan du betjene termostaten offline (uden internet)?';

  @override
  String get q_offline_control_hint =>
      'Offline drift eller lokal automatisering beskytter data fra skyadgang.';

  @override
  String get q_family_access_text =>
      'Kan du kontrollere, hvem der må justere opvarmningen (f.eks. begræns gæster)?';

  @override
  String get q_family_access_hint =>
      'Husholdsmedlemmer bør have kontrol uden, at besøgende kan ændre alt.';

  @override
  String get q_local_control_text =>
      'Kan automatiseringer køre lokalt uden internetforbindelse?';

  @override
  String get q_local_control_hint =>
      'Lokale scener og tidsplaner beskytter dit privatliv bedre.';

  @override
  String get q_usage_tracking_text =>
      'Har du deaktiveret eller begrænset leverandørens indsamling af skifte-mønstre og brugstider?';

  @override
  String get q_usage_tracking_hint =>
      'Brugsmønstre kan afsløre tilstedeværelse og vaner. Kontroller app-privatlivsindstillinger.';

  @override
  String get q_offline_fallback_text =>
      'Fungerer enheder stadig, hvis internet- eller app-forbindelse mislykkes?';

  @override
  String get q_offline_fallback_hint =>
      'Pålidelig lokal drift er vigtig for daglig brug og privatliv.';

  @override
  String get q_offline_unlock_text =>
      'Kan du låse låsen op offline (f.eks. med kode eller nøgle)?';

  @override
  String get q_offline_unlock_hint =>
      'Backup-muligheder forhindrer udelåsning under internet- eller strømafbrydelse.';

  @override
  String get q_access_logging_text =>
      'Kan du spore, hvem der åbnede låsen og hvornår?';

  @override
  String get q_access_logging_hint =>
      'En adgangslog hjælper dig med at opdage mistænkelig aktivitet.';

  @override
  String get q_two_factor_text =>
      'Er tovejs-autentifikation (2FA) tilgængelig for låsekontoen?';

  @override
  String get q_two_factor_hint =>
      'BSI anbefaling: 2FA beskytter din konto mod uautoriseret ekstern adgang.';

  @override
  String get q_map_privacy_text =>
      'Lagres oprettede etageplan udelukkende lokalt på enheden?';

  @override
  String get q_map_privacy_hint =>
      'Hjemmeetageplan er følsomme oplysninger og bør ikke sendes til leverandøren.';

  @override
  String get q_cloud_required_text =>
      'Fungerer etageplannavigation uden skyopforbindelse?';

  @override
  String get q_cloud_required_hint =>
      'Enheder med lokal navigation er mere privatlivsvennlige, fordi der ikke uploades rumsdata.';

  @override
  String get q_vision_data_text =>
      'Hvis robotten bruger kameraer: bruges kamerabilleder lokalt kun til navigation (ingen lagring eller overførsel)?';

  @override
  String get q_vision_data_hint =>
      'Kamerabilleder bør behandles lokalt til navigation og hverken lagres eller sendes til leverandøren.';

  @override
  String get q_parental_control_text =>
      'Er der foreldrekontrollfunktioner til at styre legetøjet?';

  @override
  String get q_parental_control_hint =>
      'Foreldrekontrol bør tillade begrænsning af kontakter og funktioner.';

  @override
  String get q_child_data_limits_text =>
      'Kan du begrænse, hvilke personlige data legetøjet indsamler?';

  @override
  String get q_child_data_limits_hint =>
      'Enhederne til børn bør indsamle og lagre minimale data.';

  @override
  String get q_recording_disable_text =>
      'Kan du deaktivere lyd- og videooptagelse på enheden?';

  @override
  String get q_recording_disable_hint =>
      'BSI anbefaling: Optagelser af børn bør kun være mulige med eksplicit kontrol.';

  @override
  String get q_health_sharing_text =>
      'Kan du kontrollere, hvilke tredjeparter der kan få adgang til dine sundhedsdata?';

  @override
  String get q_health_sharing_hint =>
      'Sundhedsdata er følsomme. Kun autoriserede apps bør have adgang.';

  @override
  String get q_location_tracking_text =>
      'Kan du deaktivere lokationssporing, når det ikke er nødvendigt?';

  @override
  String get q_location_tracking_hint =>
      'GPS-sporing bruger batteri og kan afsløre bevægelsesmønstre.';

  @override
  String get q_expert_data_retention_duration_text =>
      'Er opbevaringsperioden for dine personlige data eksplicit defineret og begrænset til det nødvendige?';

  @override
  String get q_expert_data_retention_duration_hint =>
      'Inspireret af CMU IoT Security & Privacy Label og Unboxing.IoT.Privacy: korte, klare opbevaringsperioder reducerer risiko.';

  @override
  String get q_expert_access_control_granular_text =>
      'Kan du kontrollere adgangsrettigheder granulært (roller, separate konti, ingen delte standardlogins)?';

  @override
  String get q_expert_access_control_granular_hint =>
      'Granular adgangskontrol reducerer risikoen for uautoriseret adgang og misbrug.';

  @override
  String get q_expert_third_party_sharing_limited_text =>
      'Er tredjepartsdeling deaktiveret eller klart begrænset til nødvendige tjenester?';

  @override
  String get q_expert_third_party_sharing_limited_hint =>
      'Kontroller privacy- og kontoindstillinger for at se, om data sendes til annoncering, analyse eller partnerservice.';

  @override
  String get q_expert_data_sale_disabled_text =>
      'Er salget af dine data udelukket (eller aktivt deaktiveret, hvor det er muligt)?';

  @override
  String get q_expert_data_sale_disabled_hint =>
      'En eksplicit \"no data sale\"-mulighed er et stærkt privatlivssignal.';

  @override
  String get q_expert_update_support_window_text =>
      'Er det kendt, hvor længe leverandøren garanterer sikkerhedsopdateringer?';

  @override
  String get q_expert_update_support_window_hint =>
      'En transparent opdateringsforpligtelse reducerer langsigtet sikkerhed og privatlivsrisiko.';

  @override
  String get q_expert_vulnerability_process_text =>
      'Er der en dokumenteret proces for rapportering og rettelse af sårbarheder?';

  @override
  String get q_expert_vulnerability_process_hint =>
      'Foretrækker leverandører, der tilbyder ansvarlig offentliggørelses-policy eller klare sikkerhedskontaktoplysninger.';

  @override
  String get q_expert_offline_functionality_text =>
      'Forbliver enheden meningsfuldt brugbar med begrænset internetforbindelse?';

  @override
  String get q_expert_offline_functionality_hint =>
      'Mere offline-funktionalitet betyder ofte mindre kontinuerlig dataoverførsel til skyen.';

  @override
  String get q_expert_bystander_transparency_text =>
      'Er personer i nærheden transparent informeret (f.eks. via synlighed, meddelelser, tydelige optageindikatorer)?';

  @override
  String get q_expert_bystander_transparency_hint =>
      'Dette handler om privacy for tilskuere og fremhæves i Unboxing.IoT.Privacy som en vigtig udfordring.';

  @override
  String get q_expert_child_data_protection_text =>
      'Er børnedatabeskyttelsesforanstaltninger aktive (minimering, ingen profilering, restriktiv deling)?';

  @override
  String get q_expert_child_data_protection_hint =>
      'Enheder i børnerelaterede sammenhænge kræver især strenge privatlivssikringer.';

  @override
  String get q_expert_access_revocation_text =>
      'Kan digitale nøgler/adgangsrettigheder tilbagekaldes hurtigt og individuelt?';

  @override
  String get q_expert_access_revocation_hint =>
      'Hurtig tilbagekaldelse er vigtig, når enheder deles eller brugere skifter.';

  @override
  String get q_expert_sensitive_inference_controls_text =>
      'Er funktioner, der udleder følsomme sundhedsprofilerings- eller adfærdsprofiler, begrænsede eller deaktiverede?';

  @override
  String get q_expert_sensitive_inference_controls_hint =>
      'Inferenskontrol reducerer risici fra sekundær brug af følsomme data.';

  @override
  String get a_password_title => 'Skift standardkodeord';

  @override
  String get a_password_desc =>
      'Erstat standardkodeordet med et stærkt, unikt kodeord. Brug en kodeorudholdelse.';

  @override
  String get a_updates_title => 'Aktivér automatiske opdateringer';

  @override
  String get a_updates_desc =>
      'Aktivér automatiske sikkerhedsopdateringer i enhed- eller appindstillinger.';

  @override
  String get a_network_title => 'Opret separat IoT Wi-Fi';

  @override
  String get a_network_desc =>
      'Opret et dedikeret Wi-Fi-netværk til smarthome-enheder, f.eks. ved hjælp af routerens gæstenetværk.';

  @override
  String get a_informed_title => 'Informer husstandsmedlemmer';

  @override
  String get a_informed_desc =>
      'Informer alle beboere om, hvilke data enheden indsamler, hvem der har adgang, og hvordan det kan deaktiveres.';

  @override
  String get a_permissions_title => 'Begræns app-tilladelser';

  @override
  String get a_permissions_desc =>
      'Kontrollér medfølgende app-tilladelser i telefonindstillingerne og deaktivér unødvendige.';

  @override
  String get a_camera_consent_title => 'Tilpas kameraplacering med beboerne';

  @override
  String get a_camera_consent_desc =>
      'Få samtykke fra alle berørte. Kameraet må ikke optage områder uden samtykke.';

  @override
  String get a_mic_active_title => 'Deaktivér mikrofon, når den ikke bruges';

  @override
  String get a_mic_active_desc =>
      'Brug den fysiske lydløs-knap eller deaktivér mikrofonen i indstillinger.';

  @override
  String get a_sensor_frequency_title => 'Reducér målingsinterval';

  @override
  String get a_sensor_frequency_desc =>
      'Reducer hvis muligt sensorens målingsfrekvens. Sjældnere målinger producerer færre adfærdsdata.';

  @override
  String get a_sensor_data_deletion_title => 'Slet gamle målinger';

  @override
  String get a_sensor_data_deletion_desc =>
      'Gennemgå opbevaringsperioder i app eller web-UI og aktivér autosletning, eller slet ældre data manuelt på regelmæssig basis.';

  @override
  String get a_sensor_granularity_title => 'Vis mindre detaljerede data';

  @override
  String get a_sensor_granularity_desc =>
      'Skift hvis muligt til mindre detaljeret visning eller evaluering, f.eks. daglige værdier i stedet for minutværdier.';

  @override
  String get a_sensor_local_title => 'Foretrække lokal behandling';

  @override
  String get a_sensor_local_desc =>
      'Kontrollér, om cloud-synkronisering kan deaktiveres, eller om lokal lagring kan aktiveres, så målingsdata ikke sendes til leverandøren.';

  @override
  String get a_voice_history_title => 'Slet stemmeoptelser';

  @override
  String get a_voice_history_desc =>
      'BSI-anbefaling: Slet stemmeoptager regelmæssigt og deaktivér stemmehistorik-lagring, hvis indstillingen er tilgængelig.';

  @override
  String get a_voice_local_title => 'Aktivér lokal stemmebehandling';

  @override
  String get a_voice_local_desc =>
      'Aktivér lokal stemmebehandling, hvis tilgængelig. Hvis ikke, skal du minimere cloud-lagring af stemmedata.';

  @override
  String get a_skills_permissions_title => 'Gennemgå færdigheder/integrationer';

  @override
  String get a_skills_permissions_desc =>
      'Gennemgå, hvilke tredjepartsikoner der har adgang til. Deaktivér unødvendige færdigheder.';

  @override
  String get a_video_encryption_title =>
      'Aktivér ende-til-ende-videokryptering';

  @override
  String get a_video_encryption_desc =>
      'Aktivér ende-til-ende-krypteret transmission for direkte visning og optagelser i din kamera-app/indstillinger.';

  @override
  String get a_video_storage_title => 'Lagre optagelser lokalt';

  @override
  String get a_video_storage_desc =>
      'Konfigurer lokal lagring, hvis muligt. Hvis cloud-lagerlagring er uundgåelig, skal du forkorte opbevaringsperioden og slette optagelser regelmæssigt.';

  @override
  String get a_sharing_restrictions_title => 'Begræns kamera-adgang';

  @override
  String get a_sharing_restrictions_desc =>
      'Fjern alle unødvendige delinger i appen og tillad direkte visning/optagelser kun for påkrævede konti.';

  @override
  String get a_motion_detection_title =>
      'Deaktivér bevægelsesdetektering, når du er hjemme';

  @override
  String get a_motion_detection_desc =>
      'Deaktivér bevægelsesdetektering, når mennesker er hjemme, eller indstil en tidsplan, der aktiverer den kun under fravær.';

  @override
  String get a_account_required_title =>
      'Minimér privatlivspåvirkningen fra påkrævet konto';

  @override
  String get a_account_required_desc =>
      'Hvis drift uden konto ikke er mulig, skal du bruge en separat konto med minimale profildata og deaktivere personaliserede tjenester.';

  @override
  String get a_tracking_disabled_title => 'Deaktivér sporing og annoncering';

  @override
  String get a_tracking_disabled_desc =>
      'Deaktivér sporing, personaliseret annoncering og valgfri telemetri i privatlivsindstillinger.';

  @override
  String get a_local_mode_title => 'Foretrækker offline-brug';

  @override
  String get a_local_mode_desc =>
      'Brug enheden primært via lokale kilder (f.eks. HDMI) for at reducere dataoverførsel til leverandøren.';

  @override
  String get a_data_collection_title => 'Deaktivér historikupload';

  @override
  String get a_data_collection_desc =>
      'Deaktivér transmission af temperaturhistorik til leverandøren i termostat-appen og forkort opbevaringsperioden.';

  @override
  String get a_offline_control_title => 'Opret lokal kontrol';

  @override
  String get a_offline_control_desc =>
      'Konfigurer lokale planlægninger og kontroller uden cloud-afhængighed, hvis enheden understøtter det.';

  @override
  String get a_family_access_title =>
      'Adskilte adgangsrettigheder for husstandsmedlemmer';

  @override
  String get a_family_access_desc =>
      'Opret separate roller/konti, så kun autoriserede personer kan justere opvarmningen.';

  @override
  String get a_local_control_title => 'Aktivér lokale automatiseringer';

  @override
  String get a_local_control_desc =>
      'Brug lokale scener/scheduleringer i stedet for cloud-automatisering, hvor det er tilgængeligt.';

  @override
  String get a_usage_tracking_title => 'Deaktivér brugsopsporing';

  @override
  String get a_usage_tracking_desc =>
      'Deaktivér analyse-, telemetri- og brugsdata-indsamling i appindstillinger.';

  @override
  String get a_offline_fallback_title => 'Sikr offline-fallback';

  @override
  String get a_offline_fallback_desc =>
      'Kontrollér lokale kontakter/knapper og opret backup-kontroller, så enheden forbliver brugbar uden internet.';

  @override
  String get a_offline_unlock_title => 'Sikr offline-adgang';

  @override
  String get a_offline_unlock_desc =>
      'Opret en fysisk nøgle eller nødkode og test adgang, når internettet er utilgængeligt.';

  @override
  String get a_access_logging_title => 'Aktivér adgangslog';

  @override
  String get a_access_logging_desc =>
      'Aktivér logning og meddelelser for låsens åbninger, så uautoriseret adgang kan opdages.';

  @override
  String get a_two_factor_title => 'Aktivér tofaktorgodkendelse';

  @override
  String get a_two_factor_desc =>
      'BSI-anbefaling: Aktivér 2FA for din låskonto for at beskytte fjernaccepter.';

  @override
  String get a_map_privacy_title =>
      'Deaktivér cloud-lagerlagring af etageplaner';

  @override
  String get a_map_privacy_desc =>
      'Skift lagring til lokal og deaktivér cloud-sikkerhedskopier af etageplaner, hvis indstillingen er tilgængelig.';

  @override
  String get a_cloud_required_title => 'Reducér cloudafhængighed';

  @override
  String get a_cloud_required_desc =>
      'Aktivér lokal navigation eller offline-tilstand, hvis tilgængelig. Hvis ikke, skal du overveje at skifte til en mere privatlivsvennlig model.';

  @override
  String get a_vision_data_title => 'Behandl kameradata kun lokalt';

  @override
  String get a_vision_data_desc =>
      'Deaktivér upload/lagring af kamerabilleder og brug udelukkende lokal navigationssignalbehandling, hvor muligt.';

  @override
  String get a_parental_control_title => 'Opret forældreskontrol';

  @override
  String get a_parental_control_desc =>
      'Aktivér forældreskontrol med en PIN-kode og begræns kontakter, funktioner og deling til det nødvendige.';

  @override
  String get a_child_data_limits_title => 'Minimér dataindsamling';

  @override
  String get a_child_data_limits_desc =>
      'Deaktivér valgfri profildata og indsaml kun de børnedata, der kræves til kernefunktionalitet.';

  @override
  String get a_recording_disable_title => 'Deaktivér lyd-/videooptager';

  @override
  String get a_recording_disable_desc =>
      'Deaktivér optagefunktioner som standard og aktivér dem kun kortvarigt, når det er specifikt nødvendigt.';

  @override
  String get a_health_sharing_title => 'Begræns sundhedsdatadeling';

  @override
  String get a_health_sharing_desc =>
      'Tilbagekald sundhedsdataadgang fra unødvendige tredjeparts-apps i app- og kontoindstillinger.';

  @override
  String get a_location_tracking_title => 'Reducér placerings­deling';

  @override
  String get a_location_tracking_desc =>
      'Deaktivér placeringsopsporing uden for aktiv brug eller tillad det kun, mens appen er i brug.';

  @override
  String get a_expert_data_retention_duration_title =>
      'Definer opbevaringsperioder';

  @override
  String get a_expert_data_retention_duration_desc =>
      'Indstil korte, klare opbevaringsperioder i indstillinger og slet regelmæssigt gamle data.';

  @override
  String get a_expert_access_control_granular_title =>
      'Introducer granulære roller og konti';

  @override
  String get a_expert_access_control_granular_desc =>
      'Brug separate konti i stedet for delte login-oplysninger og giv kun de nødvendige minimale tilladelser.';

  @override
  String get a_expert_third_party_sharing_limited_title =>
      'Begræns deling med tredjeparter';

  @override
  String get a_expert_third_party_sharing_limited_desc =>
      'Deaktivér partner-, reklame- og analyticsdeling i privatlivs- og kontoindstillinger.';

  @override
  String get a_expert_data_sale_disabled_title => 'Fravælg datasalg';

  @override
  String get a_expert_data_sale_disabled_desc =>
      'Aktivér tilgængelige \"Sælg ikke\" indstillinger eller gør indsigelse mod datadeling til kommercielle formål.';

  @override
  String get a_expert_update_support_window_title =>
      'Verificer opdateringsforpligtelse';

  @override
  String get a_expert_update_support_window_desc =>
      'Gennemgå leverandørens officielle opdateringspolitik og plan til udskiftning af enhed, hvis der ikke er givet tilsagn.';

  @override
  String get a_expert_vulnerability_process_title =>
      'Gennemgå leverandørens sikkerhedsproces';

  @override
  String get a_expert_vulnerability_process_desc =>
      'Foretrækker leverandører med en klar sikkerhedskontakt og ansvarlig afsløringsprocedure.';

  @override
  String get a_expert_offline_functionality_title =>
      'Prioriter offline-funktionalitet';

  @override
  String get a_expert_offline_functionality_desc =>
      'Aktivér lokale driftsmodi og minimér obligatoriske cloud-funktioner, hvor enheden tillader det.';

  @override
  String get a_expert_bystander_transparency_title =>
      'Tilføj transparensmeddelelser for tilskuere';

  @override
  String get a_expert_bystander_transparency_desc =>
      'Giv synlige meddelelser, optageindikatorer og klar information for mennesker i omgivelserne.';

  @override
  String get a_expert_child_data_protection_title =>
      'Styrk databeskyttelse for børn';

  @override
  String get a_expert_child_data_protection_desc =>
      'Aktivér barnvenlige profiler, minimér dataindsamling og deaktivér profilering/deling.';

  @override
  String get a_expert_access_revocation_title =>
      'Opret hurtig tilbagekaldelse af adgang';

  @override
  String get a_expert_access_revocation_desc =>
      'Sikr, at digitale nøgler kan tilbagekaldes individuelt og øjeblikkeligt, f.eks. i tilfælde af enhedstab.';

  @override
  String get a_expert_sensitive_inference_controls_title =>
      'Begræns slutningsfeatures';

  @override
  String get a_expert_sensitive_inference_controls_desc =>
      'Deaktivér funktioner, der udleder følsomme sundheds- eller adfærdsprofiler, medmindre de er strengt nødvendige.';

  @override
  String get a_dont_know_title => 'Lær dine enhedsindstillinger bedre at kende';

  @override
  String get a_dont_know_desc =>
      'Mindst ét spørgsmål blev besvaret med \"Ved ikke\". Gennemgå dine enhedsindstillinger og dokumentation for at reducere risikoen mere effektivt.';

  @override
  String get sl_base_risk => 'Baseline risiko for enhedstype';

  @override
  String get sl_child_room_bonus => 'Øget følsomhed: barns soveværelse';

  @override
  String get sl_password => 'Standardkodeord ikke ændret';

  @override
  String get sl_updates => 'Automatiske opdateringer ikke aktiveret';

  @override
  String get sl_network => 'Intet separat IoT Wi-Fi konfigureret';

  @override
  String get sl_informed => 'Husstandsmedlemmer ikke informeret';

  @override
  String get sl_permissions => 'App-tilladelser ikke reduceret';

  @override
  String get sl_camera_consent => 'Intet samtykke til kameraopdækning';

  @override
  String get sl_mic_active => 'Mikrofon ikke deaktiveret når ubrugt';

  @override
  String get sl_sensor_frequency => 'Målingsinterval ikke reduceret';

  @override
  String get sl_sensor_data_deletion => 'Gamle målinger ikke slettet';

  @override
  String get sl_sensor_granularity => 'Data lagret med for meget granularitet';

  @override
  String get sl_sensor_local => 'Data overført til cloud';

  @override
  String get sl_voice_history => 'Stemmeopteker ikke sletbare';

  @override
  String get sl_voice_local => 'Ingen lokal stemmebehandling';

  @override
  String get sl_skills_permissions =>
      'Færdigheder ikke gennemgået regelmæssigt';

  @override
  String get sl_video_encryption => 'Videotransmission ikke krypteret';

  @override
  String get sl_video_storage => 'Optagelser kun i leverandørens cloud';

  @override
  String get sl_sharing_restrictions =>
      'Adgang til optagelser ikke kontrolleret';

  @override
  String get sl_motion_detection => 'Bevægelsesdetektering altid aktiv';

  @override
  String get sl_account_required => 'Obligatorisk leverandørkonto krævet';

  @override
  String get sl_tracking_disabled => 'Annoncer-sporing ikke deaktiveret';

  @override
  String get sl_local_mode => 'Ingen offline-drift mulig';

  @override
  String get sl_data_collection => 'Temperaturhistorik sendt til leverandør';

  @override
  String get sl_offline_control => 'Ingen offline-drift mulig';

  @override
  String get sl_family_access => 'Adgang kan ikke begrænses';

  @override
  String get sl_local_control => 'Automatiseringer kræver internetforbindelse';

  @override
  String get sl_usage_tracking => 'Skiftmønstre indsamlet af leverandør';

  @override
  String get sl_offline_fallback => 'Enhed ubrugelig offline';

  @override
  String get sl_offline_unlock => 'Ingen offline-oplåsning mulig';

  @override
  String get sl_access_logging => 'Ingen adgangslog tilgængelig';

  @override
  String get sl_two_factor => 'Tofaktorgodkendelse mangler';

  @override
  String get sl_map_privacy => 'Etageplaner overført til leverandør';

  @override
  String get sl_cloud_required => 'Navigation mulig kun via cloud';

  @override
  String get sl_vision_data => 'Kamerabilleder lagret eller overført';

  @override
  String get sl_parental_control => 'Forældreskontrol ikke konfigureret';

  @override
  String get sl_child_data_limits => 'Dataindsamling ikke begrænset';

  @override
  String get sl_recording_disable => 'Optagelse kan ikke deaktiveres';

  @override
  String get sl_health_sharing => 'Sundhedsdata delt med tredjeparter';

  @override
  String get sl_location_tracking => 'Placeringsopsporing aktiveret';

  @override
  String get sl_expert_data_retention_duration =>
      'Opbevaringsvarighed uklart eller for lang';

  @override
  String get sl_expert_access_control_granular =>
      'Granulær adgangskontrol mangler';

  @override
  String get sl_expert_third_party_sharing_limited =>
      'Deling med tredjeparter ikke begrænset';

  @override
  String get sl_expert_data_sale_disabled => 'Datasalg ikke udelukket';

  @override
  String get sl_expert_update_support_window =>
      'Garanteret opdaterings-support-vindue ukendt';

  @override
  String get sl_expert_vulnerability_process =>
      'Sårbarhedsproces ikke dokumenteret';

  @override
  String get sl_expert_offline_functionality =>
      'Meningfuld offline-drift ikke mulig';

  @override
  String get sl_expert_bystander_transparency =>
      'Transparens for tilskuere mangler';

  @override
  String get sl_expert_child_data_protection =>
      'Tiltag til beskyttelse af børnedata mangler';

  @override
  String get sl_expert_access_revocation =>
      'Individuel adgangstilbagekaldelse ikke mulig';

  @override
  String get sl_expert_sensitive_inference_controls =>
      'Kontroller mod følsomme slutninger mangler';

  @override
  String get risk_hint_camera =>
      'Du svarede på alle spørgsmål positivt. Baseline-risikoen forbliver imidlertid højere for kameraer, fordi de optager højt følsomme observationsdata og kan misbruges til overvågning, hvis de er forkonfigureret.';

  @override
  String get risk_hint_mic =>
      'Du svarede på alle spørgsmål positivt. Baseline-risikoen forbliver imidlertid forhøjet for mikrofon-enheder, fordi stemmesdata er højt følsomt, og utilsigtet aktivering eller skybehandling medfører stadig risici.';

  @override
  String get risk_hint_lock =>
      'Du svarede på alle spørgsmål positivt. Smarte låse har imidlertid stadig forhøjet baseline-risiko, fordi misbrug direkte påvirker fysisk adgang til dit hjem.';

  @override
  String get risk_hint_child_room =>
      'Du svarede på alle spørgsmål positivt. Baseline-risikoen forbliver imidlertid forhøjet i et barneværelse, fordi især følsomme data om børn og deres dagligdag kan påvirkes der.';

  @override
  String get risk_hint_generic =>
      'Du svarede på alle spørgsmål positivt. Enheden kan stadig forblive middel/høj risiko, fordi dens type kan afsløre følsomme brugs- og adfærdsmønstre.';

  @override
  String get gen_rec_0 =>
      'Opsæt et separat Wi-Fi-netværk til smart home-enheder (f.eks. routerens gæstenetværk).';

  @override
  String get gen_rec_1 =>
      'Brug en password manager, og giv hver enhed en unik og stærk adgangskode.';

  @override
  String get gen_rec_2 =>
      'Aktivér multifaktorgodkendelse (MFA) for alle leverandørkonti.';

  @override
  String get gen_rec_3 =>
      'Aftal, hvem i husstanden der har ansvar for opdateringer, sikkerhedskopier og konti.';

  @override
  String get gen_rec_4 =>
      'Gennemgå regelmæssigt (mindst én gang i kvartalet) alle adgangsrettigheder og konti.';

  @override
  String get gen_rec_5 =>
      'Bortskaf gamle enheder på en privatlivssikker måde: udfør en fabriksnulstilling og fjern dem fra leverandørens cloudkonti.';

  @override
  String get gen_rec_6 =>
      'Brug et samtykketjek i husstanden før køb af nye enheder, og involvér alle medlemmer af husstanden.';
}
