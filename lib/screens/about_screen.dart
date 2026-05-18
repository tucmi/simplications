import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../l10n/app_localizations.dart';
import '../models/survey_state.dart';

class AboutScreen extends StatelessWidget {
  final SurveyState? state;

  const AboutScreen({super.key, required this.state});

  Future<void> _openUrl(BuildContext context, String url) async {
    final localizations = AppLocalizations.of(context)!;
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(localizations.websiteOpenFailed)),
      );
    }
  }

  Future<void> _deleteAllData(BuildContext context) async {
    if (state == null || !state!.hasAnyData) {
      return;
    }

    final localizations = AppLocalizations.of(context)!;
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.warning_amber_rounded),
        title: Text(localizations.deleteAllDataTitle),
        content: Text(localizations.deleteAllDataBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(localizations.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              localizations.deleteAllDataButton,
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
    ).showSnackBar(SnackBar(content: Text(localizations.allDataDeleted)));
  }

  void _setExpertMode(bool enabled) {
    if (state == null) {
      return;
    }
    state!.setExpertModeEnabled(enabled);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(localizations.aboutScreenTitle)),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        children: [
          // ── App identity ────────────────────────────────────────────
          Row(
            children: [
              SizedBox(
                width: 56,
                height: 56,
                child: Image.asset('assets/icon/icon.png', fit: BoxFit.contain),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    localizations.aboutProjectName,
                    style: text.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    localizations.aboutSubtitle,
                    style: text.bodyMedium?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),

          // ── Website link ────────────────────────────────────────────
          Text(
            localizations.website,
            style: text.titleSmall?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          _PartnerTile(
            colors: colors,
            text: text,
            label: localizations.aboutProjectName,
            urlLabel: localizations.aboutWebsiteSimplicationsLabel,
            url: localizations.aboutWebsiteSimplicationsUrl,
            icon: Icons.open_in_new,
            highlighted: true,
            openUrl: (url) => _openUrl(context, url),
          ),
          const SizedBox(height: 28),

          // ── Project partners ────────────────────────────────────────
          Text(
            localizations.projectPartners,
            style: text.titleSmall?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          _PartnerTile(
            colors: colors,
            text: text,
            label: localizations.aboutPartnerTuChemnitz,
            urlLabel: localizations.aboutWebsiteTuChemnitzLabel,
            url: localizations.aboutWebsiteTuChemnitzUrl,
            icon: Icons.school_outlined,
            openUrl: (url) => _openUrl(context, url),
          ),
          _PartnerTile(
            colors: colors,
            text: text,
            label: localizations.aboutPartnerHsAnhalt,
            urlLabel: localizations.aboutWebsiteHsAnhaltLabel,
            url: localizations.aboutWebsiteHsAnhaltUrl,
            icon: Icons.school_outlined,
            openUrl: (url) => _openUrl(context, url),
          ),
          _PartnerTile(
            colors: colors,
            text: text,
            label: localizations.aboutPartnerVzSachsen,
            urlLabel: localizations.aboutWebsiteVzSachsenLabel,
            url: localizations.aboutWebsiteVzSachsenUrl,
            icon: Icons.groups_outlined,
            openUrl: (url) => _openUrl(context, url),
          ),
          const SizedBox(height: 20),

          // ── Coordination & funding ──────────────────────────────────
          Text(
            localizations.coordinationFunding,
            style: text.titleSmall?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          _InfoRow(
            colors: colors,
            text: text,
            icon: Icons.manage_accounts_outlined,
            label: localizations.coordination,
            value: localizations.platformPrivacy,
            urlLabel: localizations.aboutWebsitePlatformPrivacyLabel,
            url: localizations.aboutWebsitePlatformPrivacyUrl,
            openUrl: (url) => _openUrl(context, url),
          ),
          _InfoRow(
            colors: colors,
            text: text,
            icon: Icons.account_balance_outlined,
            label: localizations.fundingAgency,
            value: localizations.fundingAgencyValue,
            urlLabel: localizations.aboutWebsiteFundingAgencyLabel,
            url: localizations.aboutWebsiteFundingAgencyUrl,
            openUrl: (url) => _openUrl(context, url),
          ),
          const SizedBox(height: 20),

          // ── Expert mode ───────────────────────────────────────────
          Text(
            localizations.expertModeTitle,
            style: text.titleSmall?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: colors.primaryContainer.withAlpha(120),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colors.primary.withAlpha(80)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.science_outlined, color: colors.primary),
                  title: Text(
                    localizations.expertModeToggleLabel,
                    style: text.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: Text(localizations.expertModeToggleHint),
                  trailing: state == null
                      ? const Switch(value: false, onChanged: null)
                      : ListenableBuilder(
                          listenable: state!,
                          builder: (context, _) => Switch(
                            value: state!.expertModeEnabled,
                            onChanged: _setExpertMode,
                          ),
                        ),
                ),
                const SizedBox(height: 8),
                Text(
                  localizations.expertModeSourcesHint,
                  style: text.bodySmall?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 10),
                _PartnerTile(
                  colors: colors,
                  text: text,
                  label: localizations.expertModeSourceCmuLabel,
                  urlLabel: localizations.expertModeSourceCmuUrl,
                  url: localizations.expertModeSourceCmuUrl,
                  icon: Icons.open_in_new,
                  openUrl: (url) => _openUrl(context, url),
                ),
                _PartnerTile(
                  colors: colors,
                  text: text,
                  label: localizations.expertModeSourceUnboxingLabel,
                  urlLabel: localizations.expertModeSourceUnboxingUrl,
                  url: localizations.expertModeSourceUnboxingUrl,
                  icon: Icons.open_in_new,
                  openUrl: (url) => _openUrl(context, url),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // ── Danger zone ────────────────────────────────────────────
          Text(
            localizations.dangerZone,
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
                        localizations.dangerZoneWarning,
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
                          label: Text(localizations.deleteAllDataButton),
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
                              label: Text(localizations.deleteAllDataButton),
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
  final String urlLabel;
  final String url;
  final IconData icon;
  final bool highlighted;
  final Future<void> Function(String url) openUrl;

  const _PartnerTile({
    required this.colors,
    required this.text,
    required this.label,
    required this.urlLabel,
    required this.url,
    required this.icon,
    required this.openUrl,
    this.highlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    final containerColor = highlighted
        ? colors.primaryContainer.withAlpha(120)
        : colors.surfaceContainerHighest.withAlpha(100);
    final borderColor = highlighted
        ? colors.primary.withAlpha(80)
        : colors.outlineVariant.withAlpha(120);
    final linkColor = highlighted ? colors.primary : colors.onSurface;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () => openUrl(url),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 18, color: colors.onSurfaceVariant),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: text.bodyMedium?.copyWith(
                        color: colors.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      urlLabel,
                      style: text.bodySmall?.copyWith(
                        color: linkColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.open_in_new, size: 16, color: linkColor),
            ],
          ),
        ),
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
  final String urlLabel;
  final String url;
  final Future<void> Function(String url) openUrl;

  const _InfoRow({
    required this.colors,
    required this.text,
    required this.icon,
    required this.label,
    required this.value,
    required this.urlLabel,
    required this.url,
    required this.openUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () => openUrl(url),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: colors.surfaceContainerHighest.withAlpha(100),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: colors.outlineVariant.withAlpha(120)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 18, color: colors.onSurfaceVariant),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: text.bodyMedium?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                    Text(
                      value,
                      style: text.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      urlLabel,
                      style: text.bodySmall?.copyWith(
                        color: colors.onSurface,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.open_in_new, size: 16, color: colors.onSurface),
            ],
          ),
        ),
      ),
    );
  }
}
