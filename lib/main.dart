import 'package:flutter/material.dart';

import 'l10n/app_localizations.dart';
import 'l10n/l10n_extensions.dart';
import 'l10n/language_controller.dart';
import 'models/survey_state.dart';
import 'screens/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final languageController = LanguageController();
  await languageController.init();
  // Loaded once for the app's lifetime instead of per-screen, so every
  // screen shares one instance and no screen needs to reload it from disk.
  final surveyState = SurveyState();
  await surveyState.loadFromStorage();
  runApp(
    SimplicationsApp(
      languageController: languageController,
      surveyState: surveyState,
    ),
  );
}

class SimplicationsApp extends StatefulWidget {
  final LanguageController languageController;
  final SurveyState surveyState;

  const SimplicationsApp({
    super.key,
    required this.languageController,
    required this.surveyState,
  });

  @override
  State<SimplicationsApp> createState() => _SimplicationsAppState();
}

class _SimplicationsAppState extends State<SimplicationsApp> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.languageController,
      builder: (context, _) {
        return MaterialApp(
          navigatorKey: _navigatorKey,
          onGenerateTitle: (context) => context.l10n.appTitle,
          debugShowCheckedModeBanner: false,
          locale: widget.languageController.locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF00695C),
              brightness: Brightness.light,
            ),
            useMaterial3: true,
          ),
          home: WelcomeScreen(
            languageController: widget.languageController,
            navigatorKey: _navigatorKey,
            state: widget.surveyState,
          ),
        );
      },
    );
  }
}
