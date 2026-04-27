import 'package:flutter/material.dart';
import '../models/device.dart';
import '../models/room.dart';
import '../models/survey_state.dart';
import '../widgets/wizard_progress_bar.dart';

class DeviceQuestionnaireScreen extends StatefulWidget {
  final SurveyState state;
  final Room room;
  final String instanceId;

  const DeviceQuestionnaireScreen({
    super.key,
    required this.state,
    required this.room,
    required this.instanceId,
  });

  @override
  State<DeviceQuestionnaireScreen> createState() =>
      _DeviceQuestionnaireScreenState();
}

class _DeviceQuestionnaireScreenState
    extends State<DeviceQuestionnaireScreen> {
  Room get currentRoom => widget.room;
  DeviceInstance get device => widget.state.devices
      .firstWhere((d) => d.instanceId == widget.instanceId);

  void _onAnswer(String questionId, bool value) {
    setState(() {
      device.setAnswer(questionId, value);
    });
  }

  void _onNext() {
    if (!device.isFullyAnswered) return;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final questions = device.questions;
    final answered = questions.where((q) => device.answerFor(q.id) != null).length;
    final allAnswered = answered == questions.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sicherheitsfragen'),
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(6),
          child: const WizardProgressBar(current: 3, total: 4),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Room label
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: colors.primaryContainer,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          currentRoom.name,
                          style: text.labelSmall?.copyWith(
                            color: colors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  // Device header card
                  Card(
                    elevation: 0,
                    color: colors.surfaceContainerHighest,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: colors.primaryContainer,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              device.template.icon,
                              size: 30,
                              color: colors.primary,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  device.template.name,
                                  style: text.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    if (device.template.hasCamera)
                                      _FeatureChip(
                                        icon: Icons.videocam,
                                        label: 'Kamera',
                                        colors: colors,
                                      ),
                                    if (device.template.hasMicrophone)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 6,
                                        ),
                                        child: _FeatureChip(
                                          icon: Icons.mic,
                                          label: 'Mikrofon',
                                          colors: colors,
                                        ),
                                      ),
                                    if (!device.template.hasCamera &&
                                        !device.template.hasMicrophone)
                                      Text(
                                        'Verbundenes Gerät',
                                        style: text.bodySmall?.copyWith(
                                          color: colors.onSurfaceVariant,
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Progress within this device
                  Row(
                    children: [
                      Text(
                        '$answered / ${questions.length} Fragen beantwortet',
                        style: text.labelSmall?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  LinearProgressIndicator(
                    value: questions.isEmpty ? 0 : answered / questions.length,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          // Questions
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final question = questions[index];
                  final answer = device.answerFor(question.id);
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _QuestionCard(
                      question: question,
                      answer: answer,
                      onAnswer: (v) => _onAnswer(question.id, v),
                      number: index + 1,
                    ),
                  );
                },
                childCount: questions.length,
              ),
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
            child: FilledButton.icon(
              onPressed: allAnswered ? _onNext : null,
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              icon: const Icon(Icons.check_circle_outline, size: 18),
              label: const Text(
                'Fertig',
                style: TextStyle(
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

class _FeatureChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final ColorScheme colors;

  const _FeatureChip({
    required this.icon,
    required this.label,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: colors.errorContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: colors.error),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: colors.error,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuestionCard extends StatelessWidget {
  final DeviceQuestion question;
  final bool? answer;
  final ValueChanged<bool> onAnswer;
  final int number;

  const _QuestionCard({
    required this.question,
    required this.answer,
    required this.onAnswer,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final answered = answer != null;

    return Card(
      elevation: 0,
      color:
          answered
              ? (answer == true
                  ? colors.secondaryContainer.withAlpha(180)
                  : colors.errorContainer.withAlpha(120))
              : colors.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(
          color:
              answered
                  ? (answer == true
                      ? colors.secondary
                      : colors.error)
                  : Colors.transparent,
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color:
                        answered
                            ? (answer == true
                                ? colors.secondary
                                : colors.error)
                            : colors.outlineVariant,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child:
                        answered
                            ? Icon(
                              answer == true
                                  ? Icons.check
                                  : Icons.close,
                              size: 14,
                              color:
                                  answer == true
                                      ? colors.onSecondary
                                      : colors.onError,
                            )
                            : Text(
                              '$number',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: colors.onSurface,
                              ),
                            ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    question.text,
                    style: text.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 34, top: 6),
              child: Text(
                question.hint,
                style: text.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: _AnswerButton(
                    label: 'Ja',
                    icon: Icons.check,
                    isSelected: answer == true,
                    isPositive: true,
                    onTap: () => onAnswer(true),
                    colors: colors,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _AnswerButton(
                    label: 'Nein',
                    icon: Icons.close,
                    isSelected: answer == false,
                    isPositive: false,
                    onTap: () => onAnswer(false),
                    colors: colors,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AnswerButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final bool isPositive;
  final VoidCallback onTap;
  final ColorScheme colors;

  const _AnswerButton({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.isPositive,
    required this.onTap,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    final selectedBg = isPositive ? colors.secondary : colors.error;
    final selectedFg = isPositive ? colors.onSecondary : colors.onError;

    return SizedBox(
      height: 42,
      child: OutlinedButton.icon(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          backgroundColor:
              isSelected ? selectedBg : colors.surfaceContainerHighest,
          side: BorderSide(
            color: isSelected ? selectedBg : colors.outline,
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        icon: Icon(
          icon,
          size: 16,
          color: isSelected ? selectedFg : colors.onSurfaceVariant,
        ),
        label: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: isSelected ? selectedFg : colors.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
