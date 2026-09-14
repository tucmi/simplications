import 'package:flutter/material.dart';
import '../l10n/l10n_extensions.dart';
import '../l10n/language_controller.dart';
import '../models/survey_state.dart';
import '../widgets/language_switcher.dart';
import 'about_screen.dart';
import 'faq_screen.dart';
import 'room_selection_screen.dart';

class WelcomeScreen extends StatelessWidget {
  final LanguageController languageController;
  final GlobalKey<NavigatorState>? navigatorKey;
  final SurveyState state;

  const WelcomeScreen({
    super.key,
    required this.languageController,
    required this.state,
    this.navigatorKey,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final localizations = context.l10n;

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
                              localizations.welcomeTitle,
                              style: text.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 14),
                            LayoutBuilder(
                              builder: (context, introConstraints) {
                                final description = Text(
                                  localizations.welcomeDescription,
                                  style: text.bodyMedium?.copyWith(
                                    color: colors.onSurfaceVariant,
                                    height: 1.4,
                                  ),
                                );

                                final privacyCard = _PrivacyInfoCard(
                                  title: localizations.welcomePrivacyTitle,
                                  description:
                                      localizations.welcomePrivacyDescription,
                                  colors: colors,
                                  text: text,
                                );

                                return ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    maxWidth: 680,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      description,
                                      const SizedBox(height: 16),
                                      privacyCard,
                                    ],
                                  ),
                                );
                              },
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
                                label: localizations.stepSelectRooms,
                                colors: colors,
                              ),
                              _StepRow(
                                number: '2',
                                icon: Icons.devices,
                                label: localizations.stepCaptureDevices,
                                colors: colors,
                              ),
                              _StepRow(
                                number: '3',
                                icon: Icons.quiz_outlined,
                                label: localizations.stepAnswerQuestions,
                                colors: colors,
                              ),
                              _StepRow(
                                number: '4',
                                icon: Icons.shield_outlined,
                                label: localizations.stepGetRisk,
                                colors: colors,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ListenableBuilder(
                              listenable: state,
                              builder: (context, _) {
                                final hasProgress = state.hasAnyData;

                                return FilledButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            RoomSelectionScreen(state: state),
                                      ),
                                    );
                                  },
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
                                        ? localizations.resume
                                        : localizations.start,
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
                                  label: Text(localizations.faq),
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
                                      builder: (_) => AboutScreen(state: state),
                                    ),
                                  ),
                                  icon: const Icon(
                                    Icons.info_outline,
                                    size: 16,
                                  ),
                                  label: Text(localizations.about),
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
                controller: languageController,
                navigatorKey: navigatorKey,
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

class _PrivacyInfoCard extends StatelessWidget {
  final String title;
  final String description;
  final ColorScheme colors;
  final TextTheme text;

  const _PrivacyInfoCard({
    required this.title,
    required this.description,
    required this.colors,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.secondaryContainer.withAlpha(150),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colors.secondary.withAlpha(90)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.lock_outline, size: 18, color: colors.secondary),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: text.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: colors.onSecondaryContainer,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: text.bodySmall?.copyWith(
              color: colors.onSecondaryContainer,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }
}
