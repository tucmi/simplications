# Risk Scoring and Aggregation

This document explains exactly how risk is calculated in the app, how scores are converted to levels, and why the current weights were chosen.

Location of implementation:
- `lib/models/device.dart` (per-device score, penalties, and risk level)
- `lib/screens/summary_screen.dart` (aggregation to overall score)

## 1. Per-device risk score

Each device receives a score in the range 0-100.

Formula:

`deviceRiskScore = clamp(baseRiskScore + sum(questionPenalties), 0, 100)`

Implemented in `DeviceInstance.riskScore`.

### 1.1 Base risk

Every device template has a `baseRiskScore`.

Purpose:
- Model inherent risk of a device category, even when user settings are good.
- Reflect that some categories can expose more sensitive data by design.

Examples:
- Cameras and microphones can expose highly sensitive observation/voice data.
- Smart locks can affect physical access.

### 1.2 Penalty model by answer

For each scored question:
- `yes` -> +0
- `notApplicable` -> +0
- `no` -> full penalty
- `dontKnow` -> reduced penalty (roughly half to two-thirds of `no`)

Reasoning:
- `no` means a known missing safeguard, so impact should be higher.
- `dontKnow` still indicates risk (configuration uncertainty), but less than confirmed insecure settings.

### 1.3 Penalties for base questions

Applied in all (or most) devices:

- Password changed: `no +20`, `dontKnow +10`
- Automatic updates: `no +15`, `dontKnow +8`
- Separate IoT network: `no +10`, `dontKnow +5`
- Household informed: `no +10`, `dontKnow +5`
- App permissions reduced: `no +5`, `dontKnow +3`
- Camera consent (if camera device): `no +15`, `dontKnow +8`
- Mic deactivation (if microphone device): `no +10`, `dontKnow +5`

Why these values:
- Password and updates are highest because they are foundational controls against account compromise and known vulnerabilities.
- Network segmentation and informed household are medium because they reduce lateral spread and social/privacy harm.
- App permissions are lower because impact is usually narrower than account takeover or unpatched firmware.
- Camera consent is high because visual capture can strongly affect bystander privacy.
- Microphone inactivity control is medium-high because voice capture is sensitive, but often contextual.

### 1.4 Device-specific questions

For each device-specific question:
- `no +8`
- `dontKnow +4`

Why uniform values for device-specific items:
- Keeps the model explainable and predictable.
- Avoids overfitting to individual product types.
- Balances significance: important, but generally secondary to the most critical baseline controls.

## 2. Mapping score to risk level

Both per-device and overall risk levels use the same thresholds:

- `0-33`: Low
- `34-66`: Medium
- `67-100`: High

Implemented in:
- `DeviceInstance.riskLevel` (`lib/models/device.dart`)
- `_SummaryReport.fromDevices` (`lib/screens/summary_screen.dart`)

Why 33/66 boundaries:
- Divides the 0-100 range into three equally sized, easy-to-understand bands.
- Produces stable categories for communication in UI and exports.
- Matches a simple traffic-light style interpretation without hidden complexity.

## 3. Overall household score

When multiple devices are evaluated:

`overallScore = round(average(deviceRiskScore))`

If no devices exist, overall score is `0`.

Why arithmetic mean:
- Transparent and easy to explain to users.
- Each device contributes equally.
- Prevents one outlier from fully dominating the household score.

Trade-off:
- Equal weighting may under-represent highly critical devices in mixed fleets.
- This is intentionally compensated by showing per-device details and high-priority actions.

## 4. Why scores are clamped to 0-100

`riskScore` is clamped before use.

Why:
- Keeps outputs consistent and user-friendly.
- Ensures thresholds and visualizations remain stable.
- Prevents stacking many penalties from producing unintuitive numbers above 100.

## 5. Explainability features tied to scoring

The model includes explicit explainability artifacts:

- `scoringFactors` list in `DeviceInstance` shows each contributing factor and penalty.
- Base risk appears as a separate factor (`Grundrisiko des Geraetetyps`).
- `dontKnow` contributes smaller penalties and is marked as uncertainty.

Purpose:
- Users can see why a score is high.
- Recommendations map directly to failed controls.

## 6. Rationale summary for the chosen weighting strategy

The current weighting strategy aims for:

1. High impact for foundational security hygiene
- Passwords and updates receive top penalties.

2. Meaningful but not extreme penalties for privacy/process controls
- Network separation, consent, household awareness, permission minimization.

3. Consistent scoring for domain-specific extras
- Uniform 8/4 for device-specific checks keeps maintenance low and communication clear.

4. Actionability over complexity
- Every penalty corresponds to a concrete recommendation.
- Score remains understandable to non-technical users.

## 7. Calibration guidance (if values are changed later)

If you adjust weights, keep these invariants:

- Preserve monotonicity: worse answers should never lower risk.
- Keep `dontKnow` lower than `no` for the same question.
- Keep thresholds aligned with communication in UI/export.
- Re-check that common realistic answer sets still distribute across low/medium/high as intended.
- Update this file whenever scoring code changes.

## 8. Worked example

Example device:
- `baseRiskScore = 30`
- password = no (`+20`)
- updates = yes (`+0`)
- network = dontKnow (`+5`)
- informed = no (`+10`)
- permissions = yes (`+0`)
- one device-specific question = no (`+8`)

Total:
- `30 + 20 + 0 + 5 + 10 + 0 + 8 = 73`
- Clamped -> `73`
- Risk level -> High (`67-100`)
