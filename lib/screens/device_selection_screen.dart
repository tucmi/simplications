import 'package:flutter/material.dart';
import '../data/catalog_data.dart';
import '../l10n/app_localizations.dart';
import '../models/device.dart';
import '../models/room.dart';
import '../models/survey_state.dart';
import '../widgets/custom_add_dialogs.dart';
import 'device_questionnaire_screen.dart';
import 'summary_screen.dart';

class DeviceSelectionScreen extends StatelessWidget {
  final SurveyState state;
  final Room room;

  const DeviceSelectionScreen({
    super.key,
    required this.state,
    required this.room,
  });

  Future<void> _showAddDeviceDialog(BuildContext context) async {
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (context) => const CustomDeviceDialog(),
    );

    if (result != null && context.mounted) {
      state.addCustomDevice(
        room.id,
        result['name'] as String,
        result['icon'] as IconData,
        result['riskScore'] as int,
        hasCamera: result['hasCamera'] as bool,
        hasMicrophone: result['hasMicrophone'] as bool,
      );
    }
  }

  Future<void> _markNoDevice(BuildContext context) async {
    final localizations = AppLocalizations.of(context)!;
    final hasExistingDevices = state.devicesForRoom(room.id).isNotEmpty;
    final shouldMarkNoDevice = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(localizations.noDeviceDialogTitle),
        content: Text(
          hasExistingDevices
              ? localizations.noDeviceDialogBodyWithExisting
              : localizations.noDeviceDialogBody,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(localizations.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(localizations.confirm),
          ),
        ],
      ),
    );

    if (shouldMarkNoDevice != true || !context.mounted) {
      return;
    }

    state.markRoomWithoutDevices(room.id);
    Navigator.of(context).pop();
  }

  void _onNext(BuildContext context) {
    state.markRoomCompleted(room.id);
    Navigator.of(context).pop();
  }

  void _onFinish(BuildContext context) {
    state.markRoomCompleted(room.id);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => SummaryScreen(state: state)),
    );
  }

  void _removeCustomDevice(BuildContext context, String deviceId) {
    final localizations = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(localizations.deleteDeviceTitle),
        content: Text(localizations.deleteDeviceBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(localizations.cancel),
          ),
          TextButton(
            onPressed: () {
              state.removeCustomDevice(deviceId);
              Navigator.pop(context);
            },
            child: Text(
              localizations.delete,
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final localizations = AppLocalizations.of(context)!;
    final isCustomRoom = state.customRooms.any((r) => r.id == room.id);
    final catalogDevices = isCustomRoom
        ? CatalogData.sortedDeviceTemplates(CatalogData.allDeviceTemplates)
        : CatalogData.devicesForRoom(room.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${localizations.deviceTitlePrefix}: ${CatalogData.roomName(localizations, room)}',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
      ),
      body: ListenableBuilder(
        listenable: state,
        builder: (context, _) {
          final customDevices = state.customDevicesForRoom(room.id);
          final allDevices = [...catalogDevices, ...customDevices];
          final isNoDeviceSelected = state.noDeviceRoomIds.contains(room.id);

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
                              room.icon,
                              color: colors.primary,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                localizations.roomCheck,
                                style: text.labelMedium?.copyWith(
                                  color: colors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                CatalogData.roomName(localizations, room),
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
                        localizations.deviceQuestion,
                        style: text.titleSmall?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        localizations.deviceQuestionHint,
                        style: text.bodySmall?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              if (allDevices.isEmpty)
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      localizations.noKnownDevices,
                      style: text.bodyMedium?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  ),
                ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 220,
                    childAspectRatio: 2.2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  delegate: SliverChildBuilderDelegate((context, index) {
                    if (index == allDevices.length) {
                      return _NoDeviceCard(
                        isSelected: isNoDeviceSelected,
                        onTap: () => _markNoDevice(context),
                      );
                    }

                    // Last item is "Add custom device" button
                    if (index == allDevices.length + 1) {
                      return _AddDeviceCard(
                        onTap: () => _showAddDeviceDialog(context),
                      );
                    }

                    final device = allDevices[index];
                    final isAdded = state.isDeviceAdded(room.id, device.id);
                    final instances = state
                        .devicesForRoom(room.id)
                        .where((i) => i.template.id == device.id);
                    final isCompleted =
                        instances.isNotEmpty && instances.first.isFullyAnswered;
                    final isCustom = customDevices.contains(device);

                    return _DeviceCard(
                      device: device,
                      isAdded: isAdded,
                      isCompleted: isCompleted,
                      isCustom: isCustom,
                      onTap: () {
                        state.addDevice(device, room.id, room.name);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => DeviceQuestionnaireScreen(
                              state: state,
                              room: room,
                              instanceId: '${room.id}_${device.id}',
                            ),
                          ),
                        );
                      },
                      onRemove: isCustom
                          ? () => _removeCustomDevice(context, device.id)
                          : null,
                    );
                  }, childCount: allDevices.length + 2),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 100)),
            ],
          );
        },
      ),
      bottomNavigationBar: _BottomBar(
        onNext: () => _onNext(context),
        onFinish: () => _onFinish(context),
        state: state,
        currentRoomId: room.id,
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
    final localizations = AppLocalizations.of(context)!;
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
        padding: const EdgeInsets.all(8),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(device.icon, size: 20, color: contentColor),
                    const Spacer(),
                    if (device.hasCamera && !isCompleted)
                      Tooltip(
                        message: localizations.camera,
                        child: Icon(
                          Icons.videocam,
                          size: 12,
                          color: contentColor,
                        ),
                      ),
                    if (device.hasMicrophone && !isCompleted)
                      Tooltip(
                        message: localizations.microphone,
                        child: Icon(Icons.mic, size: 12, color: contentColor),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  CatalogData.deviceName(localizations, device),
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
                child: Icon(Icons.check_circle, size: 16, color: Colors.green),
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
    final localizations = AppLocalizations.of(context)!;

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
            Icon(Icons.add, size: 28, color: colors.primary),
            const SizedBox(height: 4),
            Text(
              localizations.addDevice,
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

class _NoDeviceCard extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const _NoDeviceCard({required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final localizations = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? colors.secondaryContainer
              : colors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? colors.secondary : colors.outlineVariant,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSelected ? Icons.check_circle_outline : Icons.block_outlined,
              size: 28,
              color: isSelected ? colors.secondary : colors.onSurfaceVariant,
            ),
            const SizedBox(height: 4),
            Text(
              localizations.noDevice,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: isSelected ? colors.secondary : colors.onSurfaceVariant,
                fontWeight: FontWeight.w700,
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
  final VoidCallback onFinish;
  final SurveyState state;
  final String currentRoomId;

  const _BottomBar({
    required this.onNext,
    required this.onFinish,
    required this.state,
    required this.currentRoomId,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: state,
      builder: (context, _) {
        final localizations = AppLocalizations.of(context)!;
        final hasResultsAvailable =
            state.hasResultsAvailable ||
            state.hasFinishedDeviceInRoom(currentRoomId);
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onNext,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Text(
                      localizations.nextRoom,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: FilledButton(
                    onPressed: hasResultsAvailable ? onFinish : null,
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Text(
                      localizations.results,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
