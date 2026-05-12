import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../l10n/language_controller.dart';
import '../models/survey_state.dart';
import '../widgets/language_switcher.dart';
import 'about_screen.dart';
import 'faq_screen.dart';
import 'room_selection_screen.dart';

/// App-wide route observer — provide this in [MaterialApp.navigatorObservers].
final RouteObserver<ModalRoute<void>> appRouteObserver =
    RouteObserver<ModalRoute<void>>();

class WelcomeScreen extends StatefulWidget {
  final LanguageController languageController;
  final GlobalKey<NavigatorState>? navigatorKey;

  const WelcomeScreen({
    super.key,
    required this.languageController,
    this.navigatorKey,
  });

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with RouteAware {
  SurveyState? _surveyState;

  @override
  void initState() {
    super.initState();
    _loadSurveyState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route is PageRoute) {
      appRouteObserver.subscribe(this, route);
    }
  }

  @override
  void dispose() {
    appRouteObserver.unsubscribe(this);
    super.dispose();
  }

  /// Called when this screen is popped back to (e.g. after reset).
  @override
  void didPopNext() {
    _loadSurveyState();
  }

  Future<void> _loadSurveyState() async {
    final surveyState = SurveyState();
    await surveyState.loadFromStorage();
    if (mounted) {
      setState(() => _surveyState = surveyState);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: colors.surface,
      body: Stack(
        children: [
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 16,
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight - 32,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 64,
                              height: 64,
                              child: Image.asset(
                                'assets/icon/icon.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              localizations.welcomeTitle(),
                              style: text.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              localizations.welcomeDescription(),
                              style: text.bodyMedium?.copyWith(
                                color: colors.onSurfaceVariant,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _StepRow(
                                number: '1',
                                icon: Icons.room,
                                label: localizations.stepSelectRooms(),
                                colors: colors,
                              ),
                              _StepRow(
                                number: '2',
                                icon: Icons.devices,
                                label: localizations.stepCaptureDevices(),
                                colors: colors,
                              ),
                              _StepRow(
                                number: '3',
                                icon: Icons.quiz_outlined,
                                label: localizations.stepAnswerQuestions(),
                                colors: colors,
                              ),
                              _StepRow(
                                number: '4',
                                icon: Icons.shield_outlined,
                                label: localizations.stepGetRisk(),
                                colors: colors,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Builder(
                              builder: (context) {
                                final surveyState = _surveyState;
                                final hasState = surveyState != null;
                                final hasProgress =
                                    hasState && surveyState.hasAnyData;

                                return FilledButton(
                                  onPressed: hasState
                                      ? () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (_) =>
                                                  RoomSelectionScreen(
                                                    state: surveyState,
                                                  ),
                                            ),
                                          );
                                        }
                                      : null,
                                  style: FilledButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                  ),
                                  child: Text(
                                    hasProgress
                                        ? localizations.resume()
                                        : localizations.start(),
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton.icon(
                                  onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => const FaqScreen(),
                                    ),
                                  ),
                                  icon: const Icon(
                                    Icons.help_outline,
                                    size: 16,
                                  ),
                                  label: Text(localizations.faq()),
                                  style: TextButton.styleFrom(
                                    foregroundColor: colors.onSurfaceVariant,
                                    textStyle: const TextStyle(fontSize: 13),
                                    visualDensity: VisualDensity.compact,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                TextButton.icon(
                                  onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          AboutScreen(state: _surveyState),
                                    ),
                                  ),
                                  icon: const Icon(
                                    Icons.info_outline,
                                    size: 16,
                                  ),
                                  label: Text(localizations.about()),
                                  style: TextButton.styleFrom(
                                    foregroundColor: colors.onSurfaceVariant,
                                    textStyle: const TextStyle(fontSize: 13),
                                    visualDensity: VisualDensity.compact,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: SafeArea(
              child: LanguageSwitcher(
                controller: widget.languageController,
                navigatorKey: widget.navigatorKey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StepRow extends StatelessWidget {
  final String number;
  final IconData icon;
  final String label;
  final ColorScheme colors;

  const _StepRow({
    required this.number,
    required this.icon,
    required this.label,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: colors.primary,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number,
                style: TextStyle(
                  color: colors.onPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Icon(icon, size: 20, color: colors.primary),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
