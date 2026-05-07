# Contributing to Simplications

Thank you for your interest in contributing to Simplications.
This document is the developer handbook for setup, architecture, standards, testing, and pull requests.

## Code of Conduct

- Be respectful and inclusive.
- Provide constructive feedback.
- Focus on the code, not the person.
- Help others learn and grow.

## Development Setup

### Prerequisites

- Flutter 3.11.5 or later
- Dart 3.1.0 or later
- Git
- VS Code, Android Studio, or IntelliJ IDEA with Flutter tooling

### Local setup

1. Clone the repository:

   ```bash
   git clone https://github.com/tucmi/simplications.git
   cd simplications
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Run the app:

   ```bash
   flutter run
   ```

4. Verify setup:

   ```bash
   flutter analyze
   ```

### Common developer commands

```bash
# Static analysis
flutter analyze

# Tests
flutter test

# Format source files
dart format lib/ test/

# Build targets
flutter build apk
flutter build web
flutter build windows
```

## Project Architecture

### High-level structure

```text
lib/
  main.dart
  data/catalog_data.dart
  l10n/app_localizations.dart
  models/
  screens/
  widgets/
```

### Key modules

- `lib/main.dart`: app entry point, app-level wiring, theme, and localization setup
- `lib/data/catalog_data.dart`: static catalog data (rooms, templates, question/action mappings)
- `lib/models/device.dart`: device templates/instances and risk-scoring logic
- `lib/models/survey_state.dart`: central assessment state and local persistence
- `lib/screens/`: wizard flow screens and summary screen
- `lib/widgets/`: reusable UI components
- `lib/l10n/app_localizations.dart`: localization source of truth

### State and persistence

- Assessment flow is state-driven via `SurveyState`.
- Progress and selected settings are persisted locally with SharedPreferences.

## Workflow

1. Create a feature branch:

   ```bash
   git checkout -b feature/your-feature-name
   # or for bug fixes:
   git checkout -b fix/your-bug-name
   ```

2. Implement your changes and commit in logical units.

3. Keep quality checks green:

   ```bash
   flutter analyze
   dart format lib/ test/
   flutter test
   ```

4. Push your branch:

   ```bash
   git push origin feature/your-feature-name
   ```

5. Open a pull request with clear context and testing notes.

## Code Style Guidelines

### Dart and Flutter conventions

- Indentation: 2 spaces
- Naming:
  - Classes: PascalCase
  - Methods/variables: camelCase
  - Private members: prefix with `_`
- Imports: group by dart, flutter, package, then relative imports
- Use braces for control flow blocks

### Formatting and linting

```bash
dart format lib/ test/
flutter analyze
```

Target: zero analyzer errors and warnings.

### Localization requirements

- Do not hardcode user-facing text in widgets.
- Localization source of truth is `lib/l10n/app_localizations.dart`.
- Add or update keys consistently across supported locales.
- Verify fallback behavior for missing locale values.
- Ensure summary export helpers still receive localized strings.

### Comments

- Explain why, not what.
- Keep comments concise and maintainable.

## Testing

### Run tests

```bash
# All tests
flutter test

# Single file
flutter test test/widget_test.dart

# Coverage
flutter test --coverage
```

### When adding features

1. Add tests for new logic or widgets.
2. Verify existing tests still pass.
3. Validate localization behavior if UI text changed.
4. Cover edge cases where applicable.

### Manual checklist before PR

- [ ] `flutter analyze` passes
- [ ] `dart format lib/ test/` introduces no pending changes
- [ ] `flutter test` passes
- [ ] App runs without crashes on target platform(s)
- [ ] Feature works end-to-end
- [ ] No unexpected console errors

## Contribution Types

### 1. Add a new device type

Primary files:

- `lib/models/device.dart`
- `lib/data/catalog_data.dart`

Typical changes:

- Add template entries to the catalog
- Add device-specific questions
- Add device-specific actions
- Verify scoring and summary output

### 2. Improve risk scoring

Primary file:

- `lib/models/device.dart`

Typical changes:

- Tune weighting logic
- Improve category-specific scoring behavior
- Add tests to prevent regressions

### 3. Improve persistence

Primary files:

- `lib/models/survey_state.dart`
- any related models used in serialization

Typical changes:

- Extend saved state fields
- Add migration handling for changed storage schemas
- Add tests for save/load compatibility

### 4. Improve localization

Primary files:

- `lib/l10n/app_localizations.dart`
- relevant UI files consuming localized strings

Typical changes:

- Add translation keys and values
- Ensure fallback behavior remains correct
- Verify exports and summaries remain localized

### 5. Improve documentation

- Keep README product-focused
- Keep CONTRIBUTING developer-focused
- Document new workflows when introducing them

### 6. Fix bugs

1. Reproduce the issue.
2. Add a failing test where practical.
3. Implement the fix.
4. Verify tests and analyzer pass.
5. Reference the issue in the PR.

## Pull Request Guidelines

### Title format examples

- `feat: add camera-specific encryption recommendation`
- `fix: correct custom device risk classification`
- `docs: clarify localization contribution workflow`

### Recommended PR description structure

- Description: what changed and why
- Related issues: references (for example, `Closes #42`)
- Testing: commands run and manual checks performed

### Review process

- Address review comments directly in follow-up commits.
- Keep discussion focused and actionable.
- Do not force-push over reviewer context unless necessary.

## Questions and Support

- General questions: open a GitHub discussion.
- Bug reports: open an issue with repro steps, expected behavior, and actual behavior.
- Feature requests: open an issue with use case, motivation, and alternatives.

Thank you for helping improve Simplications.
