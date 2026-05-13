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

---

## Project Overview

**Simplications** is a Flutter privacy-assessment app. Users walk through
their smart-home rooms, select devices, answer privacy questions, and receive
a risk score with concrete action recommendations.

- **Platform targets**: Android, iOS, Web, Windows
- **Languages**: Dart / Flutter
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
- All strings live in `lib/l10n/app_localizations.dart` in the
  `_localizedValues` map, under every supported locale.
- When adding a string, add it under **all** locales (`de`, `en`, etc.).
- The fallback chain is: requested locale → `en` → `de` → fallback param → key.

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

### Code style

- 2-space indentation, Dart conventions (PascalCase classes, camelCase members).
- Group imports: dart → flutter → package → relative.
- Zero analyzer errors and warnings required.

### Pull request titles

- Pull request titles should follow this template: `<type>: <short description>`.
- Use a lowercase type prefix such as `feat`, `fix`, `docs`, `refactor`, `test`, or `chore`.
- Examples: `feat: add summary export`, `fix: preserve selected room state`.

---

## Checklist Before Finishing Any Task

- [ ] Build number bumped if any `lib/` file was changed
- [ ] `flutter test` passes (all tests green)
- [ ] `flutter analyze` passes (zero errors/warnings)
- [ ] Localization keys added in all locales if UI text was added/changed
- [ ] No hardcoded user-visible strings in widgets
