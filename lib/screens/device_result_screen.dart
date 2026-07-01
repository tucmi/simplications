import 'package:flutter/material.dart';

import '../data/catalog_data.dart';
import '../l10n/app_localizations.dart';
import '../l10n/app_localizations_key_resolver.dart';
import '../models/device.dart';
import '../models/room.dart';
import '../models/survey_state.dart';
import 'summary_screen.dart';

class DeviceResultScreen extends StatelessWidget {
  final SurveyState state;
  final Room room;
  final String instanceId;

  const DeviceResultScreen({
    super.key,
    required this.state,
    required this.room,
    required this.instanceId,
  });

  DeviceInstance? _findDevice() {
    for (final device in state.devices) {
      if (device.instanceId == instanceId) {
        return device;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final device = _findDevice();
    if (device == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) {
          Navigator.of(context).maybePop();
        }
      });
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final colors = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final localizations = AppLocalizations.of(context)!;
    final riskColor = _riskColor(device.riskLevel);
    final riskLabel = _riskLabel(localizations, device.riskLevel);
    final actions = device.suggestedActions;

    return Scaffold(
      appBar: AppBar(title: Text(localizations.results), centerTitle: false),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: colors.primaryContainer,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          CatalogData.roomName(localizations, room),
                          style: text.labelSmall?.copyWith(
                            color: colors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Card(
                    elevation: 0,
                    color: colors.surfaceContainerHighest,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: colors.primaryContainer,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              device.template.icon,
                              size: 28,
                              color: colors.primary,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              CatalogData.deviceName(
                                localizations,
                                device.template,
                              ),
                              style: text.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Card(
                    elevation: 0,
                    color: riskColor.withValues(alpha: 0.12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: riskColor.withValues(alpha: 0.45),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            localizations.risk,
                            style: text.labelLarge?.copyWith(
                              color: colors.onSurfaceVariant,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Text(
                                '${device.riskScore}/100',
                                style: text.headlineSmall?.copyWith(
                                  color: riskColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: riskColor.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(999),
                                ),
                                child: Text(
                                  riskLabel,
                                  style: text.labelLarge?.copyWith(
                                    color: riskColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            _riskSummary(localizations, device.riskLevel),
                            style: text.bodyMedium,
                          ),
                          if (device.inherentRiskHint != null) ...[
                            const SizedBox(height: 10),
                            Text(
                              localizations.resolveKey(
                                device.inherentRiskHint!,
                                fallback: '',
                              ),
                              style: text.bodySmall?.copyWith(
                                color: colors.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    localizations.recommendations,
                    style: text.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          if (actions.isEmpty)
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(
                child: Card(
                  elevation: 0,
                  color: colors.surfaceContainerLow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Text(
                      _noActionText(localizations, device.riskLevel),
                      style: text.bodyMedium,
                    ),
                  ),
                ),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final action = actions[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Card(
                      elevation: 0,
                      color: colors.surfaceContainerLow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              localizations.resolveKey(
                                action.title,
                                fallback: action.title,
                              ),
                              style: text.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              localizations.resolveKey(
                                action.description,
                                fallback: action.description,
                              ),
                              style: text.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }, childCount: actions.length),
              ),
            ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => Navigator.of(context).pop(),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  icon: const Icon(Icons.devices_outlined),
                  label: Text(
                    localizations.checkAnotherDevice,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: FilledButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => SummaryScreen(state: state),
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  icon: const Icon(Icons.summarize_outlined),
                  label: Text(
                    localizations.results,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _riskLabel(AppLocalizations localizations, RiskLevel level) {
    switch (level) {
      case RiskLevel.high:
        return localizations.highRisk;
      case RiskLevel.medium:
        return localizations.mediumRisk;
      case RiskLevel.low:
        return localizations.lowRisk;
    }
  }

  String _riskSummary(AppLocalizations localizations, RiskLevel level) {
    switch (level) {
      case RiskLevel.high:
        return localizations.overallHigh;
      case RiskLevel.medium:
        return localizations.overallMedium;
      case RiskLevel.low:
        return localizations.overallLow;
    }
  }

  String _noActionText(AppLocalizations localizations, RiskLevel level) {
    switch (level) {
      case RiskLevel.high:
        return localizations.noActionHigh;
      case RiskLevel.medium:
        return localizations.noActionMedium;
      case RiskLevel.low:
        return localizations.noActionLow;
    }
  }

  Color _riskColor(RiskLevel level) {
    switch (level) {
      case RiskLevel.high:
        return const Color(0xFFC62828);
      case RiskLevel.medium:
        return const Color(0xFFF9A825);
      case RiskLevel.low:
        return const Color(0xFF2E7D32);
    }
  }
}
