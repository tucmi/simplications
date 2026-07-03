import 'package:flutter/material.dart';
import '../data/catalog_data.dart';
import '../l10n/app_localizations.dart';
import '../models/device.dart';
import '../models/room.dart';
import '../models/survey_state.dart';
import '../widgets/custom_add_dialogs.dart';
import 'device_questionnaire_screen.dart';
import 'device_result_screen.dart';
import 'summary_screen.dart';

class DeviceSelectionScreen extends StatefulWidget {
  final SurveyState state;
  final Room room;

  const DeviceSelectionScreen({
    super.key,
    required this.state,
    required this.room,
  });

  @override
  State<DeviceSelectionScreen> createState() => _DeviceSelectionScreenState();
}

class _DeviceSelectionScreenState extends State<DeviceSelectionScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<DeviceTemplate> _filterDevices(
    AppLocalizations localizations,
    List<DeviceTemplate> devices,
  ) {
    final query = _searchQuery.trim().toLowerCase();
    if (query.isEmpty) {
      return devices;
    }
    return devices.where((device) {
      final name = CatalogData.deviceName(localizations, device).toLowerCase();
      return name.contains(query);
    }).toList();
  }

  Future<void> _showAddDeviceDialog(BuildContext context) async {
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (context) => const CustomDeviceDialog(),
    );

    if (result != null && context.mounted) {
      widget.state.addCustomDevice(
        widget.room.id,
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
    final hasExistingDevices = widget.state
        .devicesForRoom(widget.room.id)
        .isNotEmpty;
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

    widget.state.markRoomWithoutDevices(widget.room.id);
    Navigator.of(context).pop();
  }

  void _onNext(BuildContext context) {
    widget.state.markRoomCompleted(widget.room.id);
    Navigator.of(context).pop();
  }

  void _onFinish(BuildContext context) {
    widget.state.markRoomCompleted(widget.room.id);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => SummaryScreen(state: widget.state)),
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
              widget.state.removeCustomDevice(deviceId);
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

  void _removeDeviceInstance(BuildContext context, String instanceId) {
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
              widget.state.removeDevice(instanceId);
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
    final isCustomRoom = widget.state.customRooms.any(
      (r) => r.id == widget.room.id,
    );
    final catalogDevices = isCustomRoom
        ? CatalogData.sortedDeviceTemplates(CatalogData.allDeviceTemplates)
        : CatalogData.devicesForRoom(widget.room.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${localizations.deviceTitlePrefix}: ${CatalogData.roomName(localizations, widget.room)}',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
      ),
      body: ListenableBuilder(
        listenable: widget.state,
        builder: (context, _) {
          final roomInstances = widget.state.devicesForRoom(widget.room.id);
          final customDevices = widget.state.customDevicesForRoom(
            widget.room.id,
          );
          final filteredCatalogDevices = _filterDevices(
            localizations,
            catalogDevices,
          );
          final filteredCustomDevices = _filterDevices(
            localizations,
            customDevices,
          );
          final allDevices = [
            ...filteredCatalogDevices,
            ...filteredCustomDevices,
          ];
          final isNoDeviceSelected = widget.state.noDeviceRoomIds.contains(
            widget.room.id,
          );

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
                              widget.room.icon,
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
                                CatalogData.roomName(
                                  localizations,
                                  widget.room,
                                ),
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
                      const SizedBox(height: 12),
                      TextField(
                        controller: _searchController,
                        onChanged: (value) {
                          if (value == _searchQuery) {
                            return;
                          }
                          setState(() {
                            _searchQuery = value;
                          });
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: localizations.searchDevicesHint,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          isDense: true,
                          suffixIcon: _searchQuery.isEmpty
                              ? null
                              : IconButton(
                                  onPressed: () {
                                    _searchController.clear();
                                    setState(() {
                                      _searchQuery = '';
                                    });
                                  },
                                  icon: const Icon(Icons.clear),
                                ),
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
                    final instances = widget.state
                        .devicesForRoom(widget.room.id)
                        .where((i) => i.template.id == device.id);
                    final instanceList = instances.toList();
                    final completedCount = instanceList
                        .where((instance) => instance.isFullyAnswered)
                        .length;
                    final evaluatedInstances = instanceList
                        .where((instance) => instance.isFullyAnswered)
                        .toList();
                    RiskLevel? riskLevel;
                    if (evaluatedInstances.isNotEmpty) {
                      if (evaluatedInstances.any(
                        (instance) => instance.riskLevel == RiskLevel.high,
                      )) {
                        riskLevel = RiskLevel.high;
                      } else if (evaluatedInstances.any(
                        (instance) => instance.riskLevel == RiskLevel.medium,
                      )) {
                        riskLevel = RiskLevel.medium;
                      } else {
                        riskLevel = RiskLevel.low;
                      }
                    }
                    final hasIncomplete = instanceList.any(
                      (instance) => !instance.isFullyAnswered,
                    );
                    final isCustom = filteredCustomDevices.contains(device);

                    return _DeviceCard(
                      device: device,
                      instanceCount: instanceList.length,
                      completedCount: completedCount,
                      hasIncomplete: hasIncomplete,
                      riskLevel: riskLevel,
                      isCustom: isCustom,
                      onTap: () {
                        final instance = widget.state.addDevice(
                          device,
                          widget.room.id,
                          widget.room.name,
                        );
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => DeviceQuestionnaireScreen(
                              state: widget.state,
                              room: widget.room,
                              instanceId: instance.instanceId,
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
              if (roomInstances.isNotEmpty)
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 10),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      localizations.overview,
                      style: text.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              if (roomInstances.isNotEmpty)
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final instance = roomInstances[index];
                      final countForTemplate = roomInstances
                          .take(index + 1)
                          .where(
                            (device) =>
                                device.template.id == instance.template.id,
                          )
                          .length;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: _DeviceInstanceCard(
                          instance: instance,
                          sequence: countForTemplate,
                          onOpen: () {
                            if (instance.isFullyAnswered) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => DeviceResultScreen(
                                    state: widget.state,
                                    room: widget.room,
                                    instanceId: instance.instanceId,
                                  ),
                                ),
                              );
                              return;
                            }
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => DeviceQuestionnaireScreen(
                                  state: widget.state,
                                  room: widget.room,
                                  instanceId: instance.instanceId,
                                ),
                              ),
                            );
                          },
                          onDelete: () => _removeDeviceInstance(
                            context,
                            instance.instanceId,
                          ),
                        ),
                      );
                    }, childCount: roomInstances.length),
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
        state: widget.state,
        currentRoomId: widget.room.id,
      ),
    );
  }
}

