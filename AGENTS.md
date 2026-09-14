# Simplications – AI Agent Instructions

This file is the single source of truth for any LLM or AI coding agent
(GitHub Copilot, Codex, Claude, Gemini, etc.) working in this repository.
Read this file before making any changes. Follow these rules strictly.

`.llmrc` may provide additional implementation context, but if there is any
conflict, this file (`AGENTS.md`) takes precedence.

---

## Build Number Policy

**Rule: every LLM edit to a core app file MUST increment the build number
in `pubspec.yaml` before (or as part of) the same commit/change set.**

### What counts as a core file?

Any file under `lib/` (recursively), including:

| File | Description |
|---|---|
| `lib/main.dart` | App entry point |
| `lib/data/catalog_data.dart` | Static catalog: rooms, devices, questions, actions |
| `lib/models/device.dart` | Risk scoring, question logic, action recommendations |
| `lib/models/survey_state.dart` | Assessment state and persistence |
| `lib/models/room.dart` | Room model |
| `lib/l10n/app_localizations.dart` | Localization (all supported languages) |
| `lib/l10n/language_controller.dart` | Language switch persistence |
| `lib/screens/*.dart` | All wizard and result screens |
| `lib/widgets/*.dart` | Reusable UI components |

`test/`, `android/`, `ios/`, `web/`, `windows/`, `linux/`, `macos/` are NOT
core files. Changing only those files does not require a build number bump.

### How to bump

In `pubspec.yaml`, increase the integer after `+` in the `version` line:

```yaml
# Before
version: 1.0.0+3

# After (any LLM change to a core file)
version: 1.0.0+4
```

Never skip numbers. Never decrease the build number.

### Release tagging (semantic version)

This is separate from the per-edit build-number bump above and only applies
when actually cutting a release, not on ordinary task/PR work:

1. Bump the semantic version in `pubspec.yaml` (e.g. `1.0.0+41` → `1.1.0+41`
   for a feature release, `1.1.1+41` for a hotfix) — leave the build number
   as-is unless a core file also changed.
2. Commit: `chore: bump version to X.Y.Z`.
3. Tag: `git tag vX.Y.Z` (the tag does not include the build number).
4. Push with tags: `git push origin main --tags`.
5. The `v*`-tag release workflow validates the tag matches `pubspec.yaml` and
   creates the GitHub Release.

---

## Project Overview

**Simplications** is a Flutter privacy-assessment app. Users walk through
their smart-home rooms, select devices, answer privacy questions, and receive
a risk score with concrete action recommendations.

- **Repository**: <https://github.com/tucmi/simplications>
- **Platform targets**: Android, iOS, Web, Windows, macOS, Linux
- **Languages**: Dart / Flutter (Flutter 3.11.5+, Dart 3.1.0+)
- **Build system**: Gradle (Android), Xcode (iOS), CMake (Linux/macOS/Windows)
- **Key packages**: `pdf` (PDF export), `share_plus` (share sheet)
- **Supported locales**: `de` (default), `en`, `cs`, `pl`, `fr`, `nl`, `da`
- **State persistence**: `SharedPreferences` via `SurveyState`
- **No backend** – all data stays on-device

---

## Architecture Summary

```
lib/
  main.dart                  — App entry, theming, locale wiring
  data/catalog_data.dart     — Catalog of rooms, device templates, localisation helpers
  models/
    device.dart              — DeviceTemplate, DeviceInstance, risk engine, actions
    survey_state.dart        — Central state + SharedPreferences persistence
    room.dart                — Room model
  l10n/
    app_localizations.dart   — All UI strings for all locales (source of truth)
    language_controller.dart — User language preference + persistence
  screens/                   — Wizard flow: welcome → rooms → devices → questionnaire → summary
  widgets/                   — Shared UI components (dialogs, language switcher, …)
test/
  widget_test.dart                — App launch smoke test
  icon_serialization_test.dart    — Icon persistence + survey state round-trips
  device_risk_scoring_test.dart   — Risk engine unit tests
  app_localizations_test.dart     — Localization fallback and interpolation tests
  language_controller_test.dart   — Language persistence tests
  summary_screen_test.dart        — Summary screen rendering tests
```

