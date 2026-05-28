import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';

import '../data/catalog_data.dart';
import '../l10n/app_localizations.dart';
import '../l10n/app_localizations_key_resolver.dart';
import '../models/device.dart';
import '../models/room.dart';
import '../models/survey_state.dart';
import 'device_questionnaire_screen.dart';

const String _catalogUrl =
    'https://tucmi.github.io/simplications-outreach/pages/massnahmenkatalog.html';

class SummaryScreen extends StatefulWidget {
  final SurveyState state;

  const SummaryScreen({super.key, required this.state});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  bool _isSharing = false;

  DeviceInstance? _firstIncompleteDevice() {
    for (final device in widget.state.devices) {
      if (!device.isFullyAnswered) {
        return device;
      }
    }
    return null;
  }

  Room? _roomForId(String roomId) {
    for (final room in CatalogData.allRooms) {
      if (room.id == roomId) {
        return room;
      }
    }
    for (final room in widget.state.customRooms) {
      if (room.id == roomId) {
        return room;
      }
    }
    return null;
  }

  Room _fallbackRoomForDevice(DeviceInstance device) {
    return Room(id: device.roomId, name: device.roomName, icon: Icons.home);
  }

  void _openFirstIncompleteDevice() {
    final localizations = AppLocalizations.of(context)!;
    final device = _firstIncompleteDevice();
    if (device == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(localizations.noIncompleteDevicesLeft)),
      );
      return;
    }

    final room = _roomForId(device.roomId) ?? _fallbackRoomForDevice(device);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => DeviceQuestionnaireScreen(
          state: widget.state,
          room: room,
          instanceId: device.instanceId,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.summaryTitle),
        centerTitle: false,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          PopupMenuButton<_ShareFormat>(
            tooltip: localizations.shareResult,
            enabled: !_isSharing,
            onSelected: _shareSummary,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: _ShareFormat.text,
                child: ListTile(
                  leading: Icon(Icons.text_snippet_outlined),
                  title: Text(localizations.shareAsText),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              PopupMenuItem(
                value: _ShareFormat.pdf,
                child: ListTile(
                  leading: Icon(Icons.picture_as_pdf_outlined),
                  title: Text(localizations.shareAsPdf),
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
            label: Text(localizations.restart),
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
      body: ListenableBuilder(
        listenable: widget.state,
        builder: (context, _) {
          final report = _SummaryReport.fromDevices(widget.state.devices);
          final devices = report.devices;
          final highRisk = report.highRisk;
          final medRisk = report.mediumRisk;
          final lowRisk = report.lowRisk;
          final canContinueIncomplete = _firstIncompleteDevice() != null;

          return CustomScrollView(
            slivers: [
              // ── Overview header ──────────────────────────────────────────
              SliverToBoxAdapter(
                child: _OverviewHeader(
                  devices: devices,
                  skippedDevices: report.skippedDevices,
                  overallScore: report.overallScore,
                  dontKnowAnswers: report.dontKnowAnswers,
                  highCount: highRisk.length,
                  medCount: medRisk.length,
                  lowCount: lowRisk.length,
                  canContinueIncomplete: canContinueIncomplete,
                  onContinueIncomplete: _openFirstIncompleteDevice,
                  colors: colors,
                  text: text,
                  localizations: localizations,
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
                            localizations.noDevicesCaptured,
                            style: text.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            localizations.noDevicesHint,
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
                    label: localizations.highRisk,
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
                    label: localizations.mediumRisk,
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
                    label: localizations.lowRisk,
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
          );
        },
      ),
    );
  }

  Future<void> _shareSummary(_ShareFormat format) async {
    final localizations = AppLocalizations.of(context)!;
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
            subject: localizations.summaryShareSubject,
            text: _buildShareText(report, localizations),
            sharePositionOrigin: origin,
          ),
        );
      } else {
        final pdfBytes = await _buildSharePdf(report, localizations);
        await SharePlus.instance.share(
          ShareParams(
            subject: localizations.summaryShareSubject,
            text: localizations.summarySharePdfText,
            files: [
              XFile.fromData(
                pdfBytes,
                mimeType: 'application/pdf',
                name: localizations.summaryPdfFileName,
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
      ).showSnackBar(SnackBar(content: Text(localizations.exportFailed)));
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
  final int skippedDevices;
  final int overallScore;
  final RiskLevel overallLevel;
  final int dontKnowAnswers;

  const _SummaryReport({
    required this.devices,
    required this.highRisk,
    required this.mediumRisk,
    required this.lowRisk,
    required this.skippedDevices,
    required this.overallScore,
    required this.overallLevel,
    required this.dontKnowAnswers,
  });

  factory _SummaryReport.fromDevices(List<DeviceInstance> devices) {
    final evaluatedDevices = devices.where((d) => d.isFullyAnswered).toList();
    final skippedDevices = devices.length - evaluatedDevices.length;

    final highRisk =
        evaluatedDevices.where((d) => d.riskLevel == RiskLevel.high).toList()
          ..sort((a, b) => b.riskScore.compareTo(a.riskScore));
    final mediumRisk =
        evaluatedDevices.where((d) => d.riskLevel == RiskLevel.medium).toList()
          ..sort((a, b) => b.riskScore.compareTo(a.riskScore));
    final lowRisk =
        evaluatedDevices.where((d) => d.riskLevel == RiskLevel.low).toList()
          ..sort((a, b) => b.riskScore.compareTo(a.riskScore));

    final overallScore = evaluatedDevices.isEmpty
        ? 0
        : (() {
            final scores = evaluatedDevices.map((d) => d.riskScore);
            final mean =
                scores.reduce((a, b) => a + b) / evaluatedDevices.length;
            final max = scores.reduce((a, b) => a > b ? a : b);
            // Blend 40 % max + 60 % mean so a single high-risk device cannot
            // be fully diluted by many low-risk ones.
            return (0.4 * max + 0.6 * mean).round();
          })();

    final overallLevel = overallScore <= 33
        ? RiskLevel.low
        : overallScore <= 66
        ? RiskLevel.medium
        : RiskLevel.high;

    final dontKnowAnswers = evaluatedDevices
        .map((d) => d.dontKnowAnswerCount)
        .fold(0, (sum, count) => sum + count);

    return _SummaryReport(
      devices: List.unmodifiable(evaluatedDevices),
      highRisk: List.unmodifiable(highRisk),
      mediumRisk: List.unmodifiable(mediumRisk),
      lowRisk: List.unmodifiable(lowRisk),
      skippedDevices: skippedDevices,
      overallScore: overallScore,
      overallLevel: overallLevel,
      dontKnowAnswers: dontKnowAnswers,
    );
  }

  String overallMessage(AppLocalizations localizations) {
    final learnHint = dontKnowAnswers > 0
        ? localizations.dontKnowHint(dontKnowAnswers)
        : '';
    if (overallLevel == RiskLevel.low) {
      return '${localizations.overallLow}$learnHint';
    }
    if (overallLevel == RiskLevel.medium) {
      return '${localizations.overallMedium}$learnHint';
    }
    return '${localizations.overallHigh}$learnHint';
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

String _priorityLabel(ActionPriority priority, AppLocalizations localizations) {
  switch (priority) {
    case ActionPriority.high:
      return localizations.urgent;
    case ActionPriority.medium:
      return localizations.recommended;
    case ActionPriority.low:
      return localizations.optional;
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

String _buildShareText(_SummaryReport report, AppLocalizations localizations) {
  final buffer = StringBuffer();
  final generatedAt = _formatDate(DateTime.now());

  buffer.writeln('${localizations.appTitle} - ${localizations.summaryTitle}');
  buffer.writeln('${localizations.reportExportedAt}: $generatedAt');
  buffer.writeln();
  buffer.writeln(localizations.overview);
  buffer.writeln('${localizations.evaluatedDevices}: ${report.devices.length}');
  if (report.skippedDevices > 0) {
    buffer.writeln(localizations.skippedDevicesHint(report.skippedDevices));
  }
  buffer.writeln(
    '${localizations.overallRisk}: ${_riskLabel(report.overallLevel, localizations)} (${report.overallScore}/100)',
  );
  buffer.writeln('${localizations.highRisk}: ${report.highRisk.length}');
  buffer.writeln('${localizations.mediumRisk}: ${report.mediumRisk.length}');
  buffer.writeln('${localizations.lowRisk}: ${report.lowRisk.length}');
  if (report.devices.isNotEmpty) {
    buffer.writeln(report.overallMessage(localizations));
  }
  buffer.writeln();

  if (report.devices.isEmpty) {
    buffer.writeln(localizations.noDevicesCaptured);
    buffer.writeln(localizations.noDevicesHint);
    buffer.writeln();
  } else {
    _writeRiskSection(
      buffer,
      localizations.highRisk,
      report.highRisk,
      localizations,
    );
    _writeRiskSection(
      buffer,
      localizations.mediumRisk,
      report.mediumRisk,
      localizations,
    );
    _writeRiskSection(
      buffer,
      localizations.lowRisk,
      report.lowRisk,
      localizations,
    );
  }

  buffer.writeln(localizations.generalRecommendations);
  buffer.writeln(localizations.generalRecommendationsHint);
  for (final entry in CatalogData.generalRecommendations(
    localizations,
  ).asMap().entries) {
    buffer.writeln('${entry.key + 1}. ${entry.value}');
  }
  buffer.writeln();
  buffer.writeln('${localizations.fullCatalog}: $_catalogUrl');

  return buffer.toString().trimRight();
}

void _writeRiskSection(
  StringBuffer buffer,
  String heading,
  List<DeviceInstance> devices,
  AppLocalizations localizations,
) {
  if (devices.isEmpty) {
    return;
  }

  buffer.writeln(heading);
  for (final device in devices) {
    buffer.writeln(
      '- ${CatalogData.deviceName(localizations, device.template)} (${CatalogData.roomNameFromStored(localizations, roomId: device.roomId, storedName: device.roomName)})',
    );
    buffer.writeln(
      '  ${localizations.risk}: ${_riskLabel(device.riskLevel, localizations)} (${device.riskScore}/100)',
    );

    final actions = device.suggestedActions;
    final inherentRiskHint = device.inherentRiskHint == null
        ? null
        : localizations.resolveKey(
            device.inherentRiskHint!,
            fallback: device.inherentRiskHint!,
          );
    if (actions.isEmpty) {
      buffer.writeln('  ${_noActionMessage(device.riskLevel, localizations)}');
      if (inherentRiskHint != null) {
        buffer.writeln('  ${localizations.note}: $inherentRiskHint');
      }
    } else {
      buffer.writeln('  ${actions.length} ${localizations.recommendations}:');
      for (final action in actions) {
        buffer.writeln(
          '  - ${localizations.resolveKey(action.title, fallback: action.title)} [${_priorityLabel(action.priority, localizations)} | ${_actionTypeLabel(action.type, localizations)}]',
        );
        buffer.writeln(
          '    ${localizations.resolveKey(action.description, fallback: action.description)}',
        );
      }
    }
    buffer.writeln();
  }
}

Future<Uint8List> _buildSharePdf(
  _SummaryReport report,
  AppLocalizations localizations,
) async {
  final pdf = pw.Document();
  final generatedAt = _formatDate(DateTime.now());

  pdf.addPage(
    pw.MultiPage(
      margin: const pw.EdgeInsets.all(32),
      build: (context) => [
        pw.Text(
          '${localizations.appTitle} - ${localizations.summaryTitle}',
          style: pw.TextStyle(fontSize: 22, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 6),
        pw.Text('${localizations.reportExportedAt}: $generatedAt'),
        pw.SizedBox(height: 18),
        pw.Header(level: 1, text: localizations.overview),
        pw.Bullet(
          text: '${localizations.evaluatedDevices}: ${report.devices.length}',
        ),
        if (report.skippedDevices > 0)
          pw.Bullet(
            text: localizations.skippedDevicesHint(report.skippedDevices),
          ),
        pw.Bullet(
          text:
              '${localizations.overallRisk}: ${_riskLabel(report.overallLevel, localizations)} (${report.overallScore}/100)',
        ),
        pw.Bullet(text: '${localizations.highRisk}: ${report.highRisk.length}'),
        pw.Bullet(
          text: '${localizations.mediumRisk}: ${report.mediumRisk.length}',
        ),
        pw.Bullet(text: '${localizations.lowRisk}: ${report.lowRisk.length}'),
        if (report.devices.isNotEmpty) ...[
          pw.SizedBox(height: 8),
          pw.Text(report.overallMessage(localizations)),
        ],
        pw.SizedBox(height: 16),
        if (report.devices.isEmpty) ...[
          pw.Text(
            '${localizations.noDevicesCaptured} ${localizations.noDevicesHint}',
          ),
          pw.SizedBox(height: 16),
        ] else ...[
          ..._buildPdfRiskSection(
            localizations.highRisk,
            report.highRisk,
            localizations,
          ),
          ..._buildPdfRiskSection(
            localizations.mediumRisk,
            report.mediumRisk,
            localizations,
          ),
          ..._buildPdfRiskSection(
            localizations.lowRisk,
            report.lowRisk,
            localizations,
          ),
        ],
        pw.Header(level: 1, text: localizations.generalRecommendations),
        pw.Text(localizations.generalRecommendationsHint),
        pw.SizedBox(height: 8),
        ...CatalogData.generalRecommendations(
          localizations,
        ).asMap().entries.map(
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
        pw.Text('${localizations.fullCatalog}: $_catalogUrl'),
      ],
    ),
  );

  return pdf.save();
}

List<pw.Widget> _buildPdfRiskSection(
  String heading,
  List<DeviceInstance> devices,
  AppLocalizations localizations,
) {
  if (devices.isEmpty) {
    return const [];
  }

  return [
    pw.Header(level: 1, text: heading),
    ...devices.expand((device) {
      final actions = device.suggestedActions;
      final inherentRiskHint = device.inherentRiskHint == null
          ? null
          : localizations.resolveKey(
              device.inherentRiskHint!,
              fallback: device.inherentRiskHint!,
            );
      final widgets = <pw.Widget>[
        pw.Text(
          '${CatalogData.deviceName(localizations, device.template)} (${CatalogData.roomNameFromStored(localizations, roomId: device.roomId, storedName: device.roomName)})',
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        ),
        pw.Text(
          '${localizations.risk}: ${_riskLabel(device.riskLevel, localizations)} (${device.riskScore}/100)',
        ),
        pw.SizedBox(height: 4),
      ];

      if (actions.isEmpty) {
        widgets.add(pw.Text(_noActionMessage(device.riskLevel, localizations)));
        if (inherentRiskHint != null) {
          widgets.add(pw.SizedBox(height: 4));
          widgets.add(pw.Text('${localizations.note}: $inherentRiskHint'));
        }
      } else {
        widgets.add(
          pw.Text(
            '${actions.length} ${localizations.recommendations}:',
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
                    '- ${localizations.resolveKey(action.title, fallback: action.title)} [${_priorityLabel(action.priority, localizations)} | ${_actionTypeLabel(action.type, localizations)}]',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text(
                    localizations.resolveKey(
                      action.description,
                      fallback: action.description,
                    ),
                  ),
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

String _riskLabel(RiskLevel level, AppLocalizations localizations) {
  switch (level) {
    case RiskLevel.high:
      return localizations.highRisk;
    case RiskLevel.medium:
      return localizations.mediumRisk;
    case RiskLevel.low:
      return localizations.lowRisk;
  }
}

String _noActionMessage(RiskLevel level, AppLocalizations localizations) {
  switch (level) {
    case RiskLevel.low:
      return localizations.noActionLow;
    case RiskLevel.medium:
      return localizations.noActionMedium;
    case RiskLevel.high:
      return localizations.noActionHigh;
  }
}

String _actionTypeLabel(ActionType type, AppLocalizations localizations) {
  switch (type) {
    case ActionType.social:
      return localizations.social;
    case ActionType.technical:
      return localizations.technical;
    case ActionType.security:
      return localizations.security;
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
  final int skippedDevices;
  final int overallScore;
  final int dontKnowAnswers;
  final int highCount;
  final int medCount;
  final int lowCount;
  final bool canContinueIncomplete;
  final VoidCallback onContinueIncomplete;
  final ColorScheme colors;
  final TextTheme text;
  final AppLocalizations localizations;

  const _OverviewHeader({
    required this.devices,
    required this.skippedDevices,
    required this.overallScore,
    required this.dontKnowAnswers,
    required this.highCount,
    required this.medCount,
    required this.lowCount,
    required this.canContinueIncomplete,
    required this.onContinueIncomplete,
    required this.colors,
    required this.text,
    required this.localizations,
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
            localizations.smartHomePrivacyHeader,
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${devices.length} ${localizations.devicesRated}',
                        style: text.bodyMedium,
                      ),
                      if (skippedDevices > 0) ...[
                        const SizedBox(height: 4),
                        Text(
                          localizations.skippedDevicesHint(skippedDevices),
                          style: text.bodySmall?.copyWith(
                            color: colors.onSurfaceVariant,
                          ),
                        ),
                        if (canContinueIncomplete)
                          TextButton.icon(
                            onPressed: onContinueIncomplete,
                            icon: const Icon(
                              Icons.play_arrow_rounded,
                              size: 18,
                            ),
                            label: Text(localizations.resumeIncompleteDevice),
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.only(top: 4, bottom: 2),
                              visualDensity: VisualDensity.compact,
                            ),
                          ),
                      ],
                      const SizedBox(height: 8),
                      if (highCount > 0)
                        _RiskCount(count: highCount, level: RiskLevel.high),
                      if (medCount > 0)
                        _RiskCount(count: medCount, level: RiskLevel.medium),
                      if (lowCount > 0)
                        _RiskCount(count: lowCount, level: RiskLevel.low),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              _overallMessage(scoreLevel, dontKnowAnswers),
              style: text.bodySmall?.copyWith(
                color: colors.onSurfaceVariant,
                height: 1.4,
              ),
            ),
          ] else if (skippedDevices > 0) ...[
            Text(
              localizations.skippedDevicesHint(skippedDevices),
              style: text.bodySmall?.copyWith(color: colors.onSurfaceVariant),
            ),
            if (canContinueIncomplete)
              TextButton.icon(
                onPressed: onContinueIncomplete,
                icon: const Icon(Icons.play_arrow_rounded, size: 18),
                label: Text(localizations.resumeIncompleteDevice),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.only(top: 6, bottom: 2),
                  visualDensity: VisualDensity.compact,
                ),
              ),
          ],
        ],
      ),
    );
  }

  String _overallMessage(RiskLevel level, int dontKnowCount) {
    final learnHint = dontKnowCount > 0
        ? localizations.dontKnowHint(dontKnowCount)
        : '';
    if (level == RiskLevel.low) {
      return '${localizations.overallLow}$learnHint';
    } else if (level == RiskLevel.medium) {
      return '${localizations.overallMedium}$learnHint';
    } else {
      return '${localizations.overallHigh}$learnHint';
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
          '$count × ${_riskLabel(level, AppLocalizations.of(context)!)}',
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
    final localizations = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final device = widget.device;
    final level = device.riskLevel;
    final color = _riskColor(level);
    final bg = _riskBg(level);
    final actions = device.suggestedActions;
    final inherentRiskHint = device.inherentRiskHint == null
        ? null
        : localizations.resolveKey(
            device.inherentRiskHint!,
            fallback: device.inherentRiskHint!,
          );
    final noActionColor = level == RiskLevel.low
        ? _riskColor(RiskLevel.low)
        : color;
    final noActionIcon = level == RiskLevel.low
        ? Icons.check_circle
        : Icons.info_outline;

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
                          CatalogData.deviceName(
                            localizations,
                            device.template,
                          ),
                          style: text.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          CatalogData.roomNameFromStored(
                            localizations,
                            roomId: device.roomId,
                            storedName: device.roomName,
                          ),
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
                          _riskLabel(level, localizations),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${localizations.risk}: ${device.riskScore}/100',
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
            _ScoreBreakdown(device: device),
            if (actions.isEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(noActionIcon, size: 16, color: noActionColor),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            _noActionMessage(level, localizations),
                            style: text.bodySmall?.copyWith(
                              color: noActionColor,
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
                  '${actions.length} ${localizations.recommendations}:',
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

class _ScoreBreakdown extends StatefulWidget {
  final DeviceInstance device;

  const _ScoreBreakdown({required this.device});

  @override
  State<_ScoreBreakdown> createState() => _ScoreBreakdownState();
}

class _ScoreBreakdownState extends State<_ScoreBreakdown> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final factors = widget.device.scoringFactors;
    if (factors.isEmpty) return const SizedBox.shrink();

    final colors = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final riskColor = _riskColor(widget.device.riskLevel);

    return Container(
      margin: const EdgeInsets.fromLTRB(14, 0, 14, 10),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(140),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: riskColor.withAlpha(60)),
      ),
      child: Column(
        children: [
          // Toggle row
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () => setState(() => _expanded = !_expanded),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
              child: Row(
                children: [
                  Icon(
                    Icons.calculate_outlined,
                    size: 14,
                    color: colors.onSurfaceVariant,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      localizations.howRiskCalculated,
                      style: text.labelSmall?.copyWith(
                        color: colors.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Icon(
                    _expanded ? Icons.expand_less : Icons.expand_more,
                    size: 16,
                    color: colors.onSurfaceVariant,
                  ),
                ],
              ),
            ),
          ),
          // Expanded factor list
          if (_expanded) ...[
            Divider(height: 1, thickness: 1, color: riskColor.withAlpha(40)),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${localizations.totalScore}: ${widget.device.riskScore}/100',
                        style: text.labelSmall?.copyWith(
                          color: riskColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  ...factors.map((f) => _FactorRow(factor: f, text: text)),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _FactorRow extends StatelessWidget {
  final ScoringFactor factor;
  final TextTheme text;

  const _FactorRow({required this.factor, required this.text});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final Color chipColor;
    final IconData icon;

    if (factor.isBaseRisk) {
      chipColor = const Color(0xFF5C6BC0);
      icon = Icons.device_hub_outlined;
    } else if (factor.isDontKnow) {
      chipColor = const Color(0xFFE65100);
      icon = Icons.help_outline;
    } else {
      chipColor = const Color(0xFFC62828);
      icon = Icons.cancel_outlined;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 1),
            child: Icon(icon, size: 14, color: chipColor),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              localizations.resolveKey(factor.label, fallback: factor.label),
              style: text.bodySmall?.copyWith(height: 1.3),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: chipColor.withAlpha(20),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              '+${factor.penalty}',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: chipColor,
              ),
            ),
          ),
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
    final localizations = AppLocalizations.of(context)!;
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
                        localizations.resolveKey(
                          action.title,
                          fallback: action.title,
                        ),
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
                            ? localizations.urgent
                            : action.priority == ActionPriority.medium
                            ? localizations.recommended
                            : localizations.optional,
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
                  localizations.resolveKey(
                    action.description,
                    fallback: action.description,
                  ),
                  style: text.bodySmall?.copyWith(
                    color: colors.onSurfaceVariant,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _actionTypeLabel(action.type, localizations),
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
    final localizations = AppLocalizations.of(context)!;
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
                localizations.generalRecommendations,
                style: text.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            localizations.generalRecommendationsHint,
            style: text.bodySmall?.copyWith(color: colors.onSurfaceVariant),
          ),
          const SizedBox(height: 12),
          ...CatalogData.generalRecommendations(
            localizations,
          ).asMap().entries.map(
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
                SnackBar(
                  content: Text(
                    '${localizations.catalogSnackBarPrefix}: $_catalogUrl',
                  ),
                  duration: Duration(seconds: 5),
                ),
              );
            },
            icon: const Icon(Icons.open_in_new, size: 16),
            label: Text(localizations.catalogButton),
          ),
        ],
      ),
    );
  }
}
