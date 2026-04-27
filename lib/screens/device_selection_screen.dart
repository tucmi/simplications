import 'package:flutter/material.dart';
import '../data/catalog_data.dart';
import '../models/device.dart';
import '../models/room.dart';
import '../models/survey_state.dart';
import '../widgets/wizard_progress_bar.dart';
import '../widgets/custom_add_dialogs.dart';
import 'device_questionnaire_screen.dart';
import 'room_evaluation_screen.dart';

class DeviceSelectionScreen extends StatelessWidget {
  final SurveyState state;
  final Room room;

  const DeviceSelectionScreen({
    super.key,
    required this.state,
    required this.room,
  });

  Room get currentRoom => room;

  Future<void> _showAddDeviceDialog(BuildContext context) async {
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (context) => const CustomDeviceDialog(),
    );

    if (result != null && context.mounted) {
      state.addCustomDevice(
        result['name'] as String,
        result['icon'] as IconData,
        result['riskScore'] as int,
        hasCamera: result['hasCamera'] as bool,
        hasMicrophone: result['hasMicrophone'] as bool,
      );
    }
  }

  void _onNext(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => RoomEvaluationScreen(
          state: state,
          room: currentRoom,
        ),
      ),
    );
  }

  void _removeCustomDevice(BuildContext context, String deviceId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Gerät löschen?'),
        content: const Text('Dieses benutzerdefinierte Gerät wird gelöscht. Alle verknüpften Instanzen werden auch entfernt.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Abbrechen'),
          ),
          TextButton(
            onPressed: () {
              state.removeCustomDevice(deviceId);
              Navigator.pop(context);
            },
            child: const Text('Löschen', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final availableDevices = CatalogData.devicesForRoom(currentRoom.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Geräte: ${currentRoom.name}',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(6),
          child: const WizardProgressBar(current: 2, total: 4),
        ),
      ),
      body: ListenableBuilder(
        listenable: state,
        builder: (context, _) {
          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: colors.primaryContainer,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              currentRoom.icon,
                              color: colors.primary,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Raum-Check',
                                style: text.labelMedium?.copyWith(
                                  color: colors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                currentRoom.name,
                                style: text.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Welche smarten Geräte nutzen Sie in diesem Raum?',
                        style: text.titleSmall?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Tippen Sie auf ein Gerät, um die Sicherheitsfragen dafür zu beantworten.',
                        style: text.bodySmall?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              if (availableDevices.isEmpty)
                SliverPadding(
                  padding: const EdgeInsets.all(32),
                  sliver: SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        'Keine bekannten Geräte für diesen Raum.',
                        style: text.bodyMedium?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ),
                )
              else
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.6,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        // Get all devices (catalog + custom)
                        final allDevices = [
                          ...availableDevices,
                          ...state.customDevices,
                        ];
                        
                        // Last item is "Add custom device" button
                        if (index == allDevices.length) {
                          return _AddDeviceCard(
                            onTap: () => _showAddDeviceDialog(context),
                          );
                        }
                        
                        final device = allDevices[index];
                        final isAdded = state.isDeviceAdded(
                          currentRoom.id,
                          device.id,
                        );
                        final instances = state
                            .devicesForRoom(currentRoom.id)
                            .where((i) => i.template.id == device.id);
                        final isCompleted = instances.isNotEmpty &&
                            instances.first.isFullyAnswered;
                        final isCustom = state.customDevices.contains(device);

                        return _DeviceCard(
                          device: device,
                          isAdded: isAdded,
                          isCompleted: isCompleted,
                          isCustom: isCustom,
                          onTap: () {
                            state.addDevice(
                              device,
                              currentRoom.id,
                              currentRoom.name,
                            );
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => DeviceQuestionnaireScreen(
                                  state: state,
                                  room: currentRoom,
                                  instanceId: '${currentRoom.id}_${device.id}',
                                ),
                              ),
                            );
                          },
                          onRemove: isCustom
                              ? () => _removeCustomDevice(context, device.id)
                              : null,
                        );
                      },
                      childCount: availableDevices.length + 
                          state.customDevices.length + 
                          1, // +1 for "Add" button
                    ),
                  ),
                ),
              const SliverToBoxAdapter(child: SizedBox(height: 100)),
            ],
          );
        },
      ),
      bottomNavigationBar: _BottomBar(
        onNext: () => _onNext(context),
        state: state,
        currentRoomId: currentRoom.id,
      ),
    );
  }
}

class _DeviceCard extends StatelessWidget {
  final DeviceTemplate device;
  final bool isAdded;
  final bool isCompleted;
  final bool isCustom;
  final VoidCallback onTap;
  final VoidCallback? onRemove;

  const _DeviceCard({
    required this.device,
    required this.isAdded,
    required this.isCompleted,
    required this.isCustom,
    required this.onTap,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final contentColor = isCompleted
        ? colors.onSurface.withValues(alpha: 0.35)
        : colors.onSurfaceVariant;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        decoration: BoxDecoration(
          color: isCompleted
              ? colors.surfaceContainerLow
              : colors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isCompleted
                ? Colors.transparent
                : (isCustom ? colors.tertiaryContainer : Colors.transparent),
            width: 2,
          ),
        ),
        padding: const EdgeInsets.all(12),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(device.icon, size: 22, color: contentColor),
                    const Spacer(),
                    if (device.hasCamera && !isCompleted)
                      Tooltip(
                        message: 'Kamera',
                        child: Icon(Icons.videocam, size: 14, color: contentColor),
                      ),
                    if (device.hasMicrophone && !isCompleted)
                      Tooltip(
                        message: 'Mikrofon',
                        child: Icon(Icons.mic, size: 14, color: contentColor),
                      ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  device.name,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: contentColor,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            if (isCompleted)
              const Positioned(
                top: 0,
                right: 0,
                child: Icon(Icons.check_circle, size: 18, color: Colors.green),
              ),
            if (isCustom && onRemove != null)
              Positioned(
                top: 0,
                right: isCompleted ? 22 : 0,
                child: GestureDetector(
                  onTap: onRemove,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red.shade400,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(4),
                    child: const Icon(
                      Icons.close,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _AddDeviceCard extends StatelessWidget {
  final VoidCallback onTap;

  const _AddDeviceCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: colors.primary.withValues(alpha: 0.5),
            width: 2,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              size: 32,
              color: colors.primary,
            ),
            const SizedBox(height: 6),
            Text(
              'Gerät\nhinzufügen',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: colors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  final VoidCallback onNext;
  final SurveyState state;
  final String currentRoomId;

  const _BottomBar({
    required this.onNext,
    required this.state,
    required this.currentRoomId,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: state,
      builder: (context, _) {
        final roomDeviceCount = state.devicesForRoom(currentRoomId).length;
        final label =
            roomDeviceCount == 0
                ? 'Raum ohne Geräte auswerten →'
                : 'Raum auswerten →';
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: onNext,
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