---

## Key Conventions

### Localization

- Never hardcode user-visible strings in widgets.
- Uses standard Flutter `gen-l10n` codegen (see `l10n.yaml`), not a hand-rolled
  lookup. Source of truth is the ARB files in `lib/l10n/` (`app_en.arb` is the
  template); `lib/l10n/app_localizations*.dart` are generated output — do not
  hand-edit them, edit the ARBs and run `flutter gen-l10n` (or `flutter build`/
  `flutter run` with `generate: true`, already set in `pubspec.yaml`).
- When adding a string, add the key under **all** locale ARB files (`app_de.arb`,
  `app_en.arb`, etc.), then regenerate and commit the generated files together
  (see the Localization workflow section in `README.md`).
- Access strings via `AppLocalizations.of(context)!.someKey`. For strings keyed
  dynamically by a string id (e.g. catalog room/device names), use the
  `resolveKey` extension in `lib/l10n/app_localizations_key_resolver.dart`
  instead, and add new dynamic keys there too.

### PDF export

- All text rendered to PDF must use characters covered by Helvetica (Latin-1 /
  ISO 8859-1) — the `pdf` package's default fonts don't support more than that.
- Avoid en-dashes (`–`), em-dashes (`—`), and non-Latin accented characters in
  strings used in PDF export.
- If a locale needs unsupported characters, embed a Unicode font (e.g. Roboto)
  rather than relaxing this rule.

### Risk scoring

- Base risk is set per `DeviceTemplate.baseRiskScore` in `catalog_data.dart`.
- Per-question penalties are defined in `DeviceInstance.riskScore` (device.dart).
- Score is clamped to `[0, 100]`.
- Child-bedroom room adds a 10-point bonus.
- Dont-know answers use a reduced penalty (roughly half of the "no" penalty).

### Testing

- Run `flutter test` before finishing any task involving core files.
- Run `flutter analyze` to catch static issues.
- When changing risk scoring logic, update `test/device_risk_scoring_test.dart`
  with the new expected values.
- Write widget tests for complex UI components (dialogs, forms, risk displays).
- Test localization changes against at least two locales, preferably one with
  non-ASCII/special characters (e.g. `cs`, `pl`, `fr`).

### Code style

- 2-space indentation, Dart conventions (PascalCase classes, camelCase members).
- Group imports: dart → flutter → package → relative.
- Zero analyzer errors and warnings required.
- Add short docstring comments to public classes and methods explaining their
  purpose and key behavior.

### Commits and pull requests

- Use conventional commit format: `feat:`, `fix:`, `refactor:`, `test:`, `docs:`, `chore:`.
- Pull request titles should follow this template: `<type>: <short description>`.
- Use a lowercase type prefix such as `feat`, `fix`, `docs`, `refactor`, `test`, or `chore`.
- Examples: `feat: add summary export`, `fix: preserve selected room state`.
- Reference related issues with `Fixes #…` or `Closes #…` in PR descriptions.
- Split logical changes into separate commits; avoid unrelated refactors in feature PRs.
- All PRs must pass CI (`flutter analyze`, release APK build).

---

## Checklist Before Finishing Any Task

- [ ] Build number bumped if any `lib/` file was changed
- [ ] `flutter test` passes (all tests green)
- [ ] `flutter analyze` passes (zero errors/warnings)
- [ ] Localization keys added in all locales if UI text was added/changed
- [ ] No hardcoded user-visible strings in widgets
- [ ] PDF-export strings stay Latin-1/Helvetica-safe (no en/em dashes, no
      unsupported accented characters)
- [ ] Widget tests added for complex UI components touched by the change
