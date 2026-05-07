import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../l10n/app_localizations.dart';
import '../models/survey_state.dart';

class AboutScreen extends StatelessWidget {
  final SurveyState? state;

  const AboutScreen({super.key, required this.state});

  Future<void> _openUrl(BuildContext context, String url) async {
    final localizations = AppLocalizations.of(context);
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(localizations.websiteOpenFailed())),
      );
    }
  }

  Future<void> _deleteAllData(BuildContext context) async {
    if (state == null || !state!.hasAnyData) {
      return;
    }

    final localizations = AppLocalizations.of(context);
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.warning_amber_rounded),
        title: Text(localizations.deleteAllDataTitle()),
        content: Text(localizations.deleteAllDataBody()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(localizations.cancel()),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              localizations.deleteAllDataButton(),
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );

    if (shouldDelete != true) {
      return;
    }

    await state!.reset();

    if (!context.mounted) {
      return;
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(localizations.allDataDeleted())));
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(localizations.aboutScreenTitle())),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        children: [
          // ── App identity ────────────────────────────────────────────
          Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: colors.primaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  Icons.home_outlined,
                  size: 30,
                  color: colors.primary,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Simplications',
                    style: text.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    localizations.aboutSubtitle(),
                    style: text.bodyMedium?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 28),

          // ── Project partners ────────────────────────────────────────
          Text(
            localizations.projectPartners(),
            style: text.titleSmall?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          _PartnerTile(
            colors: colors,
            text: text,
            label: 'Technische Universität Chemnitz',
            icon: Icons.school_outlined,
          ),
          _PartnerTile(
            colors: colors,
            text: text,
            label: 'Hochschule Anhalt',
            icon: Icons.school_outlined,
          ),
          _PartnerTile(
            colors: colors,
            text: text,
            label: 'Verbraucherzentrale Sachsen e.V.',
            icon: Icons.groups_outlined,
          ),
          const SizedBox(height: 20),

          // ── Coordination & funding ──────────────────────────────────
          Text(
            localizations.coordinationFunding(),
            style: text.titleSmall?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          _InfoRow(
            colors: colors,
            text: text,
            icon: Icons.manage_accounts_outlined,
            label: localizations.coordination(),
            value: localizations.platformPrivacy(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.account_balance_outlined,
                  size: 18,
                  color: colors.onSurfaceVariant,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        localizations.fundingAgency(),
                        style: text.bodyMedium?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                      Text(
                        localizations.fundingAgencyValue(),
                        style: text.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // ── Website link ────────────────────────────────────────────
          Text(
            localizations.website(),
            style: text.titleSmall?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () => _openUrl(context, 'https://simplications.tucmi.de'),
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: colors.primaryContainer.withAlpha(120),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: colors.primary.withAlpha(80)),
              ),
              child: Row(
                children: [
                  Icon(Icons.open_in_new, size: 18, color: colors.primary),
                  const SizedBox(width: 10),
                  Text(
                    'simplications.tucmi.de',
                    style: text.bodyMedium?.copyWith(
                      color: colors.primary,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 28),

          // ── Danger zone ────────────────────────────────────────────
          Text(
            localizations.dangerZone(),
            style: text.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: colors.error,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: colors.errorContainer.withAlpha(200),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colors.error.withAlpha(150)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.warning_amber_rounded, color: colors.error),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        localizations.dangerZoneWarning(),
                        style: text.bodyMedium?.copyWith(
                          color: colors.onErrorContainer,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: state == null
                      ? FilledButton.tonalIcon(
                          onPressed: null,
                          icon: const Icon(Icons.delete_forever_outlined),
                          label: Text(localizations.deleteAllDataButton()),
                          style: FilledButton.styleFrom(
                            backgroundColor: colors.error,
                            foregroundColor: colors.onError,
                          ),
                        )
                      : ListenableBuilder(
                          listenable: state!,
                          builder: (context, _) {
                            final canDelete = state!.hasAnyData;
                            return FilledButton.tonalIcon(
                              onPressed: canDelete
                                  ? () => _deleteAllData(context)
                                  : null,
                              icon: const Icon(Icons.delete_forever_outlined),
                              label: Text(localizations.deleteAllDataButton()),
                              style: FilledButton.styleFrom(
                                backgroundColor: colors.error,
                                foregroundColor: colors.onError,
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PartnerTile extends StatelessWidget {
  final ColorScheme colors;
  final TextTheme text;
  final String label;
  final IconData icon;

  const _PartnerTile({
    required this.colors,
    required this.text,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 18, color: colors.onSurfaceVariant),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: text.bodyMedium?.copyWith(color: colors.onSurface),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final ColorScheme colors;
  final TextTheme text;
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.colors,
    required this.text,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 18, color: colors.onSurfaceVariant),
          const SizedBox(width: 10),
          Text(
            '$label: ',
            style: text.bodyMedium?.copyWith(color: colors.onSurfaceVariant),
          ),
          Expanded(
            child: Text(
              value,
              style: text.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
