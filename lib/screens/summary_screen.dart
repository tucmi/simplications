import 'package:flutter/material.dart';
import '../data/catalog_data.dart';
import '../models/device.dart';
import '../models/survey_state.dart';

class SummaryScreen extends StatelessWidget {
  final SurveyState state;

  const SummaryScreen({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final devices = state.devices;

    final highRisk = devices.where((d) => d.riskLevel == RiskLevel.high).toList()
      ..sort((a, b) => b.riskScore.compareTo(a.riskScore));
    final medRisk = devices.where((d) => d.riskLevel == RiskLevel.medium).toList()
      ..sort((a, b) => b.riskScore.compareTo(a.riskScore));
    final lowRisk = devices.where((d) => d.riskLevel == RiskLevel.low).toList()
      ..sort((a, b) => b.riskScore.compareTo(a.riskScore));

    final overallScore = devices.isEmpty
        ? 0
        : (devices.map((d) => d.riskScore).reduce((a, b) => a + b) /
                devices.length)
            .round();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ihr Ergebnis'),
        centerTitle: false,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          TextButton.icon(
            icon: const Icon(Icons.restart_alt, size: 18),
            label: const Text('Neu starten'),
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // ── Overview header ──────────────────────────────────────────
          SliverToBoxAdapter(
            child: _OverviewHeader(
              devices: devices,
              overallScore: overallScore,
              highCount: highRisk.length,
              medCount: medRisk.length,
              lowCount: lowRisk.length,
              colors: colors,
              text: text,
            ),
          ),

          // ── No devices ───────────────────────────────────────────────
          if (devices.isEmpty)
            SliverPadding(
              padding: const EdgeInsets.all(32),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        size: 64,
                        color: colors.primary,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Keine Geräte erfasst.',
                        style: text.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Starten Sie erneut und fügen Sie Geräte hinzu, um eine Bewertung zu erhalten.',
                        style: text.bodyMedium?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),

          // ── Hohe Risiken ─────────────────────────────────────────────
          if (highRisk.isNotEmpty) ...[
            SliverToBoxAdapter(
              child: _SectionHeader(
                label: 'Hohes Risiko',
                count: highRisk.length,
                color: _riskColor(RiskLevel.high),
                icon: Icons.warning_rounded,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: _DeviceResultCard(device: highRisk[i]),
                  ),
                  childCount: highRisk.length,
                ),
              ),
            ),
          ],

          // ── Mittlere Risiken ─────────────────────────────────────────
          if (medRisk.isNotEmpty) ...[
            SliverToBoxAdapter(
              child: _SectionHeader(
                label: 'Mittleres Risiko',
                count: medRisk.length,
                color: _riskColor(RiskLevel.medium),
                icon: Icons.info_rounded,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: _DeviceResultCard(device: medRisk[i]),
                  ),
                  childCount: medRisk.length,
                ),
              ),
            ),
          ],

          // ── Niedrige Risiken ─────────────────────────────────────────
          if (lowRisk.isNotEmpty) ...[
            SliverToBoxAdapter(
              child: _SectionHeader(
                label: 'Niedriges Risiko',
                count: lowRisk.length,
                color: _riskColor(RiskLevel.low),
                icon: Icons.check_circle_rounded,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: _DeviceResultCard(device: lowRisk[i]),
                  ),
                  childCount: lowRisk.length,
                ),
              ),
            ),
          ],

          // ── General recommendations ──────────────────────────────────
          SliverToBoxAdapter(
            child: _GeneralRecommendations(colors: colors, text: text),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }
}

// ── Helper ──────────────────────────────────────────────────────────────────

Color _riskColor(RiskLevel level) {
  switch (level) {
    case RiskLevel.high:
      return const Color(0xFFC62828);
    case RiskLevel.medium:
      return const Color(0xFFE65100);
    case RiskLevel.low:
      return const Color(0xFF2E7D32);
  }
}

Color _riskBg(RiskLevel level) {
  switch (level) {
    case RiskLevel.high:
      return const Color(0xFFFFEBEE);
    case RiskLevel.medium:
      return const Color(0xFFFFF3E0);
    case RiskLevel.low:
      return const Color(0xFFE8F5E9);
  }
}