class _DeviceInstanceCard extends StatelessWidget {
  final DeviceInstance instance;
  final int sequence;
  final VoidCallback onOpen;
  final VoidCallback onDelete;

  const _DeviceInstanceCard({
    required this.instance,
    required this.sequence,
    required this.onOpen,
    required this.onDelete,
  });

  Color _riskColor() {
    if (!instance.isFullyAnswered) {
      return const Color(0xFFF9A825);
    }
    switch (instance.riskLevel) {
      case RiskLevel.high:
        return const Color(0xFFC62828);
      case RiskLevel.medium:
        return const Color(0xFFF9A825);
      case RiskLevel.low:
        return const Color(0xFF2E7D32);
    }
  }

  String _riskLabel(AppLocalizations localizations) {
    if (!instance.isFullyAnswered) {
      return localizations.notCompleted;
    }
    switch (instance.riskLevel) {
      case RiskLevel.high:
        return localizations.highRisk;
      case RiskLevel.medium:
        return localizations.mediumRisk;
      case RiskLevel.low:
        return localizations.lowRisk;
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final localizations = AppLocalizations.of(context)!;
    final riskColor = _riskColor();

    return Card(
      elevation: 0,
      color: riskColor.withValues(alpha: 0.08),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: riskColor.withValues(alpha: 0.45)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
        child: Row(
          children: [
            Icon(instance.template.icon, size: 20, color: riskColor),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${CatalogData.deviceName(localizations, instance.template)} #$sequence',
                    style: text.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    instance.isFullyAnswered
                        ? '${_riskLabel(localizations)} • ${instance.riskScore}/100'
                        : _riskLabel(localizations),
                    style: text.labelSmall?.copyWith(
                      color: riskColor,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            IconButton(
              tooltip: instance.isFullyAnswered
                  ? localizations.results
                  : localizations.resumeIncompleteDevice,
              onPressed: onOpen,
              icon: Icon(
                instance.isFullyAnswered
                    ? Icons.arrow_forward_ios
                    : Icons.play_circle_fill,
                size: 18,
              ),
            ),
            IconButton(
              tooltip: localizations.delete,
              onPressed: onDelete,
              icon: const Icon(Icons.delete_outline, size: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class _DeviceCard extends StatelessWidget {
  final DeviceTemplate device;
  final int instanceCount;
  final int completedCount;
  final bool hasIncomplete;
  final RiskLevel? riskLevel;
  final bool isCustom;
  final VoidCallback onTap;
  final VoidCallback? onRemove;

  const _DeviceCard({
    required this.device,
    required this.instanceCount,
    required this.completedCount,
    required this.hasIncomplete,
    required this.riskLevel,
    required this.isCustom,
    required this.onTap,
    this.onRemove,
  });

  Color _riskColor() {
    switch (riskLevel) {
      case RiskLevel.high:
        return const Color(0xFFC62828);
      case RiskLevel.medium:
        return const Color(0xFFF9A825);
      case RiskLevel.low:
        return const Color(0xFF2E7D32);
      case null:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final localizations = AppLocalizations.of(context)!;
    final hasInstances = instanceCount > 0;
    final allCompleted = hasInstances && completedCount == instanceCount;
    final riskColor = _riskColor();
    final hasRiskColor = riskLevel != null;
    final contentColor = hasRiskColor
        ? riskColor
        : allCompleted
        ? colors.onSurface.withValues(alpha: 0.35)
        : colors.onSurfaceVariant;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        decoration: BoxDecoration(
          color: hasRiskColor
              ? riskColor.withValues(alpha: 0.08)
              : allCompleted
              ? colors.surfaceContainerLow
              : colors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: hasRiskColor
                ? riskColor
                : allCompleted
                ? Colors.transparent
                : hasIncomplete
                ? colors.tertiary
                : (isCustom ? colors.tertiaryContainer : Colors.transparent),
            width: 2,
          ),
        ),
        padding: const EdgeInsets.all(8),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final textScale = MediaQuery.textScalerOf(context).scale(1);
            final compact = constraints.maxHeight < 72 || textScale > 1.15;
            final showProgress = hasInstances && !compact;

            return Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(device.icon, size: 20, color: contentColor),
                        const Spacer(),
                        if (device.hasCamera && !allCompleted)
                          Tooltip(
                            message: localizations.camera,
                            child: Icon(
                              Icons.videocam,
                              size: 12,
                              color: contentColor,
                            ),
                          ),
                        if (device.hasMicrophone && !allCompleted)
                          Tooltip(
                            message: localizations.microphone,
                            child: Icon(
                              Icons.mic,
                              size: 12,
                              color: contentColor,
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: compact ? 2 : 4),
                    Flexible(
                      child: Text(
                        CatalogData.deviceName(localizations, device),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: contentColor,
                        ),
                        maxLines: compact ? 1 : 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (showProgress) ...[
                      const SizedBox(height: 4),
                      Text(
                        allCompleted
                            ? '$completedCount/$instanceCount ${localizations.done}'
                            : '$completedCount/$instanceCount',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: hasRiskColor
                              ? riskColor
                              : allCompleted
                              ? Colors.green.shade700
                              : colors.onSurfaceVariant,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
                if (allCompleted && !hasRiskColor)
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: Icon(Icons.check_circle, size: 16, color: Colors.green),
                  ),
                if (hasRiskColor)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Icon(
                      Icons.shield_outlined,
                      size: 16,
                      color: riskColor,
                    ),
                  ),
                if (hasIncomplete)
                  Positioned(
                    top: 0,
                    right: hasRiskColor ? 22 : (allCompleted ? 22 : 0),
                    child: Icon(Icons.timelapse, size: 16, color: colors.tertiary),
                  ),
                if (isCustom && onRemove != null)
                  Positioned(
                    top: 0,
                    right: hasIncomplete && hasRiskColor
                        ? 44
                        : (allCompleted || hasIncomplete || hasRiskColor)
                        ? 22
                        : 0,
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
            );
          },
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
