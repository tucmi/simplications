import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final text = Theme.of(context).textTheme;

    final entries = _faqEntries(localizations);

    return Scaffold(
      appBar: AppBar(title: Text(localizations.faqScreenTitle)),
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        itemCount: entries.length,
        separatorBuilder: (a, b) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final entry = entries[index];
          return Card(
            child: Theme(
              data: Theme.of(
                context,
              ).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                tilePadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                title: Text(
                  entry.question,
                  style: text.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                ),
                childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(entry.answer, style: text.bodyMedium),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  List<_FaqEntry> _faqEntries(AppLocalizations localizations) {
    return [
      _FaqEntry(
        question: localizations.faqQuestionWhatIs,
        answer: localizations.faqAnswerWhatIs,
      ),
      _FaqEntry(
        question: localizations.faqQuestionHowWorks,
        answer: localizations.faqAnswerHowWorks,
      ),
      _FaqEntry(
        question: localizations.faqQuestionNoPolicy,
        answer: localizations.faqAnswerNoPolicy,
      ),
      _FaqEntry(
        question: localizations.faqQuestionDataStored,
        answer: localizations.faqAnswerDataStored,
      ),
      _FaqEntry(
        question: localizations.faqQuestionNoDevice,
        answer: localizations.faqAnswerNoDevice,
      ),
      _FaqEntry(
        question: localizations.faqQuestionRiskMeaning,
        answer: localizations.faqAnswerRiskMeaning,
      ),
      _FaqEntry(
        question: localizations.faqQuestionLegalAdvice,
        answer: localizations.faqAnswerLegalAdvice,
      ),
      _FaqEntry(
        question: localizations.faqQuestionCanShare,
        answer: localizations.faqAnswerCanShare,
      ),
    ];
  }
}

class _FaqEntry {
  final String question;
  final String answer;

  const _FaqEntry({required this.question, required this.answer});
}
