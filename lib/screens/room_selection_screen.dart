import 'package:flutter/material.dart';
import '../data/catalog_data.dart';
import '../models/room.dart';
import '../models/survey_state.dart';
import 'device_selection_screen.dart';
import '../widgets/wizard_progress_bar.dart';
import '../widgets/custom_add_dialogs.dart';

class RoomSelectionScreen extends StatelessWidget {
  final SurveyState state;

  const RoomSelectionScreen({super.key, required this.state});

  void _openRoom(BuildContext context, Room room) {
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
      state.addCustomRoom(result['name'] as String, result['icon'] as IconData);
    }
  }

  void _removeCustomRoom(BuildContext context, String roomId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Raum löschen?'),
        content: const Text(
          'Dieser benutzerdefinierte Raum wird gelöscht. Alle verknüpften Geräte werden auch entfernt.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Abbrechen'),
          ),
          TextButton(
            onPressed: () {
              state.removeCustomRoom(roomId);
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Raum auswählen'),
        centerTitle: false,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(6),
          child: WizardProgressBar(current: 1, total: 3),
        ),
      ),
      body: ListenableBuilder(
        listenable: state,
        builder: (context, _) {
          final allRooms = [...CatalogData.allRooms, ...state.customRooms];
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
                              'Welchen Raum möchten Sie jetzt prüfen?',
                              style: text.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Tippen Sie auf einen Raum, erfassen Sie dort Ihre Geräte und kehren Sie dann hierher zurück, um den nächsten Raum zu wählen.',
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
                              childAspectRatio: 1.55,
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
                            final isCustom = state.customRooms.contains(room);

                            return _RoomCard(
                              room: room,
                              isCompleted: isCompleted,
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
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${state.completedRoomIds.length} / ${allRooms.length} Räume ausgewertet',
                        style: text.labelMedium?.copyWith(
                          color: colors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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
  final bool isCustom;
  final VoidCallback onTap;
  final VoidCallback? onRemove;

  const _RoomCard({
    required this.room,
    required this.isCompleted,
    required this.isCustom,
    required this.onTap,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

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
                    Icon(
                      room.icon,
                      size: 24,
                      color: isCompleted
                          ? colors.onSurface.withValues(alpha: 0.35)
                          : colors.onSurfaceVariant,
                    ),
                    const Spacer(),
                    if (isCompleted)
                      const Icon(
                        Icons.check_circle,
                        size: 18,
                        color: Colors.green,
                      ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  room.name,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: isCompleted
                        ? colors.onSurface.withValues(alpha: 0.35)
                        : colors.onSurfaceVariant,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (isCompleted) ...[
                  const SizedBox(height: 2),
                  Text(
                    'Bereits ausgewertet',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: colors.onSurface.withValues(alpha: 0.35),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
            if (isCustom && onRemove != null)
              Positioned(
                top: 0,
                right: 0,
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
            Icon(Icons.add, size: 40, color: colors.primary),
            const SizedBox(height: 8),
            Text(
              'Raum hinzufügen',
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
