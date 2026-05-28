import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_cs.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('cs'),
    Locale('da'),
    Locale('de'),
    Locale('en'),
    Locale('fr'),
    Locale('nl'),
    Locale('pl'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Simplications'**
  String get appTitle;

  /// No description provided for @welcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Simplications\nSmart Home\nPrivacy Check'**
  String get welcomeTitle;

  /// No description provided for @welcomeDescription.
  ///
  /// In en, this message translates to:
  /// **'Capture your smart devices room by room and receive a privacy assessment with concrete recommendations.'**
  String get welcomeDescription;

  /// No description provided for @welcomePrivacyTitle.
  ///
  /// In en, this message translates to:
  /// **'Private by design'**
  String get welcomePrivacyTitle;

  /// No description provided for @welcomePrivacyDescription.
  ///
  /// In en, this message translates to:
  /// **'We do not collect personal data. Your answers stay on this device and are not sent to the cloud.'**
  String get welcomePrivacyDescription;

  /// No description provided for @stepSelectRooms.
  ///
  /// In en, this message translates to:
  /// **'Select room'**
  String get stepSelectRooms;

  /// No description provided for @stepCaptureDevices.
  ///
  /// In en, this message translates to:
  /// **'Capture devices'**
  String get stepCaptureDevices;

  /// No description provided for @stepAnswerQuestions.
  ///
  /// In en, this message translates to:
  /// **'Answer questions'**
  String get stepAnswerQuestions;

  /// No description provided for @stepGetRisk.
  ///
  /// In en, this message translates to:
  /// **'Get risk profile & recommendations'**
  String get stepGetRisk;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @resume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get resume;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @faq.
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get faq;

  /// No description provided for @roomSelectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Select room'**
  String get roomSelectionTitle;

  /// No description provided for @roomQuestion.
  ///
  /// In en, this message translates to:
  /// **'Which room would you like to check now?'**
  String get roomQuestion;

  /// No description provided for @roomInstruction.
  ///
  /// In en, this message translates to:
  /// **'Tap a room, capture your devices there, then return here to choose the next room.'**
  String get roomInstruction;

  /// No description provided for @results.
  ///
  /// In en, this message translates to:
  /// **'Results'**
  String get results;

  /// No description provided for @alreadyEvaluated.
  ///
  /// In en, this message translates to:
  /// **'Already evaluated'**
  String get alreadyEvaluated;

  /// No description provided for @notCompleted.
  ///
  /// In en, this message translates to:
  /// **'Not completed'**
  String get notCompleted;

  /// No description provided for @addRoom.
  ///
  /// In en, this message translates to:
  /// **'Add room'**
  String get addRoom;

  /// No description provided for @deviceTitlePrefix.
  ///
  /// In en, this message translates to:
  /// **'Devices'**
  String get deviceTitlePrefix;

  /// No description provided for @roomCheck.
  ///
  /// In en, this message translates to:
  /// **'Room check'**
  String get roomCheck;

  /// No description provided for @deviceQuestion.
  ///
  /// In en, this message translates to:
  /// **'Which smart devices do you use in this room?'**
  String get deviceQuestion;

  /// No description provided for @deviceQuestionHint.
  ///
  /// In en, this message translates to:
  /// **'Tap a device to answer its questions.'**
  String get deviceQuestionHint;

  /// No description provided for @noKnownDevices.
  ///
  /// In en, this message translates to:
  /// **'No known devices for this room. You can add your own device.'**
  String get noKnownDevices;

  /// No description provided for @addDevice.
  ///
  /// In en, this message translates to:
  /// **'Add\ndevice'**
  String get addDevice;

  /// No description provided for @noDevice.
  ///
  /// In en, this message translates to:
  /// **'No device'**
  String get noDevice;

  /// No description provided for @nextRoom.
  ///
  /// In en, this message translates to:
  /// **'Next room'**
  String get nextRoom;

  /// No description provided for @deleteDeviceTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete device?'**
  String get deleteDeviceTitle;

  /// No description provided for @deleteDeviceBody.
  ///
  /// In en, this message translates to:
  /// **'This custom device will be deleted. All linked instances will also be removed.'**
  String get deleteDeviceBody;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @noDeviceDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'No devices in this room?'**
  String get noDeviceDialogTitle;

  /// No description provided for @noDeviceDialogBody.
  ///
  /// In en, this message translates to:
  /// **'This room will be completed without devices and will not affect scoring.'**
  String get noDeviceDialogBody;

  /// No description provided for @noDeviceDialogBodyWithExisting.
  ///
  /// In en, this message translates to:
  /// **'Existing device selections for this room will be discarded. This room will be completed without devices and will not affect scoring.'**
  String get noDeviceDialogBodyWithExisting;

  /// No description provided for @questionnaireTitle.
  ///
  /// In en, this message translates to:
  /// **'Questions'**
  String get questionnaireTitle;

  /// No description provided for @connectedDevice.
  ///
  /// In en, this message translates to:
  /// **'Connected device'**
  String get connectedDevice;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @dontKnow.
  ///
  /// In en, this message translates to:
  /// **'I don\'t know'**
  String get dontKnow;

  /// No description provided for @notApplicableForDevice.
  ///
  /// In en, this message translates to:
  /// **'This question does not apply to my device'**
  String get notApplicableForDevice;

  /// No description provided for @languageDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose language'**
  String get languageDialogTitle;

  /// No description provided for @languageNameDe.
  ///
  /// In en, this message translates to:
  /// **'Deutsch'**
  String get languageNameDe;

  /// No description provided for @languageNameCs.
  ///
  /// In en, this message translates to:
  /// **'Čeština'**
  String get languageNameCs;

  /// No description provided for @languageNameEn.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageNameEn;

  /// No description provided for @languageNamePl.
  ///
  /// In en, this message translates to:
  /// **'Polski'**
  String get languageNamePl;

  /// No description provided for @languageNameFr.
  ///
  /// In en, this message translates to:
  /// **'Français'**
  String get languageNameFr;

  /// No description provided for @languageNameNl.
  ///
  /// In en, this message translates to:
  /// **'Nederlands'**
  String get languageNameNl;

  /// No description provided for @languageNameDa.
  ///
  /// In en, this message translates to:
  /// **'Dansk'**
  String get languageNameDa;

  /// No description provided for @currentLanguage.
  ///
  /// In en, this message translates to:
  /// **'Current language'**
  String get currentLanguage;

  /// No description provided for @aboutScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'About the app'**
  String get aboutScreenTitle;

  /// No description provided for @faqScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Frequently Asked Questions'**
  String get faqScreenTitle;

  /// No description provided for @aboutSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Research project on privacy in the smart home'**
  String get aboutSubtitle;

  /// No description provided for @aboutProjectName.
  ///
  /// In en, this message translates to:
  /// **'Simplications'**
  String get aboutProjectName;

  /// No description provided for @aboutPartnerTuChemnitz.
  ///
  /// In en, this message translates to:
  /// **'Chemnitz University of Technology'**
  String get aboutPartnerTuChemnitz;

  /// No description provided for @aboutPartnerHsAnhalt.
  ///
  /// In en, this message translates to:
  /// **'Anhalt University of Applied Sciences'**
  String get aboutPartnerHsAnhalt;

  /// No description provided for @aboutPartnerVzSachsen.
  ///
  /// In en, this message translates to:
  /// **'Consumer Center Saxony'**
  String get aboutPartnerVzSachsen;

  /// No description provided for @aboutWebsiteSimplicationsLabel.
  ///
  /// In en, this message translates to:
  /// **'simplications.tucmi.de'**
  String get aboutWebsiteSimplicationsLabel;

  /// No description provided for @aboutWebsiteSimplicationsUrl.
  ///
  /// In en, this message translates to:
  /// **'https://simplications.tucmi.de'**
  String get aboutWebsiteSimplicationsUrl;

  /// No description provided for @aboutWebsiteTuChemnitzLabel.
  ///
  /// In en, this message translates to:
  /// **'tu-chemnitz.de'**
  String get aboutWebsiteTuChemnitzLabel;

  /// No description provided for @aboutWebsiteTuChemnitzUrl.
  ///
  /// In en, this message translates to:
  /// **'https://www.tu-chemnitz.de'**
  String get aboutWebsiteTuChemnitzUrl;

  /// No description provided for @aboutWebsiteHsAnhaltLabel.
  ///
  /// In en, this message translates to:
  /// **'hs-anhalt.de'**
  String get aboutWebsiteHsAnhaltLabel;

  /// No description provided for @aboutWebsiteHsAnhaltUrl.
  ///
  /// In en, this message translates to:
  /// **'https://www.hs-anhalt.de'**
  String get aboutWebsiteHsAnhaltUrl;

  /// No description provided for @aboutWebsiteVzSachsenLabel.
  ///
  /// In en, this message translates to:
  /// **'verbraucherzentrale-sachsen.de'**
  String get aboutWebsiteVzSachsenLabel;

  /// No description provided for @aboutWebsiteVzSachsenUrl.
  ///
  /// In en, this message translates to:
  /// **'https://www.verbraucherzentrale-sachsen.de'**
  String get aboutWebsiteVzSachsenUrl;

  /// No description provided for @aboutWebsitePlatformPrivacyLabel.
  ///
  /// In en, this message translates to:
  /// **'plattform-privatheit.de'**
  String get aboutWebsitePlatformPrivacyLabel;

  /// No description provided for @aboutWebsitePlatformPrivacyUrl.
  ///
  /// In en, this message translates to:
  /// **'https://www.plattform-privatheit.de'**
  String get aboutWebsitePlatformPrivacyUrl;

  /// No description provided for @aboutWebsiteFundingAgencyLabel.
  ///
  /// In en, this message translates to:
  /// **'bmftr.bund.de'**
  String get aboutWebsiteFundingAgencyLabel;

  /// No description provided for @aboutWebsiteFundingAgencyUrl.
  ///
  /// In en, this message translates to:
  /// **'https://www.bmftr.bund.de'**
  String get aboutWebsiteFundingAgencyUrl;

  /// No description provided for @faqQuestionWhatIs.
  ///
  /// In en, this message translates to:
  /// **'What is Simplications?'**
  String get faqQuestionWhatIs;

  /// No description provided for @faqAnswerWhatIs.
  ///
  /// In en, this message translates to:
  /// **'Simplications is a research project on privacy in the smart home. This app is one part of the project and guides you room by room through your devices with practical recommendations based on your answers.'**
  String get faqAnswerWhatIs;

  /// No description provided for @faqQuestionHowWorks.
  ///
  /// In en, this message translates to:
  /// **'How does the check work?'**
  String get faqQuestionHowWorks;

  /// No description provided for @faqAnswerHowWorks.
  ///
  /// In en, this message translates to:
  /// **'You select a room, add your smart devices, answer device-specific questions, and receive a risk profile with prioritized actions.'**
  String get faqAnswerHowWorks;

  /// No description provided for @faqQuestionNoPolicy.
  ///
  /// In en, this message translates to:
  /// **'Why is there no data protection policy?'**
  String get faqQuestionNoPolicy;

  /// No description provided for @faqAnswerNoPolicy.
  ///
  /// In en, this message translates to:
  /// **'Because we do not collect your data.'**
  String get faqAnswerNoPolicy;

  /// No description provided for @faqQuestionDataStored.
  ///
  /// In en, this message translates to:
  /// **'Where is my data stored?'**
  String get faqQuestionDataStored;

  /// No description provided for @faqAnswerDataStored.
  ///
  /// In en, this message translates to:
  /// **'Your assessment data is stored locally on your device. You can delete all stored data at any time in the About screen.'**
  String get faqAnswerDataStored;

  /// No description provided for @faqQuestionNoDevice.
  ///
  /// In en, this message translates to:
  /// **'What if my device is not listed?'**
  String get faqQuestionNoDevice;

  /// No description provided for @faqAnswerNoDevice.
  ///
  /// In en, this message translates to:
  /// **'You can add custom devices and still complete the check. The recommendations then rely on your provided setup and answers.'**
  String get faqAnswerNoDevice;

  /// No description provided for @faqQuestionRiskMeaning.
  ///
  /// In en, this message translates to:
  /// **'What do low, medium, and high risk mean?'**
  String get faqQuestionRiskMeaning;

  /// No description provided for @faqAnswerRiskMeaning.
  ///
  /// In en, this message translates to:
  /// **'They indicate how strongly your current configuration may expose privacy-related risks. They are guidance levels, not legal or technical certification.'**
  String get faqAnswerRiskMeaning;

  /// No description provided for @faqQuestionLegalAdvice.
  ///
  /// In en, this message translates to:
  /// **'Is this legal advice?'**
  String get faqQuestionLegalAdvice;

  /// No description provided for @faqAnswerLegalAdvice.
  ///
  /// In en, this message translates to:
  /// **'No. Simplications provides practical orientation and recommendations, but does not replace legal or professional security consultation.'**
  String get faqAnswerLegalAdvice;

  /// No description provided for @faqQuestionCanShare.
  ///
  /// In en, this message translates to:
  /// **'Can I share my results?'**
  String get faqQuestionCanShare;

  /// No description provided for @faqAnswerCanShare.
  ///
  /// In en, this message translates to:
  /// **'Yes. You can export and share your summary as text or PDF directly from the results screen.'**
  String get faqAnswerCanShare;

  /// No description provided for @websiteOpenFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not open website.'**
  String get websiteOpenFailed;

  /// No description provided for @deleteAllDataTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete all data?'**
  String get deleteAllDataTitle;

  /// No description provided for @deleteAllDataBody.
  ///
  /// In en, this message translates to:
  /// **'All captured rooms, devices, and answers will be permanently deleted. This action cannot be undone.'**
  String get deleteAllDataBody;

  /// No description provided for @deleteAllDataButton.
  ///
  /// In en, this message translates to:
  /// **'Delete data'**
  String get deleteAllDataButton;

  /// No description provided for @allDataDeleted.
  ///
  /// In en, this message translates to:
  /// **'All saved data has been deleted.'**
  String get allDataDeleted;

  /// No description provided for @projectPartners.
  ///
  /// In en, this message translates to:
  /// **'Project partners'**
  String get projectPartners;

  /// No description provided for @coordinationFunding.
  ///
  /// In en, this message translates to:
  /// **'Coordination & Funding'**
  String get coordinationFunding;

  /// No description provided for @coordination.
  ///
  /// In en, this message translates to:
  /// **'Coordination'**
  String get coordination;

  /// No description provided for @platformPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Platform Privacy'**
  String get platformPrivacy;

  /// No description provided for @fundingAgency.
  ///
  /// In en, this message translates to:
  /// **'Funding body'**
  String get fundingAgency;

  /// No description provided for @fundingAgencyValue.
  ///
  /// In en, this message translates to:
  /// **'German Federal Ministry of Research, Technology and Space\nGrant 16KIS1868K'**
  String get fundingAgencyValue;

  /// No description provided for @website.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get website;

  /// No description provided for @dangerZone.
  ///
  /// In en, this message translates to:
  /// **'Danger zone'**
  String get dangerZone;

  /// No description provided for @dangerZoneWarning.
  ///
  /// In en, this message translates to:
  /// **'Warning: This action permanently removes all saved app data.'**
  String get dangerZoneWarning;

  /// No description provided for @expertModeTitle.
  ///
  /// In en, this message translates to:
  /// **'Expert mode'**
  String get expertModeTitle;

  /// No description provided for @expertModeToggleLabel.
  ///
  /// In en, this message translates to:
  /// **'Enable detailed expert mode'**
  String get expertModeToggleLabel;

  /// No description provided for @expertModeToggleHint.
  ///
  /// In en, this message translates to:
  /// **'Same workflow, but much more detailed device questions (e.g., retention duration, access control, third-party sharing).'**
  String get expertModeToggleHint;

  /// No description provided for @expertModeSourcesHint.
  ///
  /// In en, this message translates to:
  /// **'Methodologically inspired by the following research projects:'**
  String get expertModeSourcesHint;

  /// No description provided for @expertModeSourceCmuLabel.
  ///
  /// In en, this message translates to:
  /// **'CMU IoT Security & Privacy Label (CISPL)'**
  String get expertModeSourceCmuLabel;

  /// No description provided for @expertModeSourceCmuUrl.
  ///
  /// In en, this message translates to:
  /// **'https://iotsecurityprivacy.org/labels'**
  String get expertModeSourceCmuUrl;

  /// No description provided for @expertModeSourceUnboxingLabel.
  ///
  /// In en, this message translates to:
  /// **'Unboxing.IoT.Privacy (community platform)'**
  String get expertModeSourceUnboxingLabel;

  /// No description provided for @expertModeSourceUnboxingUrl.
  ///
  /// In en, this message translates to:
  /// **'https://iot-privacy.info/project/'**
  String get expertModeSourceUnboxingUrl;

  /// No description provided for @expertModeQuestionnaireHint.
  ///
  /// In en, this message translates to:
  /// **'Expert mode: these questions deepen data-practice and governance coverage (including retention, access control, and third-party sharing) based on CMU IoT Label and Unboxing.IoT.Privacy approaches.'**
  String get expertModeQuestionnaireHint;

  /// No description provided for @roomDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete room?'**
  String get roomDeleteTitle;

  /// No description provided for @roomDeleteBody.
  ///
  /// In en, this message translates to:
  /// **'This custom room will be deleted. All linked devices will also be removed.'**
  String get roomDeleteBody;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @addRoomDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Add new room'**
  String get addRoomDialogTitle;

  /// No description provided for @roomName.
  ///
  /// In en, this message translates to:
  /// **'Room name'**
  String get roomName;

  /// No description provided for @roomNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Living room, Garage'**
  String get roomNameHint;

  /// No description provided for @chooseIcon.
  ///
  /// In en, this message translates to:
  /// **'Choose icon:'**
  String get chooseIcon;

  /// No description provided for @addDeviceDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Add new device'**
  String get addDeviceDialogTitle;

  /// No description provided for @deviceName.
  ///
  /// In en, this message translates to:
  /// **'Device name'**
  String get deviceName;

  /// No description provided for @deviceNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. My smart speaker'**
  String get deviceNameHint;

  /// No description provided for @baseRiskLabel.
  ///
  /// In en, this message translates to:
  /// **'Base risk score (0-100)'**
  String get baseRiskLabel;

  /// No description provided for @baseRiskHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 30 (low) to 60 (high)'**
  String get baseRiskHint;

  /// No description provided for @hasCamera.
  ///
  /// In en, this message translates to:
  /// **'Has camera?'**
  String get hasCamera;

  /// No description provided for @hasMicrophone.
  ///
  /// In en, this message translates to:
  /// **'Has microphone?'**
  String get hasMicrophone;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @microphone.
  ///
  /// In en, this message translates to:
  /// **'Microphone'**
  String get microphone;

  /// No description provided for @summaryTitle.
  ///
  /// In en, this message translates to:
  /// **'Your result'**
  String get summaryTitle;

  /// No description provided for @shareResult.
  ///
  /// In en, this message translates to:
  /// **'Share result'**
  String get shareResult;

  /// No description provided for @shareAsText.
  ///
  /// In en, this message translates to:
  /// **'Share as text'**
  String get shareAsText;

  /// No description provided for @shareAsPdf.
  ///
  /// In en, this message translates to:
  /// **'Share as PDF'**
  String get shareAsPdf;

  /// No description provided for @restart.
  ///
  /// In en, this message translates to:
  /// **'Restart'**
  String get restart;

  /// No description provided for @noDevicesCaptured.
  ///
  /// In en, this message translates to:
  /// **'No devices captured.'**
  String get noDevicesCaptured;

  /// No description provided for @noDevicesHint.
  ///
  /// In en, this message translates to:
  /// **'Restart and add devices to receive an assessment.'**
  String get noDevicesHint;

  /// No description provided for @highRisk.
  ///
  /// In en, this message translates to:
  /// **'High risk'**
  String get highRisk;

  /// No description provided for @mediumRisk.
  ///
  /// In en, this message translates to:
  /// **'Medium risk'**
  String get mediumRisk;

  /// No description provided for @lowRisk.
  ///
  /// In en, this message translates to:
  /// **'Low risk'**
  String get lowRisk;

  /// No description provided for @exportFailed.
  ///
  /// In en, this message translates to:
  /// **'Export failed'**
  String get exportFailed;

  /// No description provided for @summaryShareSubject.
  ///
  /// In en, this message translates to:
  /// **'Simplications result'**
  String get summaryShareSubject;

  /// No description provided for @summarySharePdfText.
  ///
  /// In en, this message translates to:
  /// **'Simplications report as PDF'**
  String get summarySharePdfText;

  /// No description provided for @summaryPdfFileName.
  ///
  /// In en, this message translates to:
  /// **'simplications-result.pdf'**
  String get summaryPdfFileName;

  /// No description provided for @overview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overview;

  /// No description provided for @evaluatedDevices.
  ///
  /// In en, this message translates to:
  /// **'Evaluated devices'**
  String get evaluatedDevices;

  /// No description provided for @skippedDevicesHint.
  ///
  /// In en, this message translates to:
  /// **'{count} devices skipped because the questionnaire was not completed.'**
  String skippedDevicesHint(Object count);

  /// No description provided for @resumeIncompleteDevice.
  ///
  /// In en, this message translates to:
  /// **'Continue with first incomplete device'**
  String get resumeIncompleteDevice;

  /// No description provided for @overallRisk.
  ///
  /// In en, this message translates to:
  /// **'Overall risk'**
  String get overallRisk;

  /// No description provided for @generalRecommendations.
  ///
  /// In en, this message translates to:
  /// **'General recommendations'**
  String get generalRecommendations;

  /// No description provided for @generalRecommendationsHint.
  ///
  /// In en, this message translates to:
  /// **'These measures apply to your whole smart home regardless of individual devices.'**
  String get generalRecommendationsHint;

  /// No description provided for @fullCatalog.
  ///
  /// In en, this message translates to:
  /// **'Full action catalog'**
  String get fullCatalog;

  /// No description provided for @catalogButton.
  ///
  /// In en, this message translates to:
  /// **'Open full action catalog'**
  String get catalogButton;

  /// No description provided for @risk.
  ///
  /// In en, this message translates to:
  /// **'Risk'**
  String get risk;

  /// No description provided for @note.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get note;

  /// No description provided for @recommendations.
  ///
  /// In en, this message translates to:
  /// **'Recommendations'**
  String get recommendations;

  /// No description provided for @urgent.
  ///
  /// In en, this message translates to:
  /// **'Urgent'**
  String get urgent;

  /// No description provided for @recommended.
  ///
  /// In en, this message translates to:
  /// **'Recommended'**
  String get recommended;

  /// No description provided for @optional.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get optional;

  /// No description provided for @social.
  ///
  /// In en, this message translates to:
  /// **'Social'**
  String get social;

  /// No description provided for @technical.
  ///
  /// In en, this message translates to:
  /// **'Technical'**
  String get technical;

  /// No description provided for @security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// No description provided for @smartHomePrivacyHeader.
  ///
  /// In en, this message translates to:
  /// **'Your smart home privacy'**
  String get smartHomePrivacyHeader;

  /// No description provided for @devicesRated.
  ///
  /// In en, this message translates to:
  /// **'rated devices'**
  String get devicesRated;

  /// No description provided for @howRiskCalculated.
  ///
  /// In en, this message translates to:
  /// **'How is risk calculated?'**
  String get howRiskCalculated;

  /// No description provided for @totalScore.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get totalScore;

  /// No description provided for @catalogSnackBarPrefix.
  ///
  /// In en, this message translates to:
  /// **'Catalog'**
  String get catalogSnackBarPrefix;

  /// No description provided for @reportExportedAt.
  ///
  /// In en, this message translates to:
  /// **'Exported at'**
  String get reportExportedAt;

  /// No description provided for @noActionLow.
  ///
  /// In en, this message translates to:
  /// **'Everything is fine - no actions required.'**
  String get noActionLow;

  /// No description provided for @noActionMedium.
  ///
  /// In en, this message translates to:
  /// **'No concrete actions can currently be derived from your answers, but a medium residual risk remains.'**
  String get noActionMedium;

  /// No description provided for @noActionHigh.
  ///
  /// In en, this message translates to:
  /// **'No concrete actions can currently be derived from your answers, but a high residual risk remains.'**
  String get noActionHigh;

  /// No description provided for @overallLow.
  ///
  /// In en, this message translates to:
  /// **'Well done! Your devices are mostly configured securely. Still review the general recommendations.'**
  String get overallLow;

  /// No description provided for @overallMedium.
  ///
  /// In en, this message translates to:
  /// **'There is room for improvement. Review the recommendations for each device.'**
  String get overallMedium;

  /// No description provided for @overallHigh.
  ///
  /// In en, this message translates to:
  /// **'Several devices have significant privacy/data-protection risks. Please implement high-priority measures promptly.'**
  String get overallHigh;

  /// No description provided for @dontKnowHint.
  ///
  /// In en, this message translates to:
  /// **' {count, plural, one {1 answer was marked as \"I don\'t know\" - take time to understand your device settings better.} other {{count} answers were marked as \"I don\'t know\" - take time to understand your device settings better.}}'**
  String dontKnowHint(num count);

  /// No description provided for @room_living.
  ///
  /// In en, this message translates to:
  /// **'Living room'**
  String get room_living;

  /// No description provided for @room_kitchen.
  ///
  /// In en, this message translates to:
  /// **'Kitchen'**
  String get room_kitchen;

  /// No description provided for @room_bedroom.
  ///
  /// In en, this message translates to:
  /// **'Bedroom'**
  String get room_bedroom;

  /// No description provided for @room_child_bedroom.
  ///
  /// In en, this message translates to:
  /// **'Child\'s bedroom'**
  String get room_child_bedroom;

  /// No description provided for @room_bathroom.
  ///
  /// In en, this message translates to:
  /// **'Bathroom'**
  String get room_bathroom;

  /// No description provided for @room_office.
  ///
  /// In en, this message translates to:
  /// **'Office'**
  String get room_office;

  /// No description provided for @room_hallway.
  ///
  /// In en, this message translates to:
  /// **'Hallway / Entrance'**
  String get room_hallway;

  /// No description provided for @room_garden.
  ///
  /// In en, this message translates to:
  /// **'Garden / Outdoor area'**
  String get room_garden;

  /// No description provided for @room_basement.
  ///
  /// In en, this message translates to:
  /// **'Basement / Pantry'**
  String get room_basement;

  /// No description provided for @room_whole_home.
  ///
  /// In en, this message translates to:
  /// **'Entire home'**
  String get room_whole_home;

  /// No description provided for @device_simple_sensor.
  ///
  /// In en, this message translates to:
  /// **'Sensor (e.g., door, motion, temperature, humidity, or light sensor)'**
  String get device_simple_sensor;

  /// No description provided for @device_humidity_sensor.
  ///
  /// In en, this message translates to:
  /// **'Humidity sensor'**
  String get device_humidity_sensor;

  /// No description provided for @device_temperature_sensor.
  ///
  /// In en, this message translates to:
  /// **'Temperature sensor'**
  String get device_temperature_sensor;

  /// No description provided for @device_light_sensor.
  ///
  /// In en, this message translates to:
  /// **'Light sensor'**
  String get device_light_sensor;

  /// No description provided for @device_smart_speaker.
  ///
  /// In en, this message translates to:
  /// **'Smart speaker / voice assistant'**
  String get device_smart_speaker;

  /// No description provided for @device_smart_display.
  ///
  /// In en, this message translates to:
  /// **'Smart display (e.g., Nest Hub)'**
  String get device_smart_display;

  /// No description provided for @device_smart_tv.
  ///
  /// In en, this message translates to:
  /// **'Smart TV'**
  String get device_smart_tv;

  /// No description provided for @device_indoor_camera.
  ///
  /// In en, this message translates to:
  /// **'Smart indoor camera'**
  String get device_indoor_camera;

  /// No description provided for @device_outdoor_camera.
  ///
  /// In en, this message translates to:
  /// **'Smart outdoor camera'**
  String get device_outdoor_camera;

  /// No description provided for @device_doorbell_camera.
  ///
  /// In en, this message translates to:
  /// **'Smart doorbell with camera'**
  String get device_doorbell_camera;

  /// No description provided for @device_baby_monitor.
  ///
  /// In en, this message translates to:
  /// **'Baby monitor / baby camera'**
  String get device_baby_monitor;

  /// No description provided for @device_robot_vacuum.
  ///
  /// In en, this message translates to:
  /// **'Robot vacuum'**
  String get device_robot_vacuum;

  /// No description provided for @device_smart_fridge.
  ///
  /// In en, this message translates to:
  /// **'Smart fridge'**
  String get device_smart_fridge;

  /// No description provided for @device_smart_oven.
  ///
  /// In en, this message translates to:
  /// **'Smart oven / stove'**
  String get device_smart_oven;

  /// No description provided for @device_smart_coffee.
  ///
  /// In en, this message translates to:
  /// **'Smart coffee machine'**
  String get device_smart_coffee;

  /// No description provided for @device_smart_washing.
  ///
  /// In en, this message translates to:
  /// **'Smart washer / dryer'**
  String get device_smart_washing;

  /// No description provided for @device_smart_thermostat.
  ///
  /// In en, this message translates to:
  /// **'Smart thermostat / heating control'**
  String get device_smart_thermostat;

  /// No description provided for @device_smart_plug.
  ///
  /// In en, this message translates to:
  /// **'Smart plug'**
  String get device_smart_plug;

  /// No description provided for @device_smart_light.
  ///
  /// In en, this message translates to:
  /// **'Smart lighting'**
  String get device_smart_light;

  /// No description provided for @device_smart_lock.
  ///
  /// In en, this message translates to:
  /// **'Smart door lock'**
  String get device_smart_lock;

  /// No description provided for @device_smart_blind.
  ///
  /// In en, this message translates to:
  /// **'Smart blind / shutter'**
  String get device_smart_blind;

  /// No description provided for @device_smart_toy.
  ///
  /// In en, this message translates to:
  /// **'Smart toy'**
  String get device_smart_toy;

  /// No description provided for @device_smart_router.
  ///
  /// In en, this message translates to:
  /// **'Smart router / mesh system'**
  String get device_smart_router;

  /// No description provided for @device_smart_hub.
  ///
  /// In en, this message translates to:
  /// **'Smart home hub (e.g., Homey, Home Assistant)'**
  String get device_smart_hub;

  /// No description provided for @device_smart_meter.
  ///
  /// In en, this message translates to:
  /// **'Intelligent electricity meter / smart meter'**
  String get device_smart_meter;

  /// No description provided for @device_smart_irrigation.
  ///
  /// In en, this message translates to:
  /// **'Smart irrigation system'**
  String get device_smart_irrigation;

  /// No description provided for @device_smart_printer.
  ///
  /// In en, this message translates to:
  /// **'Smart printer'**
  String get device_smart_printer;

  /// No description provided for @q_password_text.
  ///
  /// In en, this message translates to:
  /// **'Have you changed the default password of the device or its linked account?'**
  String get q_password_text;

  /// No description provided for @q_password_hint.
  ///
  /// In en, this message translates to:
  /// **'Default passwords are often publicly known and easy to crack.'**
  String get q_password_hint;

  /// No description provided for @q_updates_text.
  ///
  /// In en, this message translates to:
  /// **'Are automatic security updates enabled for the device?'**
  String get q_updates_text;

  /// No description provided for @q_updates_hint.
  ///
  /// In en, this message translates to:
  /// **'Updates close known security vulnerabilities promptly.'**
  String get q_updates_hint;

  /// No description provided for @q_network_text.
  ///
  /// In en, this message translates to:
  /// **'Is the device connected to a separate smart home or IoT Wi-Fi network?'**
  String get q_network_text;

  /// No description provided for @q_network_hint.
  ///
  /// In en, this message translates to:
  /// **'A dedicated network for smart devices protects your main home network.'**
  String get q_network_hint;

  /// No description provided for @q_informed_text.
  ///
  /// In en, this message translates to:
  /// **'Are all people in the household informed about this device and its function?'**
  String get q_informed_text;

  /// No description provided for @q_informed_hint.
  ///
  /// In en, this message translates to:
  /// **'All household members should know what data the device captures.'**
  String get q_informed_hint;

  /// No description provided for @q_permissions_text.
  ///
  /// In en, this message translates to:
  /// **'Have you disabled unnecessary app permissions (e.g., location, contacts)?'**
  String get q_permissions_text;

  /// No description provided for @q_permissions_hint.
  ///
  /// In en, this message translates to:
  /// **'Only permissions that are truly needed should be enabled.'**
  String get q_permissions_hint;

  /// No description provided for @q_mic_active_text.
  ///
  /// In en, this message translates to:
  /// **'Do you deactivate the microphone when you are not actively using it?'**
  String get q_mic_active_text;

  /// No description provided for @q_mic_active_hint.
  ///
  /// In en, this message translates to:
  /// **'Smart speakers and devices with microphones can be activated unintentionally.'**
  String get q_mic_active_hint;

  /// No description provided for @q_camera_consent_text.
  ///
  /// In en, this message translates to:
  /// **'Does the camera only record areas for which everyone affected has given their consent?'**
  String get q_camera_consent_text;

  /// No description provided for @q_camera_consent_hint.
  ///
  /// In en, this message translates to:
  /// **'Cameras in communal or private areas require the consent of all residents.'**
  String get q_camera_consent_hint;

  /// No description provided for @q_sensor_frequency_text.
  ///
  /// In en, this message translates to:
  /// **'Can you reduce the sensor measurement interval (e.g., measure less frequently)?'**
  String get q_sensor_frequency_text;

  /// No description provided for @q_sensor_frequency_hint.
  ///
  /// In en, this message translates to:
  /// **'A lower measurement frequency produces less data and limits inferences about your behavior.'**
  String get q_sensor_frequency_hint;

  /// No description provided for @q_sensor_data_deletion_text.
  ///
  /// In en, this message translates to:
  /// **'Are older measurement values deleted automatically or on request?'**
  String get q_sensor_data_deletion_text;

  /// No description provided for @q_sensor_data_deletion_hint.
  ///
  /// In en, this message translates to:
  /// **'Old historical data should not be stored permanently. Check retention settings.'**
  String get q_sensor_data_deletion_hint;

  /// No description provided for @q_sensor_granularity_text.
  ///
  /// In en, this message translates to:
  /// **'Does the system show sensor data only in aggregated form (e.g., daily instead of minute values)?'**
  String get q_sensor_granularity_text;

  /// No description provided for @q_sensor_granularity_hint.
  ///
  /// In en, this message translates to:
  /// **'Less granular views help prevent inferences about precise presence or behavior patterns.'**
  String get q_sensor_granularity_hint;

  /// No description provided for @q_sensor_local_text.
  ///
  /// In en, this message translates to:
  /// **'Is measurement data processed and stored locally without being transferred to the cloud?'**
  String get q_sensor_local_text;

  /// No description provided for @q_sensor_local_hint.
  ///
  /// In en, this message translates to:
  /// **'Local processing prevents the vendor from accessing your measurement data.'**
  String get q_sensor_local_hint;

  /// No description provided for @q_voice_history_text.
  ///
  /// In en, this message translates to:
  /// **'Can you delete voice recordings from device history or disable this feature?'**
  String get q_voice_history_text;

  /// No description provided for @q_voice_history_hint.
  ///
  /// In en, this message translates to:
  /// **'BSI recommendation: Minimize recording retention or delete recordings regularly.'**
  String get q_voice_history_hint;

  /// No description provided for @q_voice_local_text.
  ///
  /// In en, this message translates to:
  /// **'Is voice processing performed partly on the device locally?'**
  String get q_voice_local_text;

  /// No description provided for @q_voice_local_hint.
  ///
  /// In en, this message translates to:
  /// **'Local processing reduces the amount of data sent to the cloud.'**
  String get q_voice_local_hint;

  /// No description provided for @q_skills_permissions_text.
  ///
  /// In en, this message translates to:
  /// **'Do you regularly review which skills have access to your account?'**
  String get q_skills_permissions_text;

  /// No description provided for @q_skills_permissions_hint.
  ///
  /// In en, this message translates to:
  /// **'Third-party skills can access sensitive data. Enable only necessary skills.'**
  String get q_skills_permissions_hint;

  /// No description provided for @q_video_encryption_text.
  ///
  /// In en, this message translates to:
  /// **'Is video recording and transmission encrypted end-to-end?'**
  String get q_video_encryption_text;

  /// No description provided for @q_video_encryption_hint.
  ///
  /// In en, this message translates to:
  /// **'BSI recommendation: Encrypted connections prevent interception and data theft in transit.'**
  String get q_video_encryption_hint;

  /// No description provided for @q_video_storage_text.
  ///
  /// In en, this message translates to:
  /// **'Are recordings stored locally (not only in the vendor cloud)?'**
  String get q_video_storage_text;

  /// No description provided for @q_video_storage_hint.
  ///
  /// In en, this message translates to:
  /// **'Local storage gives you more control over your data; cloud-only storage depends on vendor security.'**
  String get q_video_storage_hint;

  /// No description provided for @q_sharing_restrictions_text.
  ///
  /// In en, this message translates to:
  /// **'Can you control who can access live view and recordings?'**
  String get q_sharing_restrictions_text;

  /// No description provided for @q_sharing_restrictions_hint.
  ///
  /// In en, this message translates to:
  /// **'You should be able to precisely control access to video recordings.'**
  String get q_sharing_restrictions_hint;

  /// No description provided for @q_motion_detection_text.
  ///
  /// In en, this message translates to:
  /// **'Can you disable or schedule motion detection when you are at home?'**
  String get q_motion_detection_text;

  /// No description provided for @q_motion_detection_hint.
  ///
  /// In en, this message translates to:
  /// **'BSI recommendation: Avoiding unnecessary recordings reduces data volume and misuse risk.'**
  String get q_motion_detection_hint;

  /// No description provided for @q_account_required_text.
  ///
  /// In en, this message translates to:
  /// **'Can you use the device without a mandatory online account?'**
  String get q_account_required_text;

  /// No description provided for @q_account_required_hint.
  ///
  /// In en, this message translates to:
  /// **'Mandatory accounts enable ad tracking and storage of viewing habits. Account-free use protects privacy.'**
  String get q_account_required_hint;

  /// No description provided for @q_tracking_disabled_text.
  ///
  /// In en, this message translates to:
  /// **'Can you completely disable advertising and tracking features?'**
  String get q_tracking_disabled_text;

  /// No description provided for @q_tracking_disabled_hint.
  ///
  /// In en, this message translates to:
  /// **'Smart TVs often collect viewing habit data. Look for privacy settings.'**
  String get q_tracking_disabled_hint;

  /// No description provided for @q_local_mode_text.
  ///
  /// In en, this message translates to:
  /// **'Can you use the device via HDMI or local sources without internet?'**
  String get q_local_mode_text;

  /// No description provided for @q_local_mode_hint.
  ///
  /// In en, this message translates to:
  /// **'Offline use protects usage data from being sent to the vendor.'**
  String get q_local_mode_hint;

  /// No description provided for @q_data_collection_text.
  ///
  /// In en, this message translates to:
  /// **'Do temperature history and schedules stay on-device (not sent to the vendor)?'**
  String get q_data_collection_text;

  /// No description provided for @q_data_collection_hint.
  ///
  /// In en, this message translates to:
  /// **'History can reveal presence patterns and habits. Local storage reduces unwanted analysis.'**
  String get q_data_collection_hint;

  /// No description provided for @q_offline_control_text.
  ///
  /// In en, this message translates to:
  /// **'Can you operate the thermostat offline (without internet)?'**
  String get q_offline_control_text;

  /// No description provided for @q_offline_control_hint.
  ///
  /// In en, this message translates to:
  /// **'Offline operation or local automation protects data from cloud access.'**
  String get q_offline_control_hint;

  /// No description provided for @q_family_access_text.
  ///
  /// In en, this message translates to:
  /// **'Can you control who may adjust heating (e.g., restrict guests)?'**
  String get q_family_access_text;

  /// No description provided for @q_family_access_hint.
  ///
  /// In en, this message translates to:
  /// **'Household members should have control without visitors changing everything.'**
  String get q_family_access_hint;

  /// No description provided for @q_local_control_text.
  ///
  /// In en, this message translates to:
  /// **'Can automations run locally without internet?'**
  String get q_local_control_text;

  /// No description provided for @q_local_control_hint.
  ///
  /// In en, this message translates to:
  /// **'Local scenes and schedules protect your privacy better.'**
  String get q_local_control_hint;

  /// No description provided for @q_usage_tracking_text.
  ///
  /// In en, this message translates to:
  /// **'Have you disabled or limited vendor collection of switching patterns and usage times?'**
  String get q_usage_tracking_text;

  /// No description provided for @q_usage_tracking_hint.
  ///
  /// In en, this message translates to:
  /// **'Usage patterns can reveal presence and habits. Check app privacy settings.'**
  String get q_usage_tracking_hint;

  /// No description provided for @q_offline_fallback_text.
  ///
  /// In en, this message translates to:
  /// **'Do devices still work if internet or app connection fails?'**
  String get q_offline_fallback_text;

  /// No description provided for @q_offline_fallback_hint.
  ///
  /// In en, this message translates to:
  /// **'Reliable local operation is important for daily use and privacy.'**
  String get q_offline_fallback_hint;

  /// No description provided for @q_offline_unlock_text.
  ///
  /// In en, this message translates to:
  /// **'Can you unlock the lock offline (e.g., with code or key)?'**
  String get q_offline_unlock_text;

  /// No description provided for @q_offline_unlock_hint.
  ///
  /// In en, this message translates to:
  /// **'Backup options prevent lockout during internet or power outages.'**
  String get q_offline_unlock_hint;

  /// No description provided for @q_access_logging_text.
  ///
  /// In en, this message translates to:
  /// **'Can you track who opened the lock and when?'**
  String get q_access_logging_text;

  /// No description provided for @q_access_logging_hint.
  ///
  /// In en, this message translates to:
  /// **'An access log helps you detect suspicious activity.'**
  String get q_access_logging_hint;

  /// No description provided for @q_two_factor_text.
  ///
  /// In en, this message translates to:
  /// **'Is two-factor authentication (2FA) available for the lock account?'**
  String get q_two_factor_text;

  /// No description provided for @q_two_factor_hint.
  ///
  /// In en, this message translates to:
  /// **'BSI recommendation: 2FA protects your account from unauthorized remote access.'**
  String get q_two_factor_hint;

  /// No description provided for @q_map_privacy_text.
  ///
  /// In en, this message translates to:
  /// **'Are created floor plans stored exclusively on the device locally?'**
  String get q_map_privacy_text;

  /// No description provided for @q_map_privacy_hint.
  ///
  /// In en, this message translates to:
  /// **'Home floor plans are sensitive information and should not be sent to the vendor.'**
  String get q_map_privacy_hint;

  /// No description provided for @q_cloud_required_text.
  ///
  /// In en, this message translates to:
  /// **'Does floor-plan navigation work without cloud connection?'**
  String get q_cloud_required_text;

  /// No description provided for @q_cloud_required_hint.
  ///
  /// In en, this message translates to:
  /// **'Devices with local navigation are more privacy-friendly because no room data is uploaded.'**
  String get q_cloud_required_hint;

  /// No description provided for @q_vision_data_text.
  ///
  /// In en, this message translates to:
  /// **'If the robot uses cameras: are camera images used locally only for navigation (no storing or transfer)?'**
  String get q_vision_data_text;

  /// No description provided for @q_vision_data_hint.
  ///
  /// In en, this message translates to:
  /// **'Camera images should be processed locally for navigation and neither stored nor sent to the vendor.'**
  String get q_vision_data_hint;

  /// No description provided for @q_parental_control_text.
  ///
  /// In en, this message translates to:
  /// **'Are there parental control features to manage the toy?'**
  String get q_parental_control_text;

  /// No description provided for @q_parental_control_hint.
  ///
  /// In en, this message translates to:
  /// **'Parental controls should allow restricting contacts and features.'**
  String get q_parental_control_hint;

  /// No description provided for @q_child_data_limits_text.
  ///
  /// In en, this message translates to:
  /// **'Can you limit which personal data the toy collects?'**
  String get q_child_data_limits_text;

  /// No description provided for @q_child_data_limits_hint.
  ///
  /// In en, this message translates to:
  /// **'Child-focused devices should collect and store minimal data.'**
  String get q_child_data_limits_hint;

  /// No description provided for @q_recording_disable_text.
  ///
  /// In en, this message translates to:
  /// **'Can you disable audio and video recording on the device?'**
  String get q_recording_disable_text;

  /// No description provided for @q_recording_disable_hint.
  ///
  /// In en, this message translates to:
  /// **'BSI recommendation: Recordings of children should only be possible with explicit control.'**
  String get q_recording_disable_hint;

  /// No description provided for @q_expert_data_retention_duration_text.
  ///
  /// In en, this message translates to:
  /// **'Is the retention duration for your personal data explicitly defined and limited to what is necessary?'**
  String get q_expert_data_retention_duration_text;

  /// No description provided for @q_expert_data_retention_duration_hint.
  ///
  /// In en, this message translates to:
  /// **'Inspired by the CMU IoT Security & Privacy Label and Unboxing.IoT.Privacy: short, clear retention periods reduce risk.'**
  String get q_expert_data_retention_duration_hint;

  /// No description provided for @q_expert_access_control_granular_text.
  ///
  /// In en, this message translates to:
  /// **'Can you control access rights granularly (roles, separate accounts, no shared default logins)?'**
  String get q_expert_access_control_granular_text;

  /// No description provided for @q_expert_access_control_granular_hint.
  ///
  /// In en, this message translates to:
  /// **'Granular access control reduces the risk of unauthorized access and misuse.'**
  String get q_expert_access_control_granular_hint;

  /// No description provided for @q_expert_third_party_sharing_limited_text.
  ///
  /// In en, this message translates to:
  /// **'Is third-party sharing disabled or clearly limited to necessary services?'**
  String get q_expert_third_party_sharing_limited_text;

  /// No description provided for @q_expert_third_party_sharing_limited_hint.
  ///
  /// In en, this message translates to:
  /// **'Check privacy and account settings to see whether data is sent to advertising, analytics, or partner services.'**
  String get q_expert_third_party_sharing_limited_hint;

  /// No description provided for @q_expert_data_sale_disabled_text.
  ///
  /// In en, this message translates to:
  /// **'Is the sale of your data excluded (or actively disabled, where possible)?'**
  String get q_expert_data_sale_disabled_text;

  /// No description provided for @q_expert_data_sale_disabled_hint.
  ///
  /// In en, this message translates to:
  /// **'An explicit \"no data sale\" option is a strong privacy signal.'**
  String get q_expert_data_sale_disabled_hint;

  /// No description provided for @q_expert_update_support_window_text.
  ///
  /// In en, this message translates to:
  /// **'Is it known how long the vendor guarantees security updates?'**
  String get q_expert_update_support_window_text;

  /// No description provided for @q_expert_update_support_window_hint.
  ///
  /// In en, this message translates to:
  /// **'A transparent update commitment reduces long-term security and privacy risks.'**
  String get q_expert_update_support_window_hint;

  /// No description provided for @q_expert_vulnerability_process_text.
  ///
  /// In en, this message translates to:
  /// **'Is there a documented process for reporting and fixing vulnerabilities?'**
  String get q_expert_vulnerability_process_text;

  /// No description provided for @q_expert_vulnerability_process_hint.
  ///
  /// In en, this message translates to:
  /// **'Prefer vendors that provide responsible disclosure policies or clear security contact information.'**
  String get q_expert_vulnerability_process_hint;

  /// No description provided for @q_expert_offline_functionality_text.
  ///
  /// In en, this message translates to:
  /// **'Does the device remain meaningfully usable with limited internet connectivity?'**
  String get q_expert_offline_functionality_text;

  /// No description provided for @q_expert_offline_functionality_hint.
  ///
  /// In en, this message translates to:
  /// **'More offline functionality often means less continuous data transfer to the cloud.'**
  String get q_expert_offline_functionality_hint;

  /// No description provided for @q_expert_bystander_transparency_text.
  ///
  /// In en, this message translates to:
  /// **'Are people nearby transparently informed (for example via visibility, notices, clear recording indicators)?'**
  String get q_expert_bystander_transparency_text;

  /// No description provided for @q_expert_bystander_transparency_hint.
  ///
  /// In en, this message translates to:
  /// **'This addresses bystander privacy and is highlighted in Unboxing.IoT.Privacy as a key challenge.'**
  String get q_expert_bystander_transparency_hint;

  /// No description provided for @q_expert_child_data_protection_text.
  ///
  /// In en, this message translates to:
  /// **'Are child-data protections active (minimization, no profiling, restrictive sharing)?'**
  String get q_expert_child_data_protection_text;

  /// No description provided for @q_expert_child_data_protection_hint.
  ///
  /// In en, this message translates to:
  /// **'Devices in child-related contexts require especially strict privacy safeguards.'**
  String get q_expert_child_data_protection_hint;

  /// No description provided for @q_expert_access_revocation_text.
  ///
  /// In en, this message translates to:
  /// **'Can digital keys/access rights be revoked quickly and individually?'**
  String get q_expert_access_revocation_text;

  /// No description provided for @q_expert_access_revocation_hint.
  ///
  /// In en, this message translates to:
  /// **'Fast revocation is crucial when devices are shared or users change.'**
  String get q_expert_access_revocation_hint;

  /// No description provided for @a_password_title.
  ///
  /// In en, this message translates to:
  /// **'Change default password'**
  String get a_password_title;

  /// No description provided for @a_password_desc.
  ///
  /// In en, this message translates to:
  /// **'Replace the default password with a strong, unique password. Use a password manager.'**
  String get a_password_desc;

  /// No description provided for @a_updates_title.
  ///
  /// In en, this message translates to:
  /// **'Enable automatic updates'**
  String get a_updates_title;

  /// No description provided for @a_updates_desc.
  ///
  /// In en, this message translates to:
  /// **'Enable automatic security updates in device or app settings.'**
  String get a_updates_desc;

  /// No description provided for @a_network_title.
  ///
  /// In en, this message translates to:
  /// **'Set up separate IoT Wi-Fi'**
  String get a_network_title;

  /// No description provided for @a_network_desc.
  ///
  /// In en, this message translates to:
  /// **'Set up a dedicated Wi-Fi network for smart home devices, for example with your router\'s guest network.'**
  String get a_network_desc;

  /// No description provided for @a_informed_title.
  ///
  /// In en, this message translates to:
  /// **'Inform household members'**
  String get a_informed_title;

  /// No description provided for @a_informed_desc.
  ///
  /// In en, this message translates to:
  /// **'Inform all residents about what data the device collects, who has access, and how it can be disabled.'**
  String get a_informed_desc;

  /// No description provided for @a_permissions_title.
  ///
  /// In en, this message translates to:
  /// **'Restrict app permissions'**
  String get a_permissions_title;

  /// No description provided for @a_permissions_desc.
  ///
  /// In en, this message translates to:
  /// **'Check companion-app permissions in phone settings and disable unnecessary ones.'**
  String get a_permissions_desc;

  /// No description provided for @a_camera_consent_title.
  ///
  /// In en, this message translates to:
  /// **'Align camera positioning with residents'**
  String get a_camera_consent_title;

  /// No description provided for @a_camera_consent_desc.
  ///
  /// In en, this message translates to:
  /// **'Obtain consent from everyone affected. The camera must not record areas without consent.'**
  String get a_camera_consent_desc;

  /// No description provided for @a_mic_active_title.
  ///
  /// In en, this message translates to:
  /// **'Disable microphone when not in use'**
  String get a_mic_active_title;

  /// No description provided for @a_mic_active_desc.
  ///
  /// In en, this message translates to:
  /// **'Use the physical mute switch or disable the microphone in settings.'**
  String get a_mic_active_desc;

  /// No description provided for @a_sensor_frequency_title.
  ///
  /// In en, this message translates to:
  /// **'Reduce measurement interval'**
  String get a_sensor_frequency_title;

  /// No description provided for @a_sensor_frequency_desc.
  ///
  /// In en, this message translates to:
  /// **'If possible, reduce sensor measurement frequency. Less frequent measurements produce fewer behavior data points.'**
  String get a_sensor_frequency_desc;

  /// No description provided for @a_sensor_data_deletion_title.
  ///
  /// In en, this message translates to:
  /// **'Delete old measurement values'**
  String get a_sensor_data_deletion_title;

  /// No description provided for @a_sensor_data_deletion_desc.
  ///
  /// In en, this message translates to:
  /// **'Review retention periods in app or web UI and enable auto deletion, or delete older data manually on a regular basis.'**
  String get a_sensor_data_deletion_desc;

  /// No description provided for @a_sensor_granularity_title.
  ///
  /// In en, this message translates to:
  /// **'Show less detailed data'**
  String get a_sensor_granularity_title;

  /// No description provided for @a_sensor_granularity_desc.
  ///
  /// In en, this message translates to:
  /// **'If possible, switch to less granular display or evaluation, for example daily values instead of minute values.'**
  String get a_sensor_granularity_desc;

  /// No description provided for @a_sensor_local_title.
  ///
  /// In en, this message translates to:
  /// **'Prefer local processing'**
  String get a_sensor_local_title;

  /// No description provided for @a_sensor_local_desc.
  ///
  /// In en, this message translates to:
  /// **'Check whether cloud sync can be disabled or local storage enabled so measurement data is not sent to the vendor.'**
  String get a_sensor_local_desc;

  /// No description provided for @a_voice_history_title.
  ///
  /// In en, this message translates to:
  /// **'Delete voice recordings'**
  String get a_voice_history_title;

  /// No description provided for @a_voice_history_desc.
  ///
  /// In en, this message translates to:
  /// **'BSI recommendation: Regularly delete voice recordings and disable voice history storage if the option is available.'**
  String get a_voice_history_desc;

  /// No description provided for @a_voice_local_title.
  ///
  /// In en, this message translates to:
  /// **'Enable local voice processing'**
  String get a_voice_local_title;

  /// No description provided for @a_voice_local_desc.
  ///
  /// In en, this message translates to:
  /// **'Enable local voice processing if available. If not, minimize cloud storage of voice data.'**
  String get a_voice_local_desc;

  /// No description provided for @a_skills_permissions_title.
  ///
  /// In en, this message translates to:
  /// **'Review skills/integrations'**
  String get a_skills_permissions_title;

  /// No description provided for @a_skills_permissions_desc.
  ///
  /// In en, this message translates to:
  /// **'Review which third-party skills have access. Disable unnecessary skills.'**
  String get a_skills_permissions_desc;

  /// No description provided for @a_video_encryption_title.
  ///
  /// In en, this message translates to:
  /// **'Enable end-to-end video encryption'**
  String get a_video_encryption_title;

  /// No description provided for @a_video_encryption_desc.
  ///
  /// In en, this message translates to:
  /// **'Enable end-to-end encrypted transmission for live view and recordings in your camera app/settings.'**
  String get a_video_encryption_desc;

  /// No description provided for @a_video_storage_title.
  ///
  /// In en, this message translates to:
  /// **'Store recordings locally'**
  String get a_video_storage_title;

  /// No description provided for @a_video_storage_desc.
  ///
  /// In en, this message translates to:
  /// **'Configure local storage if possible. If cloud-only storage is unavoidable, shorten the retention period and delete recordings regularly.'**
  String get a_video_storage_desc;

  /// No description provided for @a_sharing_restrictions_title.
  ///
  /// In en, this message translates to:
  /// **'Restrict camera access'**
  String get a_sharing_restrictions_title;

  /// No description provided for @a_sharing_restrictions_desc.
  ///
  /// In en, this message translates to:
  /// **'Remove all unnecessary shares in the app and allow live view/recordings only for required accounts.'**
  String get a_sharing_restrictions_desc;

  /// No description provided for @a_motion_detection_title.
  ///
  /// In en, this message translates to:
  /// **'Disable motion detection when at home'**
  String get a_motion_detection_title;

  /// No description provided for @a_motion_detection_desc.
  ///
  /// In en, this message translates to:
  /// **'Disable motion detection when people are home, or set a schedule that activates it only during absence.'**
  String get a_motion_detection_desc;

  /// No description provided for @a_account_required_title.
  ///
  /// In en, this message translates to:
  /// **'Minimize privacy impact of required account'**
  String get a_account_required_title;

  /// No description provided for @a_account_required_desc.
  ///
  /// In en, this message translates to:
  /// **'If account-free operation is not possible, use a separate account with minimal profile data and disable personalized services.'**
  String get a_account_required_desc;

  /// No description provided for @a_tracking_disabled_title.
  ///
  /// In en, this message translates to:
  /// **'Disable tracking and advertising'**
  String get a_tracking_disabled_title;

  /// No description provided for @a_tracking_disabled_desc.
  ///
  /// In en, this message translates to:
  /// **'Disable tracking, personalized advertising, and optional telemetry in privacy settings.'**
  String get a_tracking_disabled_desc;

  /// No description provided for @a_local_mode_title.
  ///
  /// In en, this message translates to:
  /// **'Prefer offline use'**
  String get a_local_mode_title;

  /// No description provided for @a_local_mode_desc.
  ///
  /// In en, this message translates to:
  /// **'Use the device primarily via local sources (e.g., HDMI) to reduce data transfer to the vendor.'**
  String get a_local_mode_desc;

  /// No description provided for @a_data_collection_title.
  ///
  /// In en, this message translates to:
  /// **'Disable history upload'**
  String get a_data_collection_title;

  /// No description provided for @a_data_collection_desc.
  ///
  /// In en, this message translates to:
  /// **'Disable transmission of temperature history to the vendor in the thermostat app and shorten the retention period.'**
  String get a_data_collection_desc;

  /// No description provided for @a_offline_control_title.
  ///
  /// In en, this message translates to:
  /// **'Set up local control'**
  String get a_offline_control_title;

  /// No description provided for @a_offline_control_desc.
  ///
  /// In en, this message translates to:
  /// **'Configure local schedules and control without cloud dependency if the device supports it.'**
  String get a_offline_control_desc;

  /// No description provided for @a_family_access_title.
  ///
  /// In en, this message translates to:
  /// **'Separate access rights for household members'**
  String get a_family_access_title;

  /// No description provided for @a_family_access_desc.
  ///
  /// In en, this message translates to:
  /// **'Set up separate roles/accounts so that only authorized people can adjust the heating.'**
  String get a_family_access_desc;

  /// No description provided for @a_local_control_title.
  ///
  /// In en, this message translates to:
  /// **'Enable local automations'**
  String get a_local_control_title;

  /// No description provided for @a_local_control_desc.
  ///
  /// In en, this message translates to:
  /// **'Use local scenes/schedules instead of cloud automations where available.'**
  String get a_local_control_desc;

  /// No description provided for @a_usage_tracking_title.
  ///
  /// In en, this message translates to:
  /// **'Disable usage tracking'**
  String get a_usage_tracking_title;

  /// No description provided for @a_usage_tracking_desc.
  ///
  /// In en, this message translates to:
  /// **'Disable analytics, telemetry, and usage data collection in app settings.'**
  String get a_usage_tracking_desc;

  /// No description provided for @a_offline_fallback_title.
  ///
  /// In en, this message translates to:
  /// **'Ensure offline fallback'**
  String get a_offline_fallback_title;

  /// No description provided for @a_offline_fallback_desc.
  ///
  /// In en, this message translates to:
  /// **'Check local switches/buttons and set up fallback controls so the device remains usable without internet.'**
  String get a_offline_fallback_desc;

  /// No description provided for @a_offline_unlock_title.
  ///
  /// In en, this message translates to:
  /// **'Secure offline access'**
  String get a_offline_unlock_title;

  /// No description provided for @a_offline_unlock_desc.
  ///
  /// In en, this message translates to:
  /// **'Set up a physical key or emergency code and test access when internet is unavailable.'**
  String get a_offline_unlock_desc;

  /// No description provided for @a_access_logging_title.
  ///
  /// In en, this message translates to:
  /// **'Enable access log'**
  String get a_access_logging_title;

  /// No description provided for @a_access_logging_desc.
  ///
  /// In en, this message translates to:
  /// **'Enable logging and notifications for lock openings so unauthorized access can be detected.'**
  String get a_access_logging_desc;

  /// No description provided for @a_two_factor_title.
  ///
  /// In en, this message translates to:
  /// **'Enable two-factor authentication'**
  String get a_two_factor_title;

  /// No description provided for @a_two_factor_desc.
  ///
  /// In en, this message translates to:
  /// **'BSI recommendation: Enable 2FA for your lock account to protect remote access.'**
  String get a_two_factor_desc;

  /// No description provided for @a_map_privacy_title.
  ///
  /// In en, this message translates to:
  /// **'Disable cloud floor-plan storage'**
  String get a_map_privacy_title;

  /// No description provided for @a_map_privacy_desc.
  ///
  /// In en, this message translates to:
  /// **'Switch storage to local and disable cloud backups of floor plans if the option is available.'**
  String get a_map_privacy_desc;

  /// No description provided for @a_cloud_required_title.
  ///
  /// In en, this message translates to:
  /// **'Reduce cloud dependency'**
  String get a_cloud_required_title;

  /// No description provided for @a_cloud_required_desc.
  ///
  /// In en, this message translates to:
  /// **'Enable local navigation or offline mode if available. If not, consider switching to a more privacy-friendly model.'**
  String get a_cloud_required_desc;

  /// No description provided for @a_vision_data_title.
  ///
  /// In en, this message translates to:
  /// **'Process camera data locally only'**
  String get a_vision_data_title;

  /// No description provided for @a_vision_data_desc.
  ///
  /// In en, this message translates to:
  /// **'Disable upload/storage of camera images and use exclusively local navigation processing where possible.'**
  String get a_vision_data_desc;

  /// No description provided for @a_parental_control_title.
  ///
  /// In en, this message translates to:
  /// **'Set up parental controls'**
  String get a_parental_control_title;

  /// No description provided for @a_parental_control_desc.
  ///
  /// In en, this message translates to:
  /// **'Enable parental controls with a PIN and restrict contacts, features, and sharing to what is necessary.'**
  String get a_parental_control_desc;

  /// No description provided for @a_child_data_limits_title.
  ///
  /// In en, this message translates to:
  /// **'Minimize data collection'**
  String get a_child_data_limits_title;

  /// No description provided for @a_child_data_limits_desc.
  ///
  /// In en, this message translates to:
  /// **'Disable optional profile data and collect only the child data required for core functionality.'**
  String get a_child_data_limits_desc;

  /// No description provided for @a_recording_disable_title.
  ///
  /// In en, this message translates to:
  /// **'Disable audio/video recordings'**
  String get a_recording_disable_title;

  /// No description provided for @a_recording_disable_desc.
  ///
  /// In en, this message translates to:
  /// **'Disable recording features by default and enable them only briefly when specifically needed.'**
  String get a_recording_disable_desc;

  /// No description provided for @a_expert_data_retention_duration_title.
  ///
  /// In en, this message translates to:
  /// **'Define retention periods'**
  String get a_expert_data_retention_duration_title;

  /// No description provided for @a_expert_data_retention_duration_desc.
  ///
  /// In en, this message translates to:
  /// **'Set short, clear retention periods in settings and regularly delete old data.'**
  String get a_expert_data_retention_duration_desc;

  /// No description provided for @a_expert_access_control_granular_title.
  ///
  /// In en, this message translates to:
  /// **'Introduce granular roles and accounts'**
  String get a_expert_access_control_granular_title;

  /// No description provided for @a_expert_access_control_granular_desc.
  ///
  /// In en, this message translates to:
  /// **'Use separate accounts instead of shared logins and grant only the minimum necessary permissions.'**
  String get a_expert_access_control_granular_desc;

  /// No description provided for @a_expert_third_party_sharing_limited_title.
  ///
  /// In en, this message translates to:
  /// **'Limit third-party sharing'**
  String get a_expert_third_party_sharing_limited_title;

  /// No description provided for @a_expert_third_party_sharing_limited_desc.
  ///
  /// In en, this message translates to:
  /// **'Disable partner, advertising, and analytics sharing in privacy and account settings.'**
  String get a_expert_third_party_sharing_limited_desc;

  /// No description provided for @a_expert_data_sale_disabled_title.
  ///
  /// In en, this message translates to:
  /// **'Opt out of data sale'**
  String get a_expert_data_sale_disabled_title;

  /// No description provided for @a_expert_data_sale_disabled_desc.
  ///
  /// In en, this message translates to:
  /// **'Enable available \"Do not sell\" options or object to data sharing for commercial purposes.'**
  String get a_expert_data_sale_disabled_desc;

  /// No description provided for @a_expert_update_support_window_title.
  ///
  /// In en, this message translates to:
  /// **'Verify update commitment'**
  String get a_expert_update_support_window_title;

  /// No description provided for @a_expert_update_support_window_desc.
  ///
  /// In en, this message translates to:
  /// **'Review the vendor\'s official update policy and plan a device replacement if no commitment is given.'**
  String get a_expert_update_support_window_desc;

  /// No description provided for @a_expert_vulnerability_process_title.
  ///
  /// In en, this message translates to:
  /// **'Review vendor security process'**
  String get a_expert_vulnerability_process_title;

  /// No description provided for @a_expert_vulnerability_process_desc.
  ///
  /// In en, this message translates to:
  /// **'Prefer vendors with a clear security contact and responsible disclosure process.'**
  String get a_expert_vulnerability_process_desc;

  /// No description provided for @a_expert_offline_functionality_title.
  ///
  /// In en, this message translates to:
  /// **'Prioritize offline functionality'**
  String get a_expert_offline_functionality_title;

  /// No description provided for @a_expert_offline_functionality_desc.
  ///
  /// In en, this message translates to:
  /// **'Enable local operating modes and minimize mandatory cloud features where the device allows.'**
  String get a_expert_offline_functionality_desc;

  /// No description provided for @a_expert_bystander_transparency_title.
  ///
  /// In en, this message translates to:
  /// **'Add transparency notices for bystanders'**
  String get a_expert_bystander_transparency_title;

  /// No description provided for @a_expert_bystander_transparency_desc.
  ///
  /// In en, this message translates to:
  /// **'Provide visible notices, recording indicators, and clear information for people in the surrounding area.'**
  String get a_expert_bystander_transparency_desc;

  /// No description provided for @a_expert_child_data_protection_title.
  ///
  /// In en, this message translates to:
  /// **'Strengthen child data protection'**
  String get a_expert_child_data_protection_title;

  /// No description provided for @a_expert_child_data_protection_desc.
  ///
  /// In en, this message translates to:
  /// **'Enable child-appropriate profiles, minimize data collection, and disable profiling/sharing.'**
  String get a_expert_child_data_protection_desc;

  /// No description provided for @a_expert_access_revocation_title.
  ///
  /// In en, this message translates to:
  /// **'Set up rapid access revocation'**
  String get a_expert_access_revocation_title;

  /// No description provided for @a_expert_access_revocation_desc.
  ///
  /// In en, this message translates to:
  /// **'Ensure that digital keys can be revoked individually and immediately, e.g., in case of device loss.'**
  String get a_expert_access_revocation_desc;

  /// No description provided for @a_dont_know_title.
  ///
  /// In en, this message translates to:
  /// **'Get to know device settings better'**
  String get a_dont_know_title;

  /// No description provided for @a_dont_know_desc.
  ///
  /// In en, this message translates to:
  /// **'At least one question was answered with \"I don\'t know\". Review your device settings and documentation to reduce risk more effectively.'**
  String get a_dont_know_desc;

  /// No description provided for @sl_base_risk.
  ///
  /// In en, this message translates to:
  /// **'Baseline risk of device type'**
  String get sl_base_risk;

  /// No description provided for @sl_child_room_bonus.
  ///
  /// In en, this message translates to:
  /// **'Increased sensitivity: child\'s bedroom'**
  String get sl_child_room_bonus;

  /// No description provided for @sl_password.
  ///
  /// In en, this message translates to:
  /// **'Default password not changed'**
  String get sl_password;

  /// No description provided for @sl_updates.
  ///
  /// In en, this message translates to:
  /// **'Automatic updates not enabled'**
  String get sl_updates;

  /// No description provided for @sl_network.
  ///
  /// In en, this message translates to:
  /// **'No separate IoT Wi-Fi configured'**
  String get sl_network;

  /// No description provided for @sl_informed.
  ///
  /// In en, this message translates to:
  /// **'Household members not informed'**
  String get sl_informed;

  /// No description provided for @sl_permissions.
  ///
  /// In en, this message translates to:
  /// **'App permissions not reduced'**
  String get sl_permissions;

  /// No description provided for @sl_camera_consent.
  ///
  /// In en, this message translates to:
  /// **'No consent for camera-covered area'**
  String get sl_camera_consent;

  /// No description provided for @sl_mic_active.
  ///
  /// In en, this message translates to:
  /// **'Microphone not disabled when unused'**
  String get sl_mic_active;

  /// No description provided for @sl_sensor_frequency.
  ///
  /// In en, this message translates to:
  /// **'Measurement interval not reduced'**
  String get sl_sensor_frequency;

  /// No description provided for @sl_sensor_data_deletion.
  ///
  /// In en, this message translates to:
  /// **'Old measurement values not deleted'**
  String get sl_sensor_data_deletion;

  /// No description provided for @sl_sensor_granularity.
  ///
  /// In en, this message translates to:
  /// **'Data stored with too much granularity'**
  String get sl_sensor_granularity;

  /// No description provided for @sl_sensor_local.
  ///
  /// In en, this message translates to:
  /// **'Data transferred to cloud'**
  String get sl_sensor_local;

  /// No description provided for @sl_voice_history.
  ///
  /// In en, this message translates to:
  /// **'Voice recordings not deletable'**
  String get sl_voice_history;

  /// No description provided for @sl_voice_local.
  ///
  /// In en, this message translates to:
  /// **'No local voice processing'**
  String get sl_voice_local;

  /// No description provided for @sl_skills_permissions.
  ///
  /// In en, this message translates to:
  /// **'Skills not reviewed regularly'**
  String get sl_skills_permissions;

  /// No description provided for @sl_video_encryption.
  ///
  /// In en, this message translates to:
  /// **'Video transmission not encrypted'**
  String get sl_video_encryption;

  /// No description provided for @sl_video_storage.
  ///
  /// In en, this message translates to:
  /// **'Recordings only in vendor cloud'**
  String get sl_video_storage;

  /// No description provided for @sl_sharing_restrictions.
  ///
  /// In en, this message translates to:
  /// **'Recording access not controlled'**
  String get sl_sharing_restrictions;

  /// No description provided for @sl_motion_detection.
  ///
  /// In en, this message translates to:
  /// **'Motion detection always active'**
  String get sl_motion_detection;

  /// No description provided for @sl_account_required.
  ///
  /// In en, this message translates to:
  /// **'Mandatory vendor account required'**
  String get sl_account_required;

  /// No description provided for @sl_tracking_disabled.
  ///
  /// In en, this message translates to:
  /// **'Ad tracking not disabled'**
  String get sl_tracking_disabled;

  /// No description provided for @sl_local_mode.
  ///
  /// In en, this message translates to:
  /// **'No offline operation possible'**
  String get sl_local_mode;

  /// No description provided for @sl_data_collection.
  ///
  /// In en, this message translates to:
  /// **'Temperature history sent to vendor'**
  String get sl_data_collection;

  /// No description provided for @sl_offline_control.
  ///
  /// In en, this message translates to:
  /// **'No offline operation possible'**
  String get sl_offline_control;

  /// No description provided for @sl_family_access.
  ///
  /// In en, this message translates to:
  /// **'Access cannot be restricted'**
  String get sl_family_access;

  /// No description provided for @sl_local_control.
  ///
  /// In en, this message translates to:
  /// **'Automations require internet connection'**
  String get sl_local_control;

  /// No description provided for @sl_usage_tracking.
  ///
  /// In en, this message translates to:
  /// **'Switching patterns collected by vendor'**
  String get sl_usage_tracking;

  /// No description provided for @sl_offline_fallback.
  ///
  /// In en, this message translates to:
  /// **'Device unusable offline'**
  String get sl_offline_fallback;

  /// No description provided for @sl_offline_unlock.
  ///
  /// In en, this message translates to:
  /// **'No offline unlock possible'**
  String get sl_offline_unlock;

  /// No description provided for @sl_access_logging.
  ///
  /// In en, this message translates to:
  /// **'No access log available'**
  String get sl_access_logging;

  /// No description provided for @sl_two_factor.
  ///
  /// In en, this message translates to:
  /// **'Two-factor authentication missing'**
  String get sl_two_factor;

  /// No description provided for @sl_map_privacy.
  ///
  /// In en, this message translates to:
  /// **'Floor plan transmitted to vendor'**
  String get sl_map_privacy;

  /// No description provided for @sl_cloud_required.
  ///
  /// In en, this message translates to:
  /// **'Navigation only possible via cloud'**
  String get sl_cloud_required;

  /// No description provided for @sl_vision_data.
  ///
  /// In en, this message translates to:
  /// **'Camera images stored or transmitted'**
  String get sl_vision_data;

  /// No description provided for @sl_parental_control.
  ///
  /// In en, this message translates to:
  /// **'Parental controls not configured'**
  String get sl_parental_control;

  /// No description provided for @sl_child_data_limits.
  ///
  /// In en, this message translates to:
  /// **'Data collection not limited'**
  String get sl_child_data_limits;

  /// No description provided for @sl_recording_disable.
  ///
  /// In en, this message translates to:
  /// **'Recording cannot be disabled'**
  String get sl_recording_disable;

  /// No description provided for @sl_expert_data_retention_duration.
  ///
  /// In en, this message translates to:
  /// **'Retention duration unclear or too long'**
  String get sl_expert_data_retention_duration;

  /// No description provided for @sl_expert_access_control_granular.
  ///
  /// In en, this message translates to:
  /// **'Granular access control missing'**
  String get sl_expert_access_control_granular;

  /// No description provided for @sl_expert_third_party_sharing_limited.
  ///
  /// In en, this message translates to:
  /// **'Third-party sharing not limited'**
  String get sl_expert_third_party_sharing_limited;

  /// No description provided for @sl_expert_data_sale_disabled.
  ///
  /// In en, this message translates to:
  /// **'Data sale not excluded'**
  String get sl_expert_data_sale_disabled;

  /// No description provided for @sl_expert_update_support_window.
  ///
  /// In en, this message translates to:
  /// **'Guaranteed update support window unknown'**
  String get sl_expert_update_support_window;

  /// No description provided for @sl_expert_vulnerability_process.
  ///
  /// In en, this message translates to:
  /// **'Vulnerability process not documented'**
  String get sl_expert_vulnerability_process;

  /// No description provided for @sl_expert_offline_functionality.
  ///
  /// In en, this message translates to:
  /// **'Meaningful offline operation not possible'**
  String get sl_expert_offline_functionality;

  /// No description provided for @sl_expert_bystander_transparency.
  ///
  /// In en, this message translates to:
  /// **'Transparency for nearby bystanders missing'**
  String get sl_expert_bystander_transparency;

  /// No description provided for @sl_expert_child_data_protection.
  ///
  /// In en, this message translates to:
  /// **'Child-data protection measures missing'**
  String get sl_expert_child_data_protection;

  /// No description provided for @sl_expert_access_revocation.
  ///
  /// In en, this message translates to:
  /// **'Individual access revocation not possible'**
  String get sl_expert_access_revocation;

  /// No description provided for @risk_hint_camera.
  ///
  /// In en, this message translates to:
  /// **'You answered all questions positively. However, baseline risk remains higher for cameras because they capture highly sensitive observation data and can be misused for surveillance if misconfigured.'**
  String get risk_hint_camera;

  /// No description provided for @risk_hint_mic.
  ///
  /// In en, this message translates to:
  /// **'You answered all questions positively. However, baseline risk remains elevated for microphone devices because voice data is highly sensitive and accidental activation or cloud processing still carries risks.'**
  String get risk_hint_mic;

  /// No description provided for @risk_hint_lock.
  ///
  /// In en, this message translates to:
  /// **'You answered all questions positively. However, smart locks still have elevated baseline risk because misuse directly affects physical access to your home.'**
  String get risk_hint_lock;

  /// No description provided for @risk_hint_child_room.
  ///
  /// In en, this message translates to:
  /// **'You answered all questions positively. However, baseline risk remains elevated in a child\'s bedroom because especially sensitive data about children and their daily life can be affected there.'**
  String get risk_hint_child_room;

  /// No description provided for @risk_hint_generic.
  ///
  /// In en, this message translates to:
  /// **'You answered all questions positively. The device can still remain medium/high risk because its type may reveal sensitive usage and behavior data.'**
  String get risk_hint_generic;

  /// No description provided for @gen_rec_0.
  ///
  /// In en, this message translates to:
  /// **'Set up a separate Wi-Fi network for smart home devices (e.g., your router\'s guest network).'**
  String get gen_rec_0;

  /// No description provided for @gen_rec_1.
  ///
  /// In en, this message translates to:
  /// **'Use a password manager and assign a unique, strong password to each device.'**
  String get gen_rec_1;

  /// No description provided for @gen_rec_2.
  ///
  /// In en, this message translates to:
  /// **'Enable multi-factor authentication (MFA) for all vendor accounts.'**
  String get gen_rec_2;

  /// No description provided for @gen_rec_3.
  ///
  /// In en, this message translates to:
  /// **'Define who in your household is responsible for updates, backups, and accounts.'**
  String get gen_rec_3;

  /// No description provided for @gen_rec_4.
  ///
  /// In en, this message translates to:
  /// **'Regularly review (at least once per quarter) all access permissions and accounts.'**
  String get gen_rec_4;

  /// No description provided for @gen_rec_5.
  ///
  /// In en, this message translates to:
  /// **'Dispose of old devices in a privacy-safe way: perform a factory reset and remove them from vendor cloud accounts.'**
  String get gen_rec_5;

  /// No description provided for @gen_rec_6.
  ///
  /// In en, this message translates to:
  /// **'Use a household consent check before buying new devices and involve all household members.'**
  String get gen_rec_6;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'cs',
    'da',
    'de',
    'en',
    'fr',
    'nl',
    'pl',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'cs':
      return AppLocalizationsCs();
    case 'da':
      return AppLocalizationsDa();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
    case 'nl':
      return AppLocalizationsNl();
    case 'pl':
      return AppLocalizationsPl();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