String _riskLabel(RiskLevel level) {
  switch (level) {
    case RiskLevel.high:
      return 'Hoch';
    case RiskLevel.medium:
      return 'Mittel';
    case RiskLevel.low:
      return 'Niedrig';
  }
}

String _actionTypeLabel(ActionType type) {
  switch (type) {
    case ActionType.social:
      return 'Sozial';
    case ActionType.technical:
      return 'Technisch';
    case ActionType.security:
      return 'Sicherheit';
  }
}

IconData _actionTypeIcon(ActionType type) {
  switch (type) {
    case ActionType.social:
      return Icons.group;
    case ActionType.technical:
      return Icons.settings;
    case ActionType.security:
      return Icons.security;
  }
}

// ── Widgets ─────────────────────────────────────────────────────────────────

class _OverviewHeader extends StatelessWidget {
  final List<DeviceInstance> devices;
  final int overallScore;
  final int highCount;
  final int medCount;
  final int lowCount;
  final ColorScheme colors;
  final TextTheme text;

  const _OverviewHeader({
    required this.devices,
    required this.overallScore,
    required this.highCount,
    required this.medCount,
    required this.lowCount,
    required this.colors,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final scoreLevel = overallScore <= 33
        ? RiskLevel.low
        : overallScore <= 66
            ? RiskLevel.medium
            : RiskLevel.high;
    final scoreColor = _riskColor(scoreLevel);

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colors.primaryContainer,
            colors.secondaryContainer,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ihr Smart-Home-Datenschutz',
            style: text.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          if (devices.isNotEmpty) ...[
            Row(
              children: [
                // Score circle
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: scoreColor.withAlpha(30),
                    shape: BoxShape.circle,
                    border: Border.all(color: scoreColor, width: 3),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '$overallScore',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: scoreColor,
                          ),
                        ),
                        Text(
                          '/100',
                          style: TextStyle(
                            fontSize: 10,
                            color: scoreColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 18),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${devices.length} Gerät${devices.length == 1 ? '' : 'e'} bewertet',
                      style: text.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    if (highCount > 0)
                      _RiskCount(
                        count: highCount,
                        level: RiskLevel.high,
                      ),
                    if (medCount > 0)
                      _RiskCount(
                        count: medCount,
                        level: RiskLevel.medium,
                      ),
                    if (lowCount > 0)
                      _RiskCount(
                        count: lowCount,
                        level: RiskLevel.low,
                      ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              _overallMessage(scoreLevel, highCount),
              style: text.bodySmall?.copyWith(
                color: colors.onSurfaceVariant,
                height: 1.4,
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _overallMessage(RiskLevel level, int highCount) {
    if (level == RiskLevel.low) {
      return 'Gut gemacht! Ihre Geräte sind überwiegend sicher konfiguriert. Schauen Sie trotzdem in die allgemeinen Empfehlungen.';
    } else if (level == RiskLevel.medium) {
      return 'Es gibt Verbesserungspotenzial. Schauen Sie sich die Empfehlungen zu den einzelnen Geräten an.';
    } else {
      return 'Mehrere Geräte haben erhebliche Datenschutzrisiken. Bitte setzen Sie die Maßnahmen mit hoher Priorität zeitnah um.';
    }
  }
}

class _RiskCount extends StatelessWidget {
  final int count;
  final RiskLevel level;

  const _RiskCount({required this.count, required this.level});

  @override
  Widget build(BuildContext context) {
    final color = _riskColor(level);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(
          '$count × ${_riskLabel(level)}',
          style: TextStyle(
            fontSize: 13,
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String label;
  final int count;
  final Color color;
  final IconData icon;

  const _SectionHeader({
    required this.label,
    required this.count,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 6),
      child: Row(
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: color.withAlpha(30),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '$count',
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DeviceResultCard extends StatefulWidget {
  final DeviceInstance device;

  const _DeviceResultCard({required this.device});

  @override
  State<_DeviceResultCard> createState() => _DeviceResultCardState();
}

class _DeviceResultCardState extends State<_DeviceResultCard> {
  bool _expanded = false;

  @override
  void initState() {
    super.initState();
    // Auto-expand high-risk devices
    _expanded = widget.device.riskLevel == RiskLevel.high;
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final device = widget.device;
    final level = device.riskLevel;
    final color = _riskColor(level);
    final bg = _riskBg(level);
    final actions = device.suggestedActions;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: color.withAlpha(80), width: 1.5),
      ),
      color: bg,
      child: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: () => setState(() => _expanded = !_expanded),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: color.withAlpha(25),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(device.template.icon, size: 22, color: color),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          device.template.name,
                          style: text.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          device.roomName,
                          style: text.bodySmall?.copyWith(
                            color: colors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Risk badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          _riskLabel(level),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Risiko: ${device.riskScore}/100',
                        style: text.labelSmall?.copyWith(color: color),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    _expanded ? Icons.expand_less : Icons.expand_more,
                    color: colors.onSurfaceVariant,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
          // Risk bar
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: device.riskScore / 100,
                minHeight: 6,
                backgroundColor: color.withAlpha(30),
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            ),
          ),
          // Expanded actions
          if (_expanded) ...[
            if (actions.isEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 16,
                      color: _riskColor(RiskLevel.low),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Alles in Ordnung – keine Maßnahmen erforderlich.',
                      style: text.bodySmall?.copyWith(
                        color: _riskColor(RiskLevel.low),
                      ),
                    ),
                  ],
                ),
              )
            else ...[
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 6),
                child: Text(
                  '${actions.length} Empfehlung${actions.length == 1 ? '' : 'en'}:',
                  style: text.labelSmall?.copyWith(
                    color: colors.onSurfaceVariant,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ...actions.map(
                (action) => Padding(
                  padding: const EdgeInsets.fromLTRB(14, 0, 14, 10),
                  child: _ActionTile(action: action),
                ),
              ),
            ],
          ],
        ],
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  final PrivacyAction action;

  const _ActionTile({required this.action});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final priorityColor = action.priority == ActionPriority.high
        ? const Color(0xFFC62828)
        : action.priority == ActionPriority.medium
            ? const Color(0xFFE65100)
            : colors.primary;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colors.outlineVariant),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            _actionTypeIcon(action.type),
            size: 18,
            color: colors.primary,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        action.title,
                        style: text.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: priorityColor.withAlpha(25),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        action.priority == ActionPriority.high
                            ? 'Dringend'
                            : action.priority == ActionPriority.medium
                                ? 'Empfohlen'
                                : 'Optional',
                        style: TextStyle(
                          fontSize: 10,
                          color: priorityColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  action.description,
                  style: text.bodySmall?.copyWith(
                    color: colors.onSurfaceVariant,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _actionTypeLabel(action.type),
                  style: TextStyle(
                    fontSize: 10,
                    color: colors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GeneralRecommendations extends StatelessWidget {
  final ColorScheme colors;
  final TextTheme text;

  const _GeneralRecommendations({
    required this.colors,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.tips_and_updates, color: colors.primary, size: 20),
              const SizedBox(width: 8),
              Text(
                'Allgemeine Empfehlungen',
                style: text.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Diese Maßnahmen gelten unabhängig von einzelnen Geräten für Ihr gesamtes Smart Home.',
            style: text.bodySmall?.copyWith(color: colors.onSurfaceVariant),
          ),
          const SizedBox(height: 12),
          ...CatalogData.generalRecommendations.asMap().entries.map(
            (entry) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      color: colors.primaryContainer,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${entry.key + 1}',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: colors.onPrimaryContainer,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      entry.value,
                      style: text.bodySmall?.copyWith(height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: () {
              // Link to catalog – shown as informational text
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Maßnahmenkatalog: tucmi.github.io/simplications-outreach/pages/massnahmenkatalog.html',
                  ),
                  duration: Duration(seconds: 5),
                ),
              );
            },
            icon: const Icon(Icons.open_in_new, size: 16),
            label: const Text('Zum vollständigen Maßnahmenkatalog'),
          ),
        ],
      ),
    );
  }
}
