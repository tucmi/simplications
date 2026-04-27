import 'package:flutter/material.dart';
import '../models/device.dart';
import '../models/room.dart';
import '../models/survey_state.dart';
import '../widgets/wizard_progress_bar.dart';
import 'room_selection_screen.dart';

class RoomEvaluationScreen extends StatelessWidget {
  final SurveyState state;
  final Room room;

  const RoomEvaluationScreen({
    super.key,
    required this.state,
    required this.room,
  });

  Room get currentRoom => room;

  void _onNext(BuildContext context) {
    state.markRoomCompleted(currentRoom.id);

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => RoomSelectionScreen(state: state),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final roomDevices = state.devicesForRoom(currentRoom.id);
    final highRisk =
        roomDevices.where((d) => d.riskLevel == RiskLevel.high).toList();
    final mediumRisk =
        roomDevices.where((d) => d.riskLevel == RiskLevel.medium).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Auswertung: ${currentRoom.name}'),
        centerTitle: false,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(6),
          child: WizardProgressBar(current: 4, total: 4),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
            sliver: SliverToBoxAdapter(
              child: _RoomOverview(
                roomName: currentRoom.name,
                deviceCount: roomDevices.length,
                highRiskCount: highRisk.length,
                mediumRiskCount: mediumRisk.length,
              ),
            ),
          ),
          if (roomDevices.isEmpty)
            const SliverPadding(
              padding: EdgeInsets.all(20),
              sliver: SliverToBoxAdapter(
                child: _InfoCard(
                  title: 'Keine Smart-Home-Geräte im Raum erfasst',
                  description:
                      'Für diesen Raum wurden keine Geräte ausgewählt. Sie können im nächsten Raum fortfahren.',
                  icon: Icons.info_outline,
                ),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final device = roomDevices[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: _DeviceIssueCard(device: device),
                  );
                }, childCount: roomDevices.length),
              ),
            ),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
          child: SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () => _onNext(context),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                'Zurück zur Raumauswahl →',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RoomOverview extends StatelessWidget {
  final String roomName;
  final int deviceCount;
  final int highRiskCount;
  final int mediumRiskCount;

  const _RoomOverview({
    required this.roomName,
    required this.deviceCount,
    required this.highRiskCount,
    required this.mediumRiskCount,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Raum-Check abgeschlossen',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 6),
          Text(
            roomName,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colors.onPrimaryContainer,
                ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _Badge(
                label: '$deviceCount Geräte',
                color: colors.primary,
              ),
              _Badge(
                label: '$highRiskCount hohes Risiko',
                color: const Color(0xFFC62828),
              ),
              _Badge(
                label: '$mediumRiskCount mittleres Risiko',
                color: const Color(0xFFE65100),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;
  final Color color;

  const _Badge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withAlpha(25),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const _InfoCard({
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: colors.primary),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colors.onSurfaceVariant,
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

class _DeviceIssueCard extends StatelessWidget {
  final DeviceInstance device;

  const _DeviceIssueCard({required this.device});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final actions = device.suggestedActions;

    return Card(
      elevation: 0,
      color: colors.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: colors.outlineVariant),
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        childrenPadding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
        title: Text(
          device.template.name,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          'Risiko: ${device.riskScore}/100 • ${_riskLabel(device.riskLevel)}',
          style: TextStyle(color: _riskColor(device.riskLevel)),
        ),
        leading: Icon(device.template.icon, color: colors.primary),
        children: [
          if (actions.isEmpty)
            const _InfoCard(
              title: 'Keine Probleme erkannt',
              description:
                  'Für dieses Gerät wurden keine unmittelbaren Maßnahmen erkannt.',
              icon: Icons.check_circle_outline,
            )
          else
            ...actions.map(
              (action) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: _ActionRow(action: action),
              ),
            ),
        ],
      ),
    );
  }
}

class _ActionRow extends StatelessWidget {
  final PrivacyAction action;

  const _ActionRow({required this.action});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colors.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            action.title,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            action.description,
            style: TextStyle(
              color: colors.onSurfaceVariant,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
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
