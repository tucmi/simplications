import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/survey_state.dart';
import 'room_selection_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colors.surface,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
              const SizedBox(height: 8),
              // App icon
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: colors.primaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.home_outlined,
                  size: 40,
                  color: colors.primary,
                ),
              ),
              const SizedBox(height: 28),
              Text(
                'Smart Home\nDatenschutz-Check',
                style: text.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                'Dieser Assistent führt Sie Raum für Raum durch Ihr Zuhause, erfasst Ihre smarten Geräte und bewertet deren Datenschutzrisiko – mit konkreten Empfehlungen aus dem Simplications Maßnahmenkatalog.',
                style: text.bodyLarge?.copyWith(
                  color: colors.onSurfaceVariant,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),
              _StepRow(
                number: '1',
                icon: Icons.room,
                label: 'Räume auswählen',
                colors: colors,
              ),
              _StepRow(
                number: '2',
                icon: Icons.devices,
                label: 'Geräte erfassen',
                colors: colors,
              ),
              _StepRow(
                number: '3',
                icon: Icons.quiz_outlined,
                label: 'Sicherheitsfragen beantworten',
                colors: colors,
              ),
              _StepRow(
                number: '4',
                icon: Icons.shield_outlined,
                label: 'Risikoprofil & Empfehlungen erhalten',
                colors: colors,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) =>
                            RoomSelectionScreen(state: SurveyState()),
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Jetzt starten',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              _MadeBySection(colors: colors),
              const SizedBox(height: 8),
            ],
                ),
              ),
            );
          },
          ),
        ),
    );
  }
}

class _MadeBySection extends StatelessWidget {
  final ColorScheme colors;

  const _MadeBySection({required this.colors});

  Future<void> _openWebsite(BuildContext context) async {
    final uri = Uri.parse('https://simplications.tucmi.de');
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Website konnte nicht geöffnet werden.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Made by Simplications',
            style: text.labelLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: colors.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Projektpartner: Technische Universität Chemnitz, Hochschule Anhalt, Verbraucherzentrale Sachsen e.V.',
            style: text.bodySmall?.copyWith(color: colors.onSurfaceVariant),
          ),
          const SizedBox(height: 2),
          Text(
            'Koordination: Plattform Privatheit · Fördermittelgeber: BMFTR',
            style: text.bodySmall?.copyWith(color: colors.onSurfaceVariant),
          ),
          const SizedBox(height: 2),
          InkWell(
            onTap: () => _openWebsite(context),
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'simplications.tucmi.de',
                    style: text.bodySmall?.copyWith(
                      color: colors.primary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Icon(
                    Icons.open_in_new,
                    size: 14,
                    color: colors.primary,
                  ),
                ],
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
