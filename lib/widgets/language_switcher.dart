import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../l10n/language_controller.dart';

class LanguageSwitcher extends StatelessWidget {
  final LanguageController controller;
  final GlobalKey<NavigatorState>? navigatorKey;

  const LanguageSwitcher({
    super.key,
    required this.controller,
    this.navigatorKey,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Tooltip(
      message: localizations.languageDialogTitle,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _showLanguageDialog(context),
          borderRadius: BorderRadius.circular(999),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface.withAlpha(220),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color: Theme.of(context).colorScheme.outlineVariant,
              ),
            ),
            child: const Icon(Icons.language, size: 18),
          ),
        ),
      ),
    );
  }

  Future<void> _showLanguageDialog(BuildContext context) async {
    final dialogContext = navigatorKey?.currentContext ?? context;
    final localizations = AppLocalizations.of(context)!;
    final selected = await showDialog<String>(
      context: dialogContext,
      useRootNavigator: true,
      builder: (context) {
        final activeLanguageCode = Localizations.localeOf(context).languageCode;
        return AlertDialog(
          title: Text(localizations.languageDialogTitle),
          content: SizedBox(
            width: 320,
            child: ListView(
              shrinkWrap: true,
              children: AppLocalizations.supportedLocales.map((locale) {
                final code = locale.languageCode;
                final isSelected = activeLanguageCode == code;
                final name = _languageName(localizations, code);
                return ListTile(
                  dense: true,
                  selected: isSelected,
                  selectedTileColor: Theme.of(
                    context,
                  ).colorScheme.surfaceContainerHighest,
                  title: Text(name),
                  trailing: isSelected
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : null,
                  onTap: () => Navigator.of(context).pop(code),
                );
              }).toList(),
            ),
          ),
        );
      },
    );

    if (selected == null) {
      return;
    }
    await controller.setLocale(Locale(selected));
  }

  String _languageName(AppLocalizations localizations, String languageCode) {
    switch (languageCode) {
      case 'de':
        return localizations.languageNameDe;
      case 'cs':
        return localizations.languageNameCs;
      case 'en':
        return localizations.languageNameEn;
      case 'pl':
        return localizations.languageNamePl;
      case 'fr':
        return localizations.languageNameFr;
      case 'nl':
        return localizations.languageNameNl;
      case 'da':
        return localizations.languageNameDa;
      default:
        return languageCode;
    }
  }
}
