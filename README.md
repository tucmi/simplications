# Simplications

A Flutter app that guides users through a room-by-room smart home privacy assessment and delivers actionable security recommendations based on BSI (German Federal Office for Information Security) guidelines.

> UI language: **Multilingual** (German default with runtime language switch)

## Features

- **Room-by-room wizard** — pick rooms, add devices, answer security questions
- **Risk scoring** — per-device and overall Low / Medium / High rating
- **BSI-based recommendations** — 30+ prioritised actions tied to specific devices
- **Four answer states** — Yes / No / Don't know / Not applicable (with scoring weight)
- **Custom rooms & devices** — extend the catalog with user-defined entries (scoped to their creation room)
- **Persistent state** — progress survives app restarts via SharedPreferences
- **Export** — share results as plain text or PDF
- **Localization** — device-aware language selection with manual override

## Localization

The app supports these UI languages:

- German (`de`)
- Czech (`cs`)
- English (`en`)
- Polish (`pl`)
- French (`fr`)
- Dutch (`nl`)
- Danish (`da`)

### Runtime language switch

- A small language badge is shown in the top-right corner of the app.
- Tap it to open the language dialog and switch language immediately.
- The selected language is persisted with `SharedPreferences`.

### Default language behavior

- On first start, the app tries to infer the language from the device locale.
- If the device language is unsupported, the app falls back to German (`de`).

## Supported device categories

Smart Speakers, Cameras, Smart TVs, Smart Locks, Thermostats, Lights / Plugs / Blinds, Robot Vacuums, Wearables, Smart Toys, Sensors, Kitchen Appliances, Network Equipment, and custom user-defined devices.

## Getting started

**Prerequisites:** Flutter ≥ 3.11.5 · Dart ≥ 3.1

```bash
git clone https://github.com/tucmi/simplications.git
cd simplications
flutter pub get
flutter run
```

Supported targets: Android, iOS, Web, Windows, macOS, Linux.

## Build

```bash
flutter build apk       # Android
flutter build web       # Web
flutter build windows   # Windows
```

## Development

```bash
flutter analyze   # static analysis
flutter test      # unit & widget tests
```

## Project structure

```
lib/
├── main.dart
├── data/catalog_data.dart          # static catalog – rooms, devices, actions
├── models/
│   ├── device.dart                 # DeviceTemplate, DeviceInstance, risk scoring
│   ├── room.dart
│   └── survey_state.dart          # ChangeNotifier state + SharedPreferences I/O
├── screens/
│   ├── welcome_screen.dart
│   ├── room_selection_screen.dart
│   ├── device_selection_screen.dart
│   ├── device_questionnaire_screen.dart
│   └── summary_screen.dart
└── widgets/
    ├── custom_add_dialogs.dart
    └── wizard_progress_bar.dart
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for setup instructions, code style, and PR guidelines.

## License

MIT — see [LICENSE](LICENSE).

## Acknowledgements

Developed by the [Simplications](https://simplications.tucmi.de) project.
Partners: Technische Universität Chemnitz · Hochschule Anhalt · Verbraucherzentrale Sachsen e.V.
Coordination: Plattform Privatheit · Funded by: BMFTR
