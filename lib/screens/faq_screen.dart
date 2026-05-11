import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final text = Theme.of(context).textTheme;

    final entries = _faqEntries(localizations);

    return Scaffold(
      appBar: AppBar(title: Text(localizations.faqScreenTitle())),
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        itemCount: entries.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final entry = entries[index];
          return Card(
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
          );
        },
      ),
    );
  }

  List<_FaqEntry> _faqEntries(AppLocalizations localizations) {
    final locale = localizations.locale;
    return [
      _FaqEntry(
        question: AppLocalizations.translate(
          'faqQuestionWhatIs',
          locale: locale,
          fallback: 'What is Simplications?',
        ),
        answer: AppLocalizations.translate(
          'faqAnswerWhatIs',
          locale: locale,
          fallback:
              'Simplications is a research project on smart-home privacy. This app is one part of the project and guides you room by room through your devices with practical recommendations based on your answers.',
        ),
      ),
      _FaqEntry(
        question: AppLocalizations.translate(
          'faqQuestionHowWorks',
          locale: locale,
          fallback: 'How does the check work?',
        ),
        answer: AppLocalizations.translate(
          'faqAnswerHowWorks',
          locale: locale,
          fallback:
              'You select a room, add your smart devices, answer device-specific questions, and receive a risk profile with prioritized actions.',
        ),
      ),
      _FaqEntry(
        question: AppLocalizations.translate(
          'faqQuestionNoPolicy',
          locale: locale,
          fallback: 'Why is there no data protection policy?',
        ),
        answer: AppLocalizations.translate(
          'faqAnswerNoPolicy',
          locale: locale,
          fallback: 'Because we do not collect your data.',
        ),
      ),
      _FaqEntry(
        question: AppLocalizations.translate(
          'faqQuestionDataStored',
          locale: locale,
          fallback: 'Where is my data stored?',
        ),
        answer: AppLocalizations.translate(
          'faqAnswerDataStored',
          locale: locale,
          fallback:
              'Your assessment data is stored locally on your device. You can delete all stored data at any time in the About screen.',
        ),
      ),
      _FaqEntry(
        question: AppLocalizations.translate(
          'faqQuestionNoDevice',
          locale: locale,
          fallback: 'What if my device is not listed?',
        ),
        answer: AppLocalizations.translate(
          'faqAnswerNoDevice',
          locale: locale,
          fallback:
              'You can add custom devices and still complete the check. The recommendations then rely on your provided setup and answers.',
        ),
      ),
      _FaqEntry(
        question: AppLocalizations.translate(
          'faqQuestionRiskMeaning',
          locale: locale,
          fallback: 'What do low, medium, and high risk mean?',
        ),
        answer: AppLocalizations.translate(
          'faqAnswerRiskMeaning',
          locale: locale,
          fallback:
              'They indicate how strongly your current configuration may expose privacy-related risks. They are guidance levels, not legal or technical certification.',
        ),
      ),
      _FaqEntry(
        question: AppLocalizations.translate(
          'faqQuestionLegalAdvice',
          locale: locale,
          fallback: 'Is this legal advice?',
        ),
        answer: AppLocalizations.translate(
          'faqAnswerLegalAdvice',
          locale: locale,
          fallback:
              'No. Simplications provides practical orientation and recommendations, but does not replace legal or professional security consultation.',
        ),
      ),
      _FaqEntry(
        question: AppLocalizations.translate(
          'faqQuestionCanShare',
          locale: locale,
          fallback: 'Can I share my results?',
        ),
        answer: AppLocalizations.translate(
          'faqAnswerCanShare',
          locale: locale,
          fallback:
              'Yes. You can export and share your summary as text or PDF directly from the results screen.',
        ),
      ),
    ];
  }
}

class _FaqEntry {
  final String question;
  final String answer;

  const _FaqEntry({required this.question, required this.answer});
}
