import 'package:flutter/material.dart';

class WizardProgressBar extends StatelessWidget
    implements PreferredSizeWidget {
  final int current; // 1-based
  final int total;

  const WizardProgressBar({
    super.key,
    required this.current,
    required this.total,
  });

  @override
  Size get preferredSize => const Size.fromHeight(6);

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: current / total,
      minHeight: 6,
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      valueColor: AlwaysStoppedAnimation<Color>(
        Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
