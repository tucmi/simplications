import 'package:flutter/material.dart';
import '../data/catalog_data.dart';
import '../l10n/app_localizations.dart';
import '../models/room.dart';
import '../models/survey_state.dart';
import 'device_selection_screen.dart';
import 'summary_screen.dart';
import '../widgets/custom_add_dialogs.dart';

class RoomSelectionScreen extends StatelessWidget {
  final SurveyState state;

  const RoomSelectionScreen({super.key, required this.state});

  void _openRoom(BuildContext context, Room room) {
    state.markRoomVisited(room.id);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => DeviceSelectionScreen(state: state, room: room),
      ),
    );
  }

  Future<void> _showAddRoomDialog(BuildContext context) async {
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (context) => const CustomRoomDialog(),
    );

    if (result != null && context.mounted) {
      final room = state.addCustomRoom(
        result['name'] as String,
        result['icon'] as IconData,
      );
      _openRoom(context, room);
    }
  }

  void _removeCustomRoom(BuildContext context, String roomId) {
    final localizations = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(localizations.roomDeleteTitle),
        content: Text(localizations.roomDeleteBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(localizations.cancel),
          ),
          TextButton(
            onPressed: () {
              state.removeCustomRoom(roomId);
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

  void _openResults(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => SummaryScreen(state: state)));
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.roomSelectionTitle),
        centerTitle: false,
      ),
      body: ListenableBuilder(
        listenable: state,
        builder: (context, _) {
          return Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                      sliver: SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              localizations.roomQuestion,
                              style: text.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              localizations.roomInstruction,
                              style: text.bodyMedium?.copyWith(
                                color: colors.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      sliver: SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 2.2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                            ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            // Get all rooms (catalog + custom)
                            final allRoomsInGrid = [
                              ...CatalogData.allRooms,
                              ...state.customRooms,
                            ];

                            // Last item is "Add custom room" button
                            if (index == allRoomsInGrid.length) {
                              return _AddRoomCard(
                                onTap: () => _showAddRoomDialog(context),
                              );
                            }

                            final room = allRoomsInGrid[index];
                            final isCompleted = state.isRoomCompleted(room.id);
                            final isIncomplete = state.isRoomIncomplete(
                              room.id,
                            );
                            final isCustom = state.customRooms.contains(room);

                            return _RoomCard(
                              room: room,
                              isCompleted: isCompleted,
                              isIncomplete: isIncomplete,
                              isCustom: isCustom,
                              onTap: () => _openRoom(context, room),
                              onRemove: isCustom
                                  ? () => _removeCustomRoom(context, room.id)
                                  : null,
                            );
                          },
                          childCount:
                              CatalogData.allRooms.length +
                              state.customRooms.length +
                              1, // +1 for "Add" button
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(child: SizedBox(height: 100)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                child: ListenableBuilder(
                  listenable: state,
                  builder: (context, _) {
                    final hasResultsAvailable = state.hasResultsAvailable;
                    return Row(
                      children: [
                        Expanded(
                          child: FilledButton(
                            onPressed: hasResultsAvailable
                                ? () => _openResults(context)
                                : null,
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
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _RoomCard extends StatelessWidget {
  final Room room;
  final bool isCompleted;
  final bool isIncomplete;
  final bool isCustom;
  final VoidCallback onTap;
  final VoidCallback? onRemove;

  const _RoomCard({
    required this.room,
    required this.isCompleted,
    required this.isIncomplete,
    required this.isCustom,
    required this.onTap,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final localizations = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        decoration: BoxDecoration(
          color: isCompleted
              ? colors.surfaceContainerLow
              : colors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isCompleted
                ? Colors.transparent
                : isIncomplete
                ? colors.error
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
                    Icon(
                      room.icon,
                      size: 20,
                      color: isCompleted
                          ? colors.onSurface.withValues(alpha: 0.35)
                          : isIncomplete
                          ? colors.error
                          : colors.onSurfaceVariant,
                    ),
                    const Spacer(),
                    if (isCompleted)
                      const Icon(
                        Icons.check_circle,
                        size: 16,
                        color: Colors.green,
                      )
                    else if (isIncomplete)
                      Icon(Icons.cancel, size: 16, color: colors.error),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  CatalogData.roomName(localizations, room),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: isCompleted
                        ? colors.onSurface.withValues(alpha: 0.35)
                        : isIncomplete
                        ? colors.error
                        : colors.onSurfaceVariant,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (isCompleted) ...[
                  const SizedBox(height: 2),
                  Text(
                    localizations.alreadyEvaluated,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: colors.onSurface.withValues(alpha: 0.35),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ] else if (isIncomplete) ...[
                  const SizedBox(height: 2),
                  Text(
                    localizations.notCompleted,
                    style: Theme.of(
                      context,
                    ).textTheme.labelSmall?.copyWith(color: colors.error),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
            if (isCustom && onRemove != null && !isCompleted)
              Positioned(
                top: 0,
                right: isIncomplete ? 22 : 0,
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
                      size: 16,
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

class _AddRoomCard extends StatelessWidget {
  final VoidCallback onTap;

  const _AddRoomCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final localizations = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16),
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
              localizations.addRoom,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
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
