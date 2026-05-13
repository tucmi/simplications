import 'package:flutter/material.dart';

import 'l10n/app_localizations.dart';
import 'l10n/language_controller.dart';
import 'screens/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final languageController = LanguageController();
  await languageController.init();
  runApp(SimplicationsApp(languageController: languageController));
}

class SimplicationsApp extends StatefulWidget {
  final LanguageController languageController;

  const SimplicationsApp({super.key, required this.languageController});

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
          onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
          debugShowCheckedModeBanner: false,
          navigatorObservers: [appRouteObserver],
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
          ),
        );
      },
    );
  }
}
