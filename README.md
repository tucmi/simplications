# Simplications

A Flutter application for evaluating smart home privacy and security risks room-by-room. **Simplications** helps users assess their connected devices across different rooms and provides actionable security recommendations based on German Federal Office for Information Security (BSI) guidelines.

## 🎯 Features

### Core Functionality

- **Room-based Assessment**: Evaluate privacy risks by room (living room, bedroom, kitchen, etc.)
- **Device Evaluation**: Add devices to rooms and answer targeted security questions
- **Risk Scoring**: Automatic risk calculation (Low/Medium/High) based on security practices
- **Actionable Remedies**: Get device-specific security recommendations

### Advanced Features

- **Custom Rooms**: Create custom room types beyond predefined options
- **Custom Devices**: Add devices not in the catalog with custom risk profiles
- **Device-Specific Questions**: Tailored security questions for each device type:
  - **Smart Speakers**: Voice recording history, local processing, app permissions
  - **Cameras**: Encryption, storage location, sharing controls, motion detection
  - **Smart TVs**: Account requirements, tracking, offline capability
  - **Smart Locks**: Offline unlock, access logging, 2FA
  - **Robots (Vacuums)**: Map privacy, cloud dependency, vision data
  - **Wearables**: Health data sharing, location tracking
  - **Thermostats**: Data collection, offline control, family access
  - Plus 5 universal base questions for all devices
- **BSI-Based Remedies**: 30+ security actions drawn from German government security guidelines
- **Comprehensive Evaluation**: Per-room and overall smart home risk assessment

## 📱 Device Support

The app supports 12+ device categories with dedicated security profiles:

- Smart Speakers & Hubs
- Cameras & Video Doorbells
- Smart TVs
- Smart Locks
- Thermostats & Climate Control
- Lights, Plugs, & Blinds
- Robot Vacuums
- Smart Toys
- Wearables (Fitness Trackers, Smartwatches, Smart Scales)
- Network Equipment (Routers, Meters, Printers)
- Kitchen Appliances
- Custom Devices (user-defined)

## 🏗️ Architecture

### Project Structure

```
lib/
├── main.dart                          # App entry point
├── models/
│   ├── room.dart                     # Room data model
│   ├── device.dart                   # Device & question models with risk scoring
│   └── survey_state.dart             # Central state management (ChangeNotifier)
├── data/
│   └── catalog_data.dart             # Static catalog (rooms, devices, questions, actions)
├── screens/
│   ├── welcome_screen.dart
│   ├── room_selection_screen.dart    # Room picker with custom room support
│   ├── device_selection_screen.dart  # Device picker with custom device support
│   ├── device_questionnaire_screen.dart
│   ├── room_evaluation_screen.dart
│   └── summary_screen.dart
└── widgets/
    ├── custom_add_dialogs.dart       # Dialogs for creating custom rooms/devices
    └── wizard_progress_bar.dart      # Progress indicator
```

### Key Models

**DeviceTemplate**: Device type definition

- `id`, `name`, `icon`, `baseRiskScore`
- `deviceType`: Category for device-specific questions (speaker, camera, tv, thermostat, etc.)
- `hasCamera`, `hasMicrophone`: Flags for conditional questions
- `isCustom`: User-created device indicator

**DeviceInstance**: Device added to a room

- Stores answers to all applicable questions
- Calculates individual device risk score
- Provides device-specific security actions

**PrivacyAction**: Security remedy/recommendation

- `title`, `description`, `type` (social/technical/security)
- `priority` (high/medium/low)
- `deviceType`: Optional field for device-specific actions

**SurveyState**: Central state manager (ChangeNotifier)

- Tracks selected room and devices
- Manages custom rooms and devices
- Maintains completion status
- Provides device and action queries

### Data Model

All catalog data (rooms, devices, questions, actions) is static in `catalog_data.dart`:

- 9 predefined rooms
- 27 standard devices + unlimited custom devices
- 40+ device-specific questions
- 30+ BSI-based security actions
- 7 general recommendations

### State Management

Uses Flutter's `ChangeNotifier` pattern with `ListenableBuilder` for reactive UI updates. Custom rooms and devices are transient (lost on app restart).

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.11.5 or later
- Dart SDK 3.1.0 or later
- Supported platforms: Android, iOS, Web, macOS, Windows, Linux

### Installation & Running

```bash
# Clone the repository
git clone <repository-url>
cd simplications

# Get dependencies
flutter pub get

# Run the app
flutter run

# Run on specific platform
flutter run -d android    # Android device/emulator
flutter run -d ios        # iOS simulator
flutter run -d chrome     # Web browser
flutter run -d windows    # Windows desktop
```

### Build

```bash
# Android APK
flutter build apk

# iOS app
flutter build ios

# Web
flutter build web

# Windows executable
flutter build windows
```

## 🧪 Testing & Quality

```bash
# Analyze code for issues
flutter analyze

# Run tests
flutter test

# Build and analyze
flutter run --analyze
```

## 🌍 Localization

The app is currently in **German (Deutsch)**. All UI text, device names, questions, and recommendations are in German. To adapt to other languages:

1. Extract all String literals to `lib/l10n/` directory
2. Use Flutter's intl package for localization
3. Create `.arb` files for each language

## 📋 Typical Workflow

1. **Welcome Screen**: User starts assessment
2. **Room Selection**: Choose a room or create custom room
3. **Device Selection**: Add devices to room or create custom device
4. **Questionnaire**: Answer device-specific security questions
5. **Room Evaluation**: View room risk score and recommended actions
6. **Summary**: See complete smart home assessment

## 🔒 Security & Privacy

- Assessment data is stored locally on device
- No data is transmitted to external servers
- All recommendations are based on established security practices
- BSI guidelines are referenced but not included in source (consulted during development)

## 🎨 UI/UX

- Material Design 3 with teal (#00695C) primary color
- Responsive design for mobile and desktop
- German language throughout
- Accessibility considerations in color choices and layouts

## 📚 Key Files to Understand

- **lib/data/catalog_data.dart**: Complete device catalog and questions
- **lib/models/device.dart**: Risk scoring algorithm and device-specific logic
- **lib/models/survey_state.dart**: State management patterns
- **lib/screens/device_selection_screen.dart**: Custom device UI integration
- **lib/widgets/custom_add_dialogs.dart**: Custom room/device creation dialogs

## 🐛 Known Limitations

- Custom rooms and devices are lost on app restart (no persistence layer)
- Risk scoring uses fixed penalties per answer (could be device-type-specific)
- Only German language supported
- No data export/import functionality
- No user accounts or cloud synchronization

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on:

- Setting up the development environment
- Code style and conventions
- Testing requirements
- Submitting pull requests

## 📧 Support

For issues, questions, or suggestions, please open an issue on the project repository.

## 🙏 Acknowledgments

- BSI (Bundesamt für Sicherheit in der Informationstechnik) for security guidelines
- Flutter team for the excellent framework
- Material Design team for design inspiration
- BMFTR

---

**Last Updated**: April 2026
**Language**: German (Deutsch) UI
**Status**: Active Development
