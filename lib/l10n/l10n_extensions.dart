import 'package:flutter/widgets.dart';

import 'app_localizations.dart';

extension BuildContextL10n on BuildContext {
  /// Shorthand for `AppLocalizations.of(context)!`. Safe to force-unwrap:
  /// [AppLocalizations.delegate] is always registered in [MaterialApp], so a
  /// null result here means the widget tree is misconfigured, not a normal
  /// runtime state.
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
