import 'package:flutter/material.dart';

class CustomRoomDialog extends StatefulWidget {
  final List<IconData> availableIcons;

  const CustomRoomDialog({
    super.key,
    this.availableIcons = const [
      Icons.weekend,
      Icons.kitchen,
      Icons.hotel,
      Icons.bathtub,
      Icons.computer,
      Icons.meeting_room,
      Icons.yard,
      Icons.storage,
      Icons.home,
      Icons.living,
      Icons.local_library,
      Icons.fitness_center,
      Icons.sports_esports,
      Icons.roofing,
    ],
  });

  @override
  State<CustomRoomDialog> createState() => _CustomRoomDialogState();
}

class _CustomRoomDialogState extends State<CustomRoomDialog> {
  late TextEditingController _nameController;
  late IconData _selectedIcon;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _selectedIcon = widget.availableIcons.first;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Neuen Raum hinzufügen',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _nameController,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  labelText: 'Raumname',
                  hintText: 'z. B. Wohnzimmer, Garage',
                  prefixIcon: Icon(_selectedIcon),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Symbol wählen:'),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: widget.availableIcons.map((icon) {
                  final isSelected = icon == _selectedIcon;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIcon = icon;
                      });
                    },
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected ? Colors.teal : Colors.grey,
                          width: isSelected ? 2 : 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color:
                            isSelected
                                ? Colors.teal.withValues(alpha: 0.1)
                                : Colors.transparent,
                      ),
                      child: Icon(
                        icon,
                        color: isSelected ? Colors.teal : Colors.grey,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Abbrechen'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed:
                        _nameController.text.trim().isEmpty
                            ? null
                            : () {
                              Navigator.pop(
                                context,
                                {
                                  'name': _nameController.text.trim(),
                                  'icon': _selectedIcon,
                                },
                              );
                            },
                    child: const Text('Hinzufügen'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDeviceDialog extends StatefulWidget {
  final List<IconData> availableIcons;

  const CustomDeviceDialog({
    super.key,
    this.availableIcons = const [
      Icons.speaker,
      Icons.videocam,
      Icons.tv,
      Icons.thermostat,
      Icons.lightbulb,
      Icons.lock,
      Icons.electrical_services,
      Icons.window,
      Icons.cleaning_services,
      Icons.kitchen,
      Icons.watch,
      Icons.toys,
      Icons.router,
      Icons.print,
    ],
  });

  @override
  State<CustomDeviceDialog> createState() => _CustomDeviceDialogState();
}

class _CustomDeviceDialogState extends State<CustomDeviceDialog> {
  late TextEditingController _nameController;
  late TextEditingController _riskScoreController;
  late IconData _selectedIcon;
  bool _hasCamera = false;
  bool _hasMicrophone = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _riskScoreController = TextEditingController(text: '30');
    _selectedIcon = widget.availableIcons.first;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _riskScoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Neues Gerät hinzufügen',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _nameController,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  labelText: 'Gerätename',
                  hintText: 'z. B. Mein Smart Speaker',
                  prefixIcon: Icon(_selectedIcon),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _riskScoreController,
                onChanged: (_) => setState(() {}),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Basis-Risiko-Punktzahl (0-100)',
                  hintText: 'z. B. 30 (niedrig) bis 60 (hoch)',
                ),
              ),
              const SizedBox(height: 16),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Hat Kamera?'),
                value: _hasCamera,
                onChanged: (value) {
                  setState(() {
                    _hasCamera = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Hat Mikrofon?'),
                value: _hasMicrophone,
                onChanged: (value) {
                  setState(() {
                    _hasMicrophone = value ?? false;
                  });
                },
              ),
              const SizedBox(height: 16),
              const Text('Symbol wählen:'),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: widget.availableIcons.map((icon) {
                  final isSelected = icon == _selectedIcon;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIcon = icon;
                      });
                    },
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected ? Colors.teal : Colors.grey,
                          width: isSelected ? 2 : 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color:
                            isSelected
                                ? Colors.teal.withValues(alpha: 0.1)
                                : Colors.transparent,
                      ),
                      child: Icon(
                        icon,
                        color: isSelected ? Colors.teal : Colors.grey,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Abbrechen'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed:
                        _nameController.text.trim().isEmpty ||
                                _riskScoreController.text.trim().isEmpty
                            ? null
                            : () {
                              final riskScore =
                                  int.tryParse(_riskScoreController.text) ?? 30;
                              Navigator.pop(
                                context,
                                {
                                  'name': _nameController.text.trim(),
                                  'icon': _selectedIcon,
                                  'riskScore': riskScore.clamp(0, 100),
                                  'hasCamera': _hasCamera,
                                  'hasMicrophone': _hasMicrophone,
                                },
                              );
                            },
                    child: const Text('Hinzufügen'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
