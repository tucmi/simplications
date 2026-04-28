import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';

import '../data/catalog_data.dart';
import '../models/device.dart';
import '../models/survey_state.dart';

const String _catalogUrl =
    'tucmi.github.io/simplications-outreach/pages/massnahmenkatalog.html';

class SummaryScreen extends StatefulWidget {
  final SurveyState state;

  const SummaryScreen({super.key, required this.state});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  bool _isSharing = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final report = _SummaryReport.fromDevices(widget.state.devices);
    final devices = report.devices;
    final highRisk = report.highRisk;
    final medRisk = report.mediumRisk;
    final lowRisk = report.lowRisk;

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
          PopupMenuButton<_ShareFormat>(
            tooltip: 'Ergebnis teilen',
            enabled: !_isSharing,
            onSelected: _shareSummary,
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: _ShareFormat.text,
                child: ListTile(
                  leading: Icon(Icons.text_snippet_outlined),
                  title: Text('Als Text teilen'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              PopupMenuItem(
                value: _ShareFormat.pdf,
                child: ListTile(
                  leading: Icon(Icons.picture_as_pdf_outlined),
                  title: Text('Als PDF teilen'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  if (_isSharing)
                    const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  else
                    const Icon(Icons.share_outlined),
                ],
              ),
            ),
          ),
          TextButton.icon(
            icon: const Icon(Icons.restart_alt, size: 18),
            label: const Text('Neu starten'),
            onPressed: () async {
              await widget.state.reset();
              if (!context.mounted) {
                return;
              }
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
              overallScore: report.overallScore,
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
                      Text('Keine Geräte erfasst.', style: text.titleMedium),
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

  Future<void> _shareSummary(_ShareFormat format) async {
    if (_isSharing) {
      return;
    }

    setState(() => _isSharing = true);

    try {
      final report = _SummaryReport.fromDevices(widget.state.devices);
      final origin = _sharePositionOrigin(context);

      if (format == _ShareFormat.text) {
        await SharePlus.instance.share(
          ShareParams(
            subject: 'Simplications Ergebnis',
            text: _buildShareText(report),
            sharePositionOrigin: origin,
          ),
        );
      } else {
        final pdfBytes = await _buildSharePdf(report);
        await SharePlus.instance.share(
          ShareParams(
            subject: 'Simplications Ergebnis',
            text: 'Simplications Ergebnisbericht als PDF',
            files: [
              XFile.fromData(
                pdfBytes,
                mimeType: 'application/pdf',
                name: 'simplications-ergebnis.pdf',
              ),
            ],
            sharePositionOrigin: origin,
          ),
        );
      }
    } catch (error) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Export fehlgeschlagen: $error')));
    } finally {
      if (mounted) {
        setState(() => _isSharing = false);
      }
    }
  }
}

// ── Helper ──────────────────────────────────────────────────────────────────

enum _ShareFormat { text, pdf }

class _SummaryReport {
  final List<DeviceInstance> devices;
  final List<DeviceInstance> highRisk;
  final List<DeviceInstance> mediumRisk;
  final List<DeviceInstance> lowRisk;
  final int overallScore;
  final RiskLevel overallLevel;

  const _SummaryReport({
    required this.devices,
    required this.highRisk,
    required this.mediumRisk,
    required this.lowRisk,
    required this.overallScore,
    required this.overallLevel,
  });

  factory _SummaryReport.fromDevices(List<DeviceInstance> devices) {
    final highRisk =
        devices.where((d) => d.riskLevel == RiskLevel.high).toList()
          ..sort((a, b) => b.riskScore.compareTo(a.riskScore));
    final mediumRisk =
        devices.where((d) => d.riskLevel == RiskLevel.medium).toList()
          ..sort((a, b) => b.riskScore.compareTo(a.riskScore));
    final lowRisk = devices.where((d) => d.riskLevel == RiskLevel.low).toList()
      ..sort((a, b) => b.riskScore.compareTo(a.riskScore));

    final overallScore = devices.isEmpty
        ? 0
        : (devices.map((d) => d.riskScore).reduce((a, b) => a + b) /
                  devices.length)
              .round();

    final overallLevel = overallScore <= 33
        ? RiskLevel.low
        : overallScore <= 66
        ? RiskLevel.medium
        : RiskLevel.high;

    return _SummaryReport(
      devices: List.unmodifiable(devices),
      highRisk: List.unmodifiable(highRisk),
      mediumRisk: List.unmodifiable(mediumRisk),
      lowRisk: List.unmodifiable(lowRisk),
      overallScore: overallScore,
      overallLevel: overallLevel,
    );
  }

  String get overallMessage {
    if (overallLevel == RiskLevel.low) {
      return 'Gut gemacht! Ihre Geräte sind überwiegend sicher konfiguriert. Schauen Sie trotzdem in die allgemeinen Empfehlungen.';
    }
    if (overallLevel == RiskLevel.medium) {
      return 'Es gibt Verbesserungspotenzial. Schauen Sie sich die Empfehlungen zu den einzelnen Geräten an.';
    }
    return 'Mehrere Geräte haben erhebliche Datenschutzrisiken. Bitte setzen Sie die Maßnahmen mit hoher Priorität zeitnah um.';
  }
}

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

String _priorityLabel(ActionPriority priority) {
  switch (priority) {
    case ActionPriority.high:
      return 'Dringend';
    case ActionPriority.medium:
      return 'Empfohlen';
    case ActionPriority.low:
      return 'Optional';
  }
}

Rect? _sharePositionOrigin(BuildContext context) {
  final box = context.findRenderObject() as RenderBox?;
  if (box == null) {
    return null;
  }
  return box.localToGlobal(Offset.zero) & box.size;
}

String _formatDate(DateTime value) {
  final day = value.day.toString().padLeft(2, '0');
  final month = value.month.toString().padLeft(2, '0');
  final year = value.year.toString();
  final hour = value.hour.toString().padLeft(2, '0');
  final minute = value.minute.toString().padLeft(2, '0');
  return '$day.$month.$year, $hour:$minute';
}

String _buildShareText(_SummaryReport report) {
  final buffer = StringBuffer();
  final generatedAt = _formatDate(DateTime.now());

  buffer.writeln('Simplications - Ihr Ergebnis');
  buffer.writeln('Exportiert am: $generatedAt');
  buffer.writeln();
  buffer.writeln('Übersicht');
  buffer.writeln('Bewertete Geräte: ${report.devices.length}');
  buffer.writeln(
    'Gesamtrisiko: ${_riskLabel(report.overallLevel)} (${report.overallScore}/100)',
  );
  buffer.writeln('Hohes Risiko: ${report.highRisk.length}');
  buffer.writeln('Mittleres Risiko: ${report.mediumRisk.length}');
  buffer.writeln('Niedriges Risiko: ${report.lowRisk.length}');
  if (report.devices.isNotEmpty) {
    buffer.writeln(report.overallMessage);
  }
  buffer.writeln();

  if (report.devices.isEmpty) {
    buffer.writeln('Keine Geräte erfasst.');
    buffer.writeln(
      'Starten Sie erneut und fügen Sie Geräte hinzu, um eine Bewertung zu erhalten.',
    );
    buffer.writeln();
  } else {
    _writeRiskSection(buffer, 'Hohes Risiko', report.highRisk);
    _writeRiskSection(buffer, 'Mittleres Risiko', report.mediumRisk);
    _writeRiskSection(buffer, 'Niedriges Risiko', report.lowRisk);
  }

  buffer.writeln('Allgemeine Empfehlungen');
  buffer.writeln(
    'Diese Maßnahmen gelten unabhängig von einzelnen Geräten für Ihr gesamtes Smart Home.',
  );
  for (final entry in CatalogData.generalRecommendations.asMap().entries) {
    buffer.writeln('${entry.key + 1}. ${entry.value}');
  }
  buffer.writeln();
  buffer.writeln('Vollständiger Maßnahmenkatalog: $_catalogUrl');

  return buffer.toString().trimRight();
}

void _writeRiskSection(
  StringBuffer buffer,
  String heading,
  List<DeviceInstance> devices,
) {
  if (devices.isEmpty) {
    return;
  }

  buffer.writeln(heading);
  for (final device in devices) {
    buffer.writeln('- ${device.template.name} (${device.roomName})');
    buffer.writeln(
      '  Risiko: ${_riskLabel(device.riskLevel)} (${device.riskScore}/100)',
    );

    final actions = device.suggestedActions;
    final inherentRiskHint = device.inherentRiskHint;
    if (actions.isEmpty) {
      buffer.writeln('  Alles in Ordnung - keine Maßnahmen erforderlich.');
      if (inherentRiskHint != null) {
        buffer.writeln('  Hinweis: $inherentRiskHint');
      }
    } else {
      buffer.writeln(
        '  ${actions.length} Empfehlung${actions.length == 1 ? '' : 'en'}:',
      );
      for (final action in actions) {
        buffer.writeln(
          '  - ${action.title} [${_priorityLabel(action.priority)} | ${_actionTypeLabel(action.type)}]',
        );
        buffer.writeln('    ${action.description}');
      }
    }
    buffer.writeln();
  }
}

Future<Uint8List> _buildSharePdf(_SummaryReport report) async {
  final pdf = pw.Document();
  final generatedAt = _formatDate(DateTime.now());

  pdf.addPage(
    pw.MultiPage(
      margin: const pw.EdgeInsets.all(32),
      build: (context) => [
        pw.Text(
          'Simplications - Ihr Ergebnis',
          style: pw.TextStyle(fontSize: 22, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 6),
        pw.Text('Exportiert am: $generatedAt'),
        pw.SizedBox(height: 18),
        pw.Header(level: 1, text: 'Übersicht'),
        pw.Bullet(text: 'Bewertete Geräte: ${report.devices.length}'),
        pw.Bullet(
          text:
              'Gesamtrisiko: ${_riskLabel(report.overallLevel)} (${report.overallScore}/100)',
        ),
        pw.Bullet(text: 'Hohes Risiko: ${report.highRisk.length}'),
        pw.Bullet(text: 'Mittleres Risiko: ${report.mediumRisk.length}'),
        pw.Bullet(text: 'Niedriges Risiko: ${report.lowRisk.length}'),
        if (report.devices.isNotEmpty) ...[
          pw.SizedBox(height: 8),
          pw.Text(report.overallMessage),
        ],
        pw.SizedBox(height: 16),
        if (report.devices.isEmpty) ...[
          pw.Text(
            'Keine Geräte erfasst. Starten Sie erneut und fügen Sie Geräte hinzu, um eine Bewertung zu erhalten.',
          ),
          pw.SizedBox(height: 16),
        ] else ...[
          ..._buildPdfRiskSection('Hohes Risiko', report.highRisk),
          ..._buildPdfRiskSection('Mittleres Risiko', report.mediumRisk),
          ..._buildPdfRiskSection('Niedriges Risiko', report.lowRisk),
        ],
        pw.Header(level: 1, text: 'Allgemeine Empfehlungen'),
        pw.Text(
          'Diese Maßnahmen gelten unabhängig von einzelnen Geräten für Ihr gesamtes Smart Home.',
        ),
        pw.SizedBox(height: 8),
        ...CatalogData.generalRecommendations.asMap().entries.map(
          (entry) => pw.Padding(
            padding: const pw.EdgeInsets.only(bottom: 6),
            child: pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('${entry.key + 1}. '),
                pw.Expanded(child: pw.Text(entry.value)),
              ],
            ),
          ),
        ),
        pw.SizedBox(height: 12),
        pw.Text('Vollständiger Maßnahmenkatalog: $_catalogUrl'),
      ],
    ),
  );

  return pdf.save();
}

List<pw.Widget> _buildPdfRiskSection(
  String heading,
  List<DeviceInstance> devices,
) {
  if (devices.isEmpty) {
    return const [];
  }

  return [
    pw.Header(level: 1, text: heading),
    ...devices.expand((device) {
      final actions = device.suggestedActions;
      final inherentRiskHint = device.inherentRiskHint;
      final widgets = <pw.Widget>[
        pw.Text(
          '${device.template.name} (${device.roomName})',
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        ),
        pw.Text(
          'Risiko: ${_riskLabel(device.riskLevel)} (${device.riskScore}/100)',
        ),
        pw.SizedBox(height: 4),
      ];

      if (actions.isEmpty) {
        widgets.add(
          pw.Text('Alles in Ordnung - keine Maßnahmen erforderlich.'),
        );
        if (inherentRiskHint != null) {
          widgets.add(pw.SizedBox(height: 4));
          widgets.add(pw.Text('Hinweis: $inherentRiskHint'));
        }
      } else {
        widgets.add(
          pw.Text(
            '${actions.length} Empfehlung${actions.length == 1 ? '' : 'en'}:',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
          ),
        );
        widgets.addAll(
          actions.map(
            (action) => pw.Padding(
              padding: const pw.EdgeInsets.only(top: 4, left: 8),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    '- ${action.title} [${_priorityLabel(action.priority)} | ${_actionTypeLabel(action.type)}]',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text(action.description),
                ],
              ),
            ),
          ),
        );
      }

      widgets.add(pw.SizedBox(height: 12));
      return widgets;
    }),
  ];
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
          colors: [colors.primaryContainer, colors.secondaryContainer],
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
                          style: TextStyle(fontSize: 10, color: scoreColor),
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
                      _RiskCount(count: highCount, level: RiskLevel.high),
                    if (medCount > 0)
                      _RiskCount(count: medCount, level: RiskLevel.medium),
                    if (lowCount > 0)
                      _RiskCount(count: lowCount, level: RiskLevel.low),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              _overallMessage(scoreLevel),
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

  String _overallMessage(RiskLevel level) {
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
    final inherentRiskHint = device.inherentRiskHint;

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.check_circle,
                          size: 16,
                          color: _riskColor(RiskLevel.low),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Alles in Ordnung – keine Maßnahmen erforderlich.',
                            style: text.bodySmall?.copyWith(
                              color: _riskColor(RiskLevel.low),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (inherentRiskHint != null) ...[
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(180),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: color.withAlpha(80)),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.info_outline, size: 16, color: color),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                inherentRiskHint,
                                style: text.bodySmall?.copyWith(
                                  color: colors.onSurfaceVariant,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
          Icon(_actionTypeIcon(action.type), size: 18, color: colors.primary),
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

  const _GeneralRecommendations({required this.colors, required this.text});

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
                  content: Text('Maßnahmenkatalog: $_catalogUrl'),
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
