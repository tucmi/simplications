# Simplications

Simplications is a Flutter app for assessing smart home privacy and security risks room by room. It guides people through the devices in their household and produces concrete recommendations based on BSI (German Federal Office for Information Security) guidance.

## What the app does

- Guides users through a room-by-room privacy and security check
- Lets users add predefined and custom smart devices per room
- Asks device-specific questions with four answer states:
    - Yes
    - No
    - Don't know
    - Not applicable
- Calculates risk per device and an overall risk level (Low, Medium, High)
- Generates practical, device-relevant recommendations
- Exports results as plain text or PDF
- Saves progress locally so sessions survive app restarts

## Assessment flow

1. Select one or more rooms.
2. Add devices for each room.
3. Answer security and privacy questions per device.
4. Review the generated summary, risk levels, and recommendations.
5. Export the report if needed.

## Supported languages

- German (de)
- Czech (cs)
- English (en)
- Polish (pl)
- French (fr)
- Dutch (nl)
- Danish (da)

Behavior:

- A runtime language switch is available directly in the app UI.
- The selected language is persisted locally.
- On first launch, the app tries to match the device locale.
- If the locale is unsupported, the app falls back to German.

## Supported device categories

The catalog includes common smart home categories such as smart speakers, cameras, TVs, locks, thermostats, lighting and plugs, robot vacuums, wearables, toys, sensors, kitchen devices, and network equipment. Custom device types can also be added by users.

## Platform support

The app targets Android, iOS, Web, Windows, macOS, and Linux.

## Data handling

- Assessment state is stored locally on device.
- No account is required to run a local assessment.

## For developers

All developer setup, architecture notes, code standards, and contribution workflow are documented in [CONTRIBUTING.md](CONTRIBUTING.md).

Internal Windows MSIX trust-install instructions for testing are documented in [docs/msix-trust-install.md](docs/msix-trust-install.md).

### Localization workflow (contributors)

1. Add the new key in `lib/l10n/app_en.arb`.
2. Add translations for the same key in every other ARB file in `lib/l10n/` (`app_de.arb`, `app_cs.arb`, `app_pl.arb`, `app_fr.arb`, `app_nl.arb`, `app_da.arb`).
3. Regenerate localization code:

    ```bash
    flutter gen-l10n
    ```

4. Commit the ARB changes and generated `lib/l10n/app_localizations*.dart` files together.

Risk scoring details (formula, thresholds, weights, and rationale) are documented in [lib/models/RISK_SCORING_README.md](lib/models/RISK_SCORING_README.md).

## License

MIT. See [LICENSE](LICENSE).

## Acknowledgements

Developed by the [Simplications](https://simplications.tucmi.de) project.
Partners: Technische Universitat Chemnitz, Hochschule Anhalt, Verbraucherzentrale Sachsen e.V.
Coordination: Plattform Privatheit.
Funded by: BMFTR.
