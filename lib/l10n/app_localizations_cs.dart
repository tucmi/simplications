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
  String get welcomePrivacyTitle => 'Soukromí bez cloudu';

  @override
  String get welcomePrivacyDescription =>
      'Nejsou shromažďovány žádné osobní údaje. Vaše odpovědi zůstávají v tomto zařízení a nic se neodesílá na server ani do cloudu.';

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
      'Výzkumný projekt zaměřený na soukromí v chytré domácnosti';

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
      'Simplications je výzkumný projekt zaměřený na soukromí v chytré domácnosti. Tato aplikace je součástí projektu a provede vás místnost po místnosti vašimi zařízeními s praktickými doporučeními na základě vašich odpovědí.';

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
  String get room_living => 'Obývací pokoj';

  @override
  String get room_kitchen => 'Kuchyně';

  @override
  String get room_bedroom => 'Ložnice';

  @override
  String get room_child_bedroom => 'Dětský pokoj';

  @override
  String get room_bathroom => 'Koupelna';

  @override
  String get room_office => 'Pracovna';

  @override
  String get room_hallway => 'Chodba / vstup';

  @override
  String get room_garden => 'Zahrada / venkovní prostor';

  @override
  String get room_basement => 'Sklep / spíž';

  @override
  String get room_whole_home => 'Celý domov';

  @override
  String get device_simple_sensor =>
      'Senzor (např. dveřní, pohybový, teplotní, vlhkostní nebo světelný)';

  @override
  String get device_humidity_sensor => 'Senzor vlhkosti';

  @override
  String get device_temperature_sensor => 'Teplotní senzor';

  @override
  String get device_light_sensor => 'Světelný senzor';

  @override
  String get device_smart_speaker => 'Chytrý reproduktor / hlasový asistent';

  @override
  String get device_smart_display => 'Chytrý displej (např. Nest Hub)';

  @override
  String get device_smart_tv => 'Chytrá televize';

  @override
  String get device_indoor_camera => 'Chytrá vnitřní kamera';

  @override
  String get device_outdoor_camera => 'Chytrá venkovní kamera';

  @override
  String get device_doorbell_camera => 'Chytrý zvonek s kamerou';

  @override
  String get device_baby_monitor => 'Dětská chůvička / kamera pro miminko';

  @override
  String get device_robot_vacuum => 'Robotický vysavač';

  @override
  String get device_smart_fridge => 'Chytrá lednice';

  @override
  String get device_smart_oven => 'Chytrá trouba / sporák';

  @override
  String get device_smart_coffee => 'Chytrý kávovar';

  @override
  String get device_smart_washing => 'Chytrá pračka / sušička';

  @override
  String get device_smart_thermostat => 'Chytrý termostat / řízení vytápění';

  @override
  String get device_smart_plug => 'Chytrá zásuvka';

  @override
  String get device_smart_light => 'Chytré osvětlení';

  @override
  String get device_smart_lock => 'Chytrý dveřní zámek';

  @override
  String get device_smart_blind => 'Chytrá žaluzie / roleta';

  @override
  String get device_smart_toy => 'Chytrá hračka';

  @override
  String get device_smart_router => 'Chytrý router / mesh systém';

  @override
  String get device_smart_hub =>
      'Centrum chytré domácnosti (např. Homey, Home Assistant)';

  @override
  String get device_smart_meter => 'Inteligentní elektroměr / smart meter';

  @override
  String get device_smart_irrigation => 'Chytrý zavlažovací systém';

  @override
  String get device_smart_printer => 'Chytrá tiskárna';

  @override
  String get q_password_text =>
      'Změnili jste výchozí heslo zařízení nebo jeho propojeného účtu?';

  @override
  String get q_password_hint =>
      'Výchozí hesla jsou často veřejně známá a snadno se hackují.';

  @override
  String get q_updates_text =>
      'Jsou pro zařízení povoleny automatické bezpečnostní aktualizace?';

  @override
  String get q_updates_hint =>
      'Aktualizace zavírají známé bezpečnostní chyby bez problémů.';

  @override
  String get q_network_text =>
      'Je zařízení připojeno k oddělené síti chytré domácnosti nebo IoT Wi-Fi?';

  @override
  String get q_network_hint =>
      'Vyhrazená síť pro chytrá zařízení chrání vaši hlavní domácí síť.';

  @override
  String get q_informed_text =>
      'Jsou všechny osoby v domácnosti informovány o tomto zařízení a jeho funkci?';

  @override
  String get q_informed_hint =>
      'Všichni členové domácnosti by měli vědět, jaká data zařízení sbírá.';

  @override
  String get q_permissions_text =>
      'Zablokovali jste zbytečná oprávnění aplikace (např. polohu, kontakty)?';

  @override
  String get q_permissions_hint =>
      'Měla by být povolena pouze oprávnění, která jsou skutečně potřeba.';

  @override
  String get q_mic_active_text =>
      'Deaktivujete mikrofon, když ho nepoužíváte aktivně?';

  @override
  String get q_mic_active_hint =>
      'Chytré reproduktory a zařízení s mikrofony mohou být aktivovány neúmyslně.';

  @override
  String get q_camera_consent_text =>
      'Kamera nahrává pouze oblasti, ke kterým všichni dotčení dali svůj souhlas?';

  @override
  String get q_camera_consent_hint =>
      'Kamery v společných nebo soukromých prostorech vyžadují souhlas všech rezidentů.';

  @override
  String get q_sensor_frequency_text =>
      'Můžete snížit interval měření senzoru (např. měřit méně často)?';

  @override
  String get q_sensor_frequency_hint =>
      'Nižší frekvence měření vytváří méně dat a omezuje závěry o vašem chování.';

  @override
  String get q_sensor_data_deletion_text =>
      'Jsou starší naměřené hodnoty automaticky nebo na žádost smazány?';

  @override
  String get q_sensor_data_deletion_hint =>
      'Stará historická data by neměla být ukládána trvale. Zkontrolujte nastavení uchovávání.';

  @override
  String get q_sensor_granularity_text =>
      'Systém zobrazuje data senzoru pouze v agregované podobě (např. denní místo minutové)?';

  @override
  String get q_sensor_granularity_hint =>
      'Méně podrobná zobrazení pomáhají zabránit závěrům o přesných vzorcích přítomnosti nebo chování.';

  @override
  String get q_sensor_local_text =>
      'Jsou data měření zpracována a ukládána místně bez přenosu do cloudu?';

  @override
  String get q_sensor_local_hint =>
      'Místní zpracování brání dodavateli v přístupu k vašim datům měření.';

  @override
  String get q_voice_history_text =>
      'Můžete smazat hlasové nahrávky z historie zařízení nebo tuto funkci zakázat?';

  @override
  String get q_voice_history_hint =>
      'Doporučení BSI: Minimalizujte dobu uchování nahrávek nebo je pravidelně odstraňujte.';

  @override
  String get q_voice_local_text =>
      'Je zpracování hlasu částečně prováděno místně na zařízení?';

  @override
  String get q_voice_local_hint =>
      'Místní zpracování snižuje množství dat odeslaných do cloudu.';

  @override
  String get q_skills_permissions_text =>
      'Pravidelně kontrolujete, které dovednosti mají přístup k vašemu účtu?';

  @override
  String get q_skills_permissions_hint =>
      'Dovednosti třetích stran mohou přistupovat k citlivým datům. Povolte pouze nezbytné dovednosti.';

  @override
  String get q_video_encryption_text =>
      'Je video nahrávání a přenos šifrováno end-to-end?';

  @override
  String get q_video_encryption_hint =>
      'Doporučení BSI: Šifrovaná připojení zabraňují zachycení a krádeži dat při přenosu.';

  @override
  String get q_video_storage_text =>
      'Jsou nahrávky uloženy místně (ne pouze v cloudovém úložišti dodavatele)?';

  @override
  String get q_video_storage_hint =>
      'Místní úložiště vám dává větší kontrolu nad vašimi daty; cloudové úložiště závisí na bezpečnosti dodavatele.';

  @override
  String get q_sharing_restrictions_text =>
      'Můžete řídit, kdo má přístup k živému přenosu a nahrávkám?';

  @override
  String get q_sharing_restrictions_hint =>
      'Měli byste moci přesně řídit přístup k video nahrávkám.';

  @override
  String get q_motion_detection_text =>
      'Můžete zakázat nebo naplánovat detekci pohybu, když jste doma?';

  @override
  String get q_motion_detection_hint =>
      'Doporučení BSI: Vyhnutí se zbytečným nahrávkám snižuje objem dat a riziko zneužití.';

  @override
  String get q_account_required_text =>
      'Můžete zařízení používat bez povinného online účtu?';

  @override
  String get q_account_required_hint =>
      'Povinné účty umožňují sledování reklam a ukládání historii sledování. Bezúčetné použití chrání soukromí.';

  @override
  String get q_tracking_disabled_text =>
      'Můžete zcela zakázat reklamu a funkce sledování?';

  @override
  String get q_tracking_disabled_hint =>
      'Chytré televize často sbírají data o zvyklostech sledování. Vyhledejte nastavení soukromí.';

  @override
  String get q_local_mode_text =>
      'Můžete zařízení používat přes HDMI nebo místní zdroje bez internetu?';

  @override
  String get q_local_mode_hint =>
      'Offline použití chrání data o použití před odesláním dodavateli.';

  @override
  String get q_data_collection_text =>
      'Zůstává historie teplot a plány na zařízení (nejsou odesílány dodavateli)?';

  @override
  String get q_data_collection_hint =>
      'Historie může odhalit vzorce přítomnosti a zvyky. Místní ukládání snižuje nežádoucí analýzu.';

  @override
  String get q_offline_control_text =>
      'Můžete termostat provozovat offline (bez internetu)?';

  @override
  String get q_offline_control_hint =>
      'Offline provoz nebo místní automatizace chrání data před přístupem ke cloudu.';

  @override
  String get q_family_access_text =>
      'Můžete řídit, kdo může nastavit topení (např. omezit hosty)?';

  @override
  String get q_family_access_hint =>
      'Členové domácnosti by měli mít kontrolu bez návštěv, které by měnily vše.';

  @override
  String get q_local_control_text =>
      'Mohou se automatizace spouštět místně bez internetu?';

  @override
  String get q_local_control_hint =>
      'Místní scény a plány lépe chrání vaše soukromí.';

  @override
  String get q_usage_tracking_text =>
      'Zablokovali jste nebo omezili sběr vzorců přepínání a doby používání dodavatelem?';

  @override
  String get q_usage_tracking_hint =>
      'Vzorce používání mohou odhalit přítomnost a zvyky. Zkontrolujte nastavení soukromí aplikace.';

  @override
  String get q_offline_fallback_text =>
      'Zařízení stále fungují, když selže internetové nebo aplikační připojení?';

  @override
  String get q_offline_fallback_hint =>
      'Spolehlivý místní provoz je důležitý pro denní použití a soukromí.';

  @override
  String get q_offline_unlock_text =>
      'Můžete zámek odemknout offline (např. kódem nebo klíčem)?';

  @override
  String get q_offline_unlock_hint =>
      'Záložní možnosti zabraňují uzamčení během výpadku internetu nebo elektřiny.';

  @override
  String get q_access_logging_text =>
      'Můžete sledovat, kdo zámek otevřel a kdy?';

  @override
  String get q_access_logging_hint =>
      'Přístupový protokol vám pomůže zjistit podezřelou aktivitu.';

  @override
  String get q_two_factor_text =>
      'Je pro účet zámku dostupné dvoufaktorové ověřování (2FA)?';

  @override
  String get q_two_factor_hint =>
      'Doporučení BSI: 2FA chrání váš účet před neoprávněným vzdáleným přístupem.';

  @override
  String get q_map_privacy_text =>
      'Jsou vytvořené plány podlaží uloženy výhradně místně na zařízení?';

  @override
  String get q_map_privacy_hint =>
      'Domácí plány podlaží jsou citlivé informace a neměly by být odesílány dodavateli.';

  @override
  String get q_cloud_required_text =>
      'Funguje navigace podlahy bez připojení ke cloudu?';

  @override
  String get q_cloud_required_hint =>
      'Zařízení s místní navigací jsou přátelštější k soukromí, protože se data místnosti nenahrávají.';

  @override
  String get q_vision_data_text =>
      'Pokud robot používá kamery: jsou obrazy z kamer používány místně pouze pro navigaci (bez ukládání nebo přenosu)?';

  @override
  String get q_vision_data_hint =>
      'Obrazy z kamery by měly být zpracovány místně pro navigaci a neměly by být ukládány ani odesílány dodavateli.';

  @override
  String get q_parental_control_text =>
      'Existují funkce rodičovského ovládání ke správě hračky?';

  @override
  String get q_parental_control_hint =>
      'Rodičovské ovládání by mělo umožňovat omezení kontaktů a funkcí.';

  @override
  String get q_child_data_limits_text =>
      'Můžete omezit, která osobní data si hračka sbírá?';

  @override
  String get q_child_data_limits_hint =>
      'Zařízení zaměřená na děti by měla sbírat a ukládat minimální data.';

  @override
  String get q_recording_disable_text =>
      'Můžete zakázat zvukové a video nahrávání na zařízení?';

  @override
  String get q_recording_disable_hint =>
      'Doporučení BSI: Nahrávky dětí by měly být možné pouze s explicitní kontrolou.';

  @override
  String get q_expert_data_retention_duration_text =>
      'Je doba uchování vašich osobních údajů explicitně definována a omezena na nutné?';

  @override
  String get q_expert_data_retention_duration_hint =>
      'Inspirováno etiketu CMU IoT Security & Privacy a Unboxing.IoT.Privacy: krátké, jasné periody uchování snižují riziko.';

  @override
  String get q_expert_access_control_granular_text =>
      'Můžete řídit přístupová práva podrobně (role, samostatné účty, bez sdílených výchozích přihlášení)?';

  @override
  String get q_expert_access_control_granular_hint =>
      'Podrobné řízení přístupu snižuje riziko neoprávněného přístupu a zneužití.';

  @override
  String get q_expert_third_party_sharing_limited_text =>
      'Je sdílení třetích stran vypnuto nebo jasně omezeno na potřebné služby?';

  @override
  String get q_expert_third_party_sharing_limited_hint =>
      'Zkontrolujte nastavení soukromí a účtu, abyste zjistili, zda jsou data odesílána do služeb reklamy, analýzy nebo partnerům.';

  @override
  String get q_expert_data_sale_disabled_text =>
      'Je prodej vašich dat vyloučen (nebo je-li to možné, aktivně vypnut)?';

  @override
  String get q_expert_data_sale_disabled_hint =>
      'Explicitní možnost \"prodej dat vypnut\" je silný signál ochrany soukromí.';

  @override
  String get q_expert_update_support_window_text =>
      'Je známo, jak dlouho dodavatel garantuje bezpečnostní aktualizace?';

  @override
  String get q_expert_update_support_window_hint =>
      'Transparentní závazek k aktualizacím snižuje dlouhodobá bezpečnostní rizika a rizika soukromí.';

  @override
  String get q_expert_vulnerability_process_text =>
      'Existuje zdokumentovaný proces pro hlášení a opravu chyb zabezpečení?';

  @override
  String get q_expert_vulnerability_process_hint =>
      'Upřednostňujte dodavatele, kteří poskytují odpovědné zásady zveřejňování nebo jasné informace o bezpečnostním kontaktu.';

  @override
  String get q_expert_offline_functionality_text =>
      'Zůstává zařízení smysluplně použitelné s omezeným připojením k internetu?';

  @override
  String get q_expert_offline_functionality_hint =>
      'Více funkcí offline často znamená menší nepřetržitý přenos dat do cloudu.';

  @override
  String get q_expert_bystander_transparency_text =>
      'Jsou osoby v okolí transparentně informovány (např. prostřednictvím viditelnosti, oznámení, jasných indikátorů nahrávání)?';

  @override
  String get q_expert_bystander_transparency_hint =>
      'Toto se týká soukromí okolostojících osob a je zdůrazňováno v Unboxing.IoT.Privacy jako klíčová výzva.';

  @override
  String get q_expert_child_data_protection_text =>
      'Jsou aktivní ochranné prvky údajů o dětech (minimalizace, bez profilování, omezené sdílení)?';

  @override
  String get q_expert_child_data_protection_hint =>
      'Zařízení v kontextu související s dětmi vyžadují zvláště přísné ochranné prvky soukromí.';

  @override
  String get q_expert_access_revocation_text =>
      'Lze digitální klíče/přístupová práva odvolat rychle a jednotlivě?';

  @override
  String get q_expert_access_revocation_hint =>
      'Rychlé odvolání je zásadní při sdílení zařízení nebo při změně uživatelů.';

  @override
  String get a_password_title => 'Změnit výchozí heslo';

  @override
  String get a_password_desc =>
      'Nahraďte výchozí heslo silným, jedinečným heslem. Používejte správce hesel.';

  @override
  String get a_updates_title => 'Povolit automatické aktualizace';

  @override
  String get a_updates_desc =>
      'Povolte automatické bezpečnostní aktualizace v nastavení zařízení nebo aplikace.';

  @override
  String get a_network_title => 'Nastavit oddělené IoT Wi-Fi';

  @override
  String get a_network_desc =>
      'Nastavte vyhrazenou síť Wi-Fi pro zařízení chytré domácnosti, například pomocí síti pro hosty na routeru.';

  @override
  String get a_informed_title => 'Informovat členy domácnosti';

  @override
  String get a_informed_desc =>
      'Informujte všechny rezidenty o tom, jaká data zařízení sbírá, kdo má přístup a jak jej lze zakázat.';

  @override
  String get a_permissions_title => 'Omezit oprávnění aplikace';

  @override
  String get a_permissions_desc =>
      'Zkontrolujte oprávnění doprovodné aplikace v nastavení telefonu a zakažte zbytečná.';

  @override
  String get a_camera_consent_title => 'Slaďte pozici kamery s rezidenty';

  @override
  String get a_camera_consent_desc =>
      'Získejte souhlas všech dotčených osob. Kamera nesmí nahrávat oblasti bez souhlasu.';

  @override
  String get a_mic_active_title => 'Deaktivovat mikrofon, když se nepoužívá';

  @override
  String get a_mic_active_desc =>
      'Použijte fyzický přepínač ztišení nebo zakažte mikrofon v nastavení.';

  @override
  String get a_sensor_frequency_title => 'Snížit interval měření';

  @override
  String get a_sensor_frequency_desc =>
      'Pokud je to možné, snižte frekvenci měření senzoru. Méně časté měření vytváří méně datových bodů chování.';

  @override
  String get a_sensor_data_deletion_title => 'Smazat staré naměřené hodnoty';

  @override
  String get a_sensor_data_deletion_desc =>
      'Zkontrolujte doby uchování v aplikaci nebo webovém rozhraní a povolte automatické mazání nebo pravidelně ručně smažte starší data.';

  @override
  String get a_sensor_granularity_title => 'Zobrazit méně podrobná data';

  @override
  String get a_sensor_granularity_desc =>
      'Pokud je to možné, přepněte na méně podrobné zobrazení nebo vyhodnocení, například denní hodnoty místo minutových.';

  @override
  String get a_sensor_local_title => 'Upřednostňovat místní zpracování';

  @override
  String get a_sensor_local_desc =>
      'Zkontrolujte, zda lze zakázat cloudovou synchronizaci nebo zapnout místní úložiště tak, aby data měření nebyla odesílána dodavateli.';

  @override
  String get a_voice_history_title => 'Smazat hlasové nahrávky';

  @override
  String get a_voice_history_desc =>
      'Doporučení BSI: Pravidelně mažte hlasové nahrávky a zakažte ukládání historie hlasu, pokud je tato možnost dostupná.';

  @override
  String get a_voice_local_title => 'Povolit místní zpracování hlasu';

  @override
  String get a_voice_local_desc =>
      'Povolte místní zpracování hlasu, pokud je dostupné. Pokud ne, minimalizujte cloudové úložiště hlasových dat.';

  @override
  String get a_skills_permissions_title => 'Zkontrolovat dovednosti/integrace';

  @override
  String get a_skills_permissions_desc =>
      'Zkontrolujte, které dovednosti třetích stran mají přístup. Zakažte zbytečné dovednosti.';

  @override
  String get a_video_encryption_title => 'Povolit end-to-end šifrování videa';

  @override
  String get a_video_encryption_desc =>
      'Povolte end-to-end šifrovaný přenos pro live view a nahrávky v nastavení aplikace/kamery.';

  @override
  String get a_video_storage_title => 'Uložit nahrávky místně';

  @override
  String get a_video_storage_desc =>
      'Pokud je to možné, nakonfigurujte místní úložiště. Pokud je cloudové úložiště nevyhnutelné, zkraťte dobu uchování a pravidelně mažte nahrávky.';

  @override
  String get a_sharing_restrictions_title => 'Omezit přístup k kameře';

  @override
  String get a_sharing_restrictions_desc =>
      'Odeberte veškeré zbytečné sdílení v aplikaci a povolte live view/nahrávky pouze pro požadované účty.';

  @override
  String get a_motion_detection_title =>
      'Zakázat detekci pohybu, když jste doma';

  @override
  String get a_motion_detection_desc =>
      'Zakažte detekci pohybu, když jsou lidé doma, nebo nastavte plán, který ji aktivuje pouze během nepřítomnosti.';

  @override
  String get a_account_required_title =>
      'Minimalizujte dopad na soukromí povinného účtu';

  @override
  String get a_account_required_desc =>
      'Pokud není možné provozování bez účtu, použijte samostatný účet s minimálními údaji profilu a zakažte personalizované služby.';

  @override
  String get a_tracking_disabled_title => 'Zakázat sledování a reklamu';

  @override
  String get a_tracking_disabled_desc =>
      'Zakažte sledování, personalizovanou reklamu a volitelnou telemetrii v nastavení soukromí.';

  @override
  String get a_local_mode_title => 'Upřednostňovat offline použití';

  @override
  String get a_local_mode_desc =>
      'Zařízení používejte především prostřednictvím místních zdrojů (např. HDMI), abyste snížili přenos dat dodavateli.';

  @override
  String get a_data_collection_title => 'Zakázat nahrávání historie';

  @override
  String get a_data_collection_desc =>
      'Zakažte přenos historie teplot dodavateli v aplikaci termostatu a zkraťte dobu uchování.';

  @override
  String get a_offline_control_title => 'Nastavit místní ovládání';

  @override
  String get a_offline_control_desc =>
      'Konfigurujte místní plány a ovládání bez závislosti na cloudu, pokud je to zařízením podporováno.';

  @override
  String get a_family_access_title =>
      'Oddělená přístupová práva pro členy domácnosti';

  @override
  String get a_family_access_desc =>
      'Nastavte oddělené role/účty tak, aby bylo možné topení nastavovat pouze oprávněné osoby.';

  @override
  String get a_local_control_title => 'Povolit místní automatizace';

  @override
  String get a_local_control_desc =>
      'Používejte místní scény/plány namísto cloudových automatizací, kde je to dostupné.';

  @override
  String get a_usage_tracking_title => 'Zakázat sledování použití';

  @override
  String get a_usage_tracking_desc =>
      'Zakažte analýzu, telemetrii a sběr dat o používání v nastavení aplikace.';

  @override
  String get a_offline_fallback_title => 'Zajistit offline zálohu';

  @override
  String get a_offline_fallback_desc =>
      'Zkontrolujte místní přepínače/tlačítka a nastavte záložní ovládání tak, aby zařízení zůstalo použitelné bez internetu.';

  @override
  String get a_offline_unlock_title => 'Bezpečný offline přístup';

  @override
  String get a_offline_unlock_desc =>
      'Nastavte fyzický klíč nebo nouzový kód a otestujte přístup bez internetu.';

  @override
  String get a_access_logging_title => 'Povolit přístupový protokol';

  @override
  String get a_access_logging_desc =>
      'Povolte protokolování a oznámení pro otevření zámku, aby bylo možné detekovat neoprávněný přístup.';

  @override
  String get a_two_factor_title => 'Povolit dvoufaktorové ověřování';

  @override
  String get a_two_factor_desc =>
      'Doporučení BSI: Povolte 2FA pro váš účet zámku, abyste chránili vzdálený přístup.';

  @override
  String get a_map_privacy_title => 'Zakázat cloudové ukládání plánu podlaží';

  @override
  String get a_map_privacy_desc =>
      'Přepněte úložiště na místní a zakažte zálohování plánu podlaží do cloudu, pokud je tato možnost dostupná.';

  @override
  String get a_cloud_required_title => 'Snížit závislost na cloudu';

  @override
  String get a_cloud_required_desc =>
      'Povolte místní navigaci nebo offline režim, je-li dostupný. Pokud ne, zvažte přechod na model více přátelský k soukromí.';

  @override
  String get a_vision_data_title => 'Zpracovat data kamery pouze místně';

  @override
  String get a_vision_data_desc =>
      'Zakažte nahrávání/ukládání obrazů z kamery a používejte výhradně místní zpracování navigace, kde je to možné.';

  @override
  String get a_parental_control_title => 'Nastavit rodičovské ovládání';

  @override
  String get a_parental_control_desc =>
      'Povolte rodičovské ovládání s PIN kódem a omezte kontakty, funkce a sdílení na to, co je nezbytné.';

  @override
  String get a_child_data_limits_title => 'Minimalizujte sběr dat';

  @override
  String get a_child_data_limits_desc =>
      'Zakažte volitelné údaje profilu a sbírejte pouze data dítěte potřebná pro základní funkce.';

  @override
  String get a_recording_disable_title => 'Zakázat zvukové/video nahrávky';

  @override
  String get a_recording_disable_desc =>
      'Zakažte funkce nahrávání ve výchozím nastavení a povolte je pouze krátce, když je to konkrétně potřeba.';

  @override
  String get a_expert_data_retention_duration_title =>
      'Definovat doby uchování';

  @override
  String get a_expert_data_retention_duration_desc =>
      'Nastavte krátké, jasné periody uchování v nastavení a pravidelně odstraňujte stará data.';

  @override
  String get a_expert_access_control_granular_title =>
      'Zavést podrobné role a účty';

  @override
  String get a_expert_access_control_granular_desc =>
      'Místo sdílených přihlášení používejte samostatné účty a udělujte pouze minimálně potřebná oprávnění.';

  @override
  String get a_expert_third_party_sharing_limited_title =>
      'Omezit sdílení třetích stran';

  @override
  String get a_expert_third_party_sharing_limited_desc =>
      'Zakažte sdílení s partnery, reklamami a analytikou v nastavení soukromí a účtu.';

  @override
  String get a_expert_data_sale_disabled_title => 'Odhlásit se z prodeje dat';

  @override
  String get a_expert_data_sale_disabled_desc =>
      'Povolte dostupné možnosti \"Neprodávat\" nebo namítejte proti sdílení dat pro komerční účely.';

  @override
  String get a_expert_update_support_window_title =>
      'Ověřit závazek k aktualizacím';

  @override
  String get a_expert_update_support_window_desc =>
      'Zkontrolujte oficiální zásadu aktualizací dodavatele a naplánujte náhradu zařízení, není-li závazek uveden.';

  @override
  String get a_expert_vulnerability_process_title =>
      'Zkontrolovat proces bezpečnosti dodavatele';

  @override
  String get a_expert_vulnerability_process_desc =>
      'Upřednostňujte dodavatele s jasným bezpečnostním kontaktem a procesem odpovědného zveřejňování.';

  @override
  String get a_expert_offline_functionality_title =>
      'Upřednostnit offline funkčnost';

  @override
  String get a_expert_offline_functionality_desc =>
      'Povolte místní provozní režimy a minimalizujte povinné funkce cloudu, kde je to možné.';

  @override
  String get a_expert_bystander_transparency_title =>
      'Přidat transparentní upozornění pro okolostojící';

  @override
  String get a_expert_bystander_transparency_desc =>
      'Poskytněte viditelná upozornění, indikátory nahrávání a jasné informace pro osoby v okolí.';

  @override
  String get a_expert_child_data_protection_title =>
      'Posílit ochranu údajů o dětech';

  @override
  String get a_expert_child_data_protection_desc =>
      'Povolte profily vhodné pro děti, minimalizujte sběr dat a zakažte profilování/sdílení.';

  @override
  String get a_expert_access_revocation_title =>
      'Nastavit rychlé odvolání přístupu';

  @override
  String get a_expert_access_revocation_desc =>
      'Zajistěte, aby digitální klíče mohly být odvolány jednotlivě a okamžitě, např. v případě ztráty zařízení.';

  @override
  String get a_dont_know_title => 'Lépe se seznámit s nastavením zařízení';

  @override
  String get a_dont_know_desc =>
      'Alespoň jedna otázka byla zodpovězena s \"Nevím\". Zkontrolujte nastavení zařízení a dokumentaci, abyste efektivněji snížili riziko.';

  @override
  String get sl_base_risk => 'Základní riziko typu zařízení';

  @override
  String get sl_child_room_bonus => 'Zvýšená citlivost: dětský pokoj';

  @override
  String get sl_password => 'Výchozí heslo není změněno';

  @override
  String get sl_updates => 'Automatické aktualizace nejsou povoleny';

  @override
  String get sl_network => 'Samostatné IoT Wi-Fi není nakonfigurováno';

  @override
  String get sl_informed => 'Členové domácnosti nejsou informováni';

  @override
  String get sl_permissions => 'Oprávnění aplikace nejsou snížena';

  @override
  String get sl_camera_consent => 'Bez souhlasu pro nahrávané oblasti';

  @override
  String get sl_mic_active => 'Mikrofon není vypnut, když se nepoužívá';

  @override
  String get sl_sensor_frequency => 'Interval měření není snížen';

  @override
  String get sl_sensor_data_deletion => 'Staré naměřené hodnoty nejsou smazány';

  @override
  String get sl_sensor_granularity =>
      'Data ukládána s příliš velkou granularitou';

  @override
  String get sl_sensor_local => 'Data přenesena do cloudu';

  @override
  String get sl_voice_history => 'Hlasové nahrávky nejsou smazatelné';

  @override
  String get sl_voice_local => 'Žádné místní zpracování hlasu';

  @override
  String get sl_skills_permissions =>
      'Dovednosti nejsou pravidelně kontrolovány';

  @override
  String get sl_video_encryption => 'Přenos videa není šifrován';

  @override
  String get sl_video_storage => 'Nahrávky pouze v cloudovém úložišti prodejce';

  @override
  String get sl_sharing_restrictions => 'Přístup k nahrávce není kontrolován';

  @override
  String get sl_motion_detection => 'Detekce pohybu je vždy aktivní';

  @override
  String get sl_account_required => 'Vyžadován povinný účet u prodejce';

  @override
  String get sl_tracking_disabled => 'Sledování reklam není zakázáno';

  @override
  String get sl_local_mode => 'Offline provoz není možný';

  @override
  String get sl_data_collection => 'Historie teplot odesílána dodavateli';

  @override
  String get sl_offline_control => 'Offline provoz není možný';

  @override
  String get sl_family_access => 'Přístup nelze omezit';

  @override
  String get sl_local_control => 'Automatizace vyžaduje připojení k internetu';

  @override
  String get sl_usage_tracking => 'Vzorce přepínání shromažďovány dodavatelem';

  @override
  String get sl_offline_fallback => 'Zařízení nepoužitelné offline';

  @override
  String get sl_offline_unlock => 'Offline odemknutí není možné';

  @override
  String get sl_access_logging => 'Přístupový protokol není k dispozici';

  @override
  String get sl_two_factor => 'Dvoufaktorové ověřování chybí';

  @override
  String get sl_map_privacy => 'Plán podlaží odeslan dodavateli';

  @override
  String get sl_cloud_required => 'Navigace pouze možná prostřednictvím cloudu';

  @override
  String get sl_vision_data => 'Obrazy z kamer jsou uloženy nebo přeneseny';

  @override
  String get sl_parental_control => 'Rodičovské ovládání není nakonfigurováno';

  @override
  String get sl_child_data_limits => 'Sběr dat není omezen';

  @override
  String get sl_recording_disable => 'Nahrávání nelze zakázat';

  @override
  String get sl_expert_data_retention_duration =>
      'Doba uchování nejasná nebo příliš dlouhá';

  @override
  String get sl_expert_access_control_granular =>
      'Podrobné řízení přístupu chybí';

  @override
  String get sl_expert_third_party_sharing_limited =>
      'Sdílení třetích stran není omezeno';

  @override
  String get sl_expert_data_sale_disabled => 'Prodej dat není vyloučen';

  @override
  String get sl_expert_update_support_window =>
      'Garantovaná doba podpory aktualizací neznámá';

  @override
  String get sl_expert_vulnerability_process =>
      'Proces zranitelnosti není zdokumentován';

  @override
  String get sl_expert_offline_functionality =>
      'Smysluplný offline provoz není možný';

  @override
  String get sl_expert_bystander_transparency =>
      'Transparentnost pro blízké osoby chybí';

  @override
  String get sl_expert_child_data_protection =>
      'Opatření pro ochranu údajů dětí chybí';

  @override
  String get sl_expert_access_revocation =>
      'Individuální odvolání přístupu není možné';

  @override
  String get risk_hint_camera =>
      'Odpověděli jste kladně na všechny otázky. Základní riziko však zůstává vyšší pro kamery, protože zachycují velmi citlivá data pozorování a lze je zneužít ke sledování, pokud jsou nesprávně nakonfigurované.';

  @override
  String get risk_hint_mic =>
      'Odpověděli jste kladně na všechny otázky. Základní riziko však zůstává zvýšeno pro zařízení s mikrofony, protože hlasová data jsou velmi citlivá a náhodná aktivace nebo cloudové zpracování stále nese rizika.';

  @override
  String get risk_hint_lock =>
      'Odpověděli jste kladně na všechny otázky. Chytré zámky však mají stále zvýšené základní riziko, protože zneužití přímo ovlivňuje fyzický přístup do vašeho domu.';

  @override
  String get risk_hint_child_room =>
      'Odpověděli jste kladně na všechny otázky. Základní riziko však zůstává zvýšeno v dětském pokoji, protože zvlášť citlivá data o dětech a jejich každodenní život tam mohou být ovlivněna.';

  @override
  String get risk_hint_generic =>
      'Odpověděli jste kladně na všechny otázky. Zařízení však může zůstat se středním/vysokým rizikem, protože jeho typ může odhalit citlivá data o používání a chování.';

  @override
  String get gen_rec_0 =>
      'Nastavte oddělené Wi-Fi sítě pro zařízení chytré domácnosti (např. síť pro hosty na routeru).';

  @override
  String get gen_rec_1 =>
      'Používejte správce hesel a přiřaďte každému zařízení jedinečné silné heslo.';

  @override
  String get gen_rec_2 =>
      'Povolte vícefaktorové ověřování (MFA) pro všechny účty u prodejců.';

  @override
  String get gen_rec_3 =>
      'Určete, kdo ve vaší domácnosti je odpovědný za aktualizace, zálohy a účty.';

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
