# Contributing to Simplications

Thank you for your interest in contributing to Simplications! We appreciate all contributions, whether they're bug fixes, feature additions, documentation improvements, or translations.

## Code of Conduct

- Be respectful and inclusive
- Provide constructive feedback
- Focus on the code, not the person
- Help others learn and grow

## Getting Started

### Prerequisites

- **Flutter**: 3.11.5 or later
- **Dart**: 3.1.0 or later
- **Git**: For version control
- **IDE**: VS Code, Android Studio, or IntelliJ IDEA (with Flutter plugin)

### Setting Up Development Environment

1. **Clone the repository**
   ```bash
   git clone https://github.com/tucmi/simplications.git
   cd simplications
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

4. **Verify setup with analysis**
   ```bash
   flutter analyze
   ```

## Making Changes

### Workflow

1. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   # or for bug fixes:
   git checkout -b fix/your-bug-name
   ```

2. **Make your changes**
   - Follow code style guidelines (see below)
   - Test your changes thoroughly
   - Commit frequently with clear messages

3. **Keep code quality high**
   ```bash
   # Analyze for issues
   flutter analyze

   # Format code
   dart format lib/

   # Run tests
   flutter test
   ```

4. **Commit with meaningful messages**
   ```bash
   git commit -m "feat: add speaker-specific encryption question"
   # or
   git commit -m "fix: resolve custom device grid layout issue"
   ```

5. **Push and create a pull request**
   ```bash
   git push origin feature/your-feature-name
   ```
   Then open a PR on GitHub with a clear description

## Code Style Guidelines

### Dart/Flutter Conventions

- **Indentation**: 2 spaces (Flutter standard)
- **Line Length**: Max 80-100 characters
- **Naming**:
  - Classes: `PascalCase`
  - Methods/Variables: `camelCase`
  - Constants: `camelCase` with `const` keyword
  - Private: prefix with `_`
- **Imports**: Organize by category (dart, flutter, packages, relative)
- **Curly Braces**: Always use braces for control flow statements
  ```dart
  // ✓ Good
  if (condition) {
    doSomething();
  }

  // ✗ Avoid
  if (condition) doSomething();
  ```

### Formatting

Run formatter before committing:
```bash
dart format lib/ test/
```

### Linting

Keep code analysis clean:
```bash
flutter analyze
```

Aim for **0 issues** (no warnings, no errors).

### German UI Text

All user-facing text must be in German:
- Button labels: "Weiter →", "Abbrechen", "Hinzufügen"
- Room names: "Wohnzimmer", "Küche", "Schlafzimmer"
- Device names: "Sprachassistent", "Smarte Kamera"
- Questions: "Wurden die Standardpasswörter geändert?"

**Future**: When multi-language support is added, extract strings to resource files.

### Comments

- Use clear, concise comments
- Explain "why", not "what" (code shows what)
- Keep German context in mind for UI explanations
  ```dart
  // ✓ Good
  // Device-specific questions vary by type (e.g., speakers ask about
  // voice recording history, cameras about encryption)
  List<DeviceQuestion> get questions { ... }

  // ✗ Avoid
  // Get the questions
  List<DeviceQuestion> get questions { ... }
  ```

## Testing

### Running Tests

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/widget_test.dart

# Run with coverage
flutter test --coverage
```

### Adding Tests

When adding new features:
1. Write tests for new methods/widgets
2. Ensure existing tests still pass
3. Test German text is correct
4. Test edge cases (empty input, null values, etc.)

### Manual Testing Checklist

Before submitting PR:
- [ ] Analyze passes: `flutter analyze` (0 issues)
- [ ] Format passes: `dart format` (no changes needed)
- [ ] Tests pass: `flutter test` (all green)
- [ ] App runs: `flutter run` (no crashes)
- [ ] Feature works end-to-end on target platform
- [ ] Material Design 3 teal theme applied correctly
- [ ] German UI text is correct and complete
- [ ] No console errors/warnings

## Types of Contributions

### 1. Adding a New Device Type

Example: Adding "Kaffeemaschine" (smart coffee machine) support

**Files to modify:**
- `lib/models/device.dart` - Ensure `deviceType` string is documented
- `lib/data/catalog_data.dart` - Add:
  - New device to `allDeviceTemplates`
  - 3-4 device-specific questions to `getDeviceSpecificQuestions()`
  - 3-5 device-specific actions to `getDeviceSpecificActions()`

**Steps:**
1. Create constants for questions and actions
2. Add conditional logic to match device type
3. Test by creating custom device with new type or adding predefined device
4. Verify questions and actions display correctly

### 2. Improving Risk Scoring

**Files:**
- `lib/models/device.dart` - `riskScore` getter

**Ideas:**
- Add device-type-specific penalty weights
- Consider question importance relative to device type
- Implement time-decay for recommendations

### 3. Adding Persistence

**Currently:** Custom rooms/devices lost on app restart

**Suggested approach:**
- Use `shared_preferences` package for simple save/load
- Or `sqflite` for more complex data storage
- Store to local file on app exit, load on app start

### 4. Multi-Language Support

**Approach:**
1. Extract all German strings to `lib/l10n/`
2. Add Flutter's `intl` package to `pubspec.yaml`
3. Create `.arb` files for German (de) and other languages
4. Use `AppLocalizations.of(context).get('key')` instead of hardcoded strings

### 5. Documentation Improvements

- Improve README.md or .llmrc with missing information
- Add code comments explaining complex logic
- Update this CONTRIBUTING.md with new workflows
- Create guides for common development tasks

### 6. Bug Fixes

1. Open an issue describing the bug
2. Provide reproduction steps
3. Create a branch: `git checkout -b fix/issue-name`
4. Add test that reproduces the issue
5. Fix the bug
6. Verify test now passes
7. Submit PR with issue reference

## Pull Request Process

1. **Title**: Clear, concise summary
   - "feat: add custom device deletion with confirmation"
   - "fix: correct device-specific question filtering"
   - "docs: update README with architecture details"

2. **Description**: Explain what and why
   ```markdown
   ## Description
   Adds confirmation dialog before deleting custom devices to prevent accidents.

   ## Related Issues
   Closes #42

   ## Changes
   - Added `_removeCustomDevice()` method with confirmation
   - Added red delete button to custom device cards
   - Added German confirmation text

   ## Testing
   - Manual: Created custom device, verified delete confirmation works
   - Manual: Verified standard devices cannot be deleted
   ```

3. **Testing**: Verify all checks pass
   - `flutter analyze`: 0 issues
   - `flutter test`: all pass
   - App runs without crashes
   - Feature works as intended

4. **Review**: Respond to feedback
   - Address all review comments
   - Push additional commits to same branch
   - Maintain good communication

## Questions?

- **General Questions**: Open a discussion in the repository
- **Bug Reports**: Open an issue with:
  - Steps to reproduce
  - Expected behavior
  - Actual behavior
  - Device/platform/Flutter version
- **Feature Requests**: Open an issue with:
  - Use case and motivation
  - Suggested solution (if any)
  - Alternatives considered

## Recognition

Contributors will be recognized in:
- Project README
- Release notes
- Contributors list (if applicable)

Thank you for helping make Simplications better! 🙏

---

**Questions about this guide?** Feel free to ask in issues or discussions.
