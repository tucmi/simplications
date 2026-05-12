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
    final code = controller.locale.languageCode;
    final flagLabel = LanguageController.flagsByLanguageCode[code] ?? 'DE';

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _showLanguageDialog(context),
        borderRadius: BorderRadius.circular(999),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface.withAlpha(220),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.language, size: 14),
              const SizedBox(width: 4),
              Text(
                flagLabel,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showLanguageDialog(BuildContext context) async {
    final dialogContext = navigatorKey?.currentContext ?? context;
    final localizations = AppLocalizations.of(context);
    final selected = await showDialog<String>(
      context: dialogContext,
      useRootNavigator: true,
      builder: (context) {
        final activeLanguageCode = Localizations.localeOf(context).languageCode;
        return AlertDialog(
          title: Text(localizations.languageDialogTitle()),
          content: SizedBox(
            width: 320,
            child: ListView(
              shrinkWrap: true,
              children: AppLocalizations.supportedLocales.map((locale) {
                final code = locale.languageCode;
                final isSelected = activeLanguageCode == code;
                final flag =
                    LanguageController.flagsByLanguageCode[code] ?? code;
                final name =
                    LanguageController.nativeNamesByLanguageCode[code] ?? code;
                return ListTile(
                  dense: true,
                  selected: isSelected,
                  selectedTileColor: Theme.of(
                    context,
                  ).colorScheme.surfaceContainerHighest,
                  title: Row(
                    children: [
                      SizedBox(
                        width: 28,
                        child: Text(
                          flag,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(child: Text(name)),
                    ],
                  ),
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
}
