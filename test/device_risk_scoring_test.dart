import 'package:flutter_test/flutter_test.dart';

import 'package:simplications/data/catalog_data.dart';
import 'package:simplications/models/device.dart';

DeviceTemplate _template(String id) {
  return CatalogData.allDeviceTemplates.firstWhere((t) => t.id == id);
}

DeviceInstance _instance(
  String templateId, {
  String roomId = 'living',
  bool expertMode = false,
}) {
  final template = _template(templateId);
  return DeviceInstance(
    instanceId: '${roomId}_$templateId',
    template: template,
    roomId: roomId,
    roomName: roomId,
    expertModeEnabled: expertMode,
  );
}

void _answerAll(DeviceInstance instance, QuestionAnswer answer) {
  for (final question in instance.questions) {
    instance.setAnswer(question.id, answer);
  }
}

Set<String> _allQuestionIds({required bool expertMode}) {
  final ids = <String>{};
  for (final template in CatalogData.allDeviceTemplates) {
    final instance = DeviceInstance(
      instanceId: 'scan_${template.id}_${expertMode ? 'expert' : 'basic'}',
      template: template,
      roomId: 'living',
      roomName: 'living',
      expertModeEnabled: expertMode,
    );
    ids.addAll(instance.questions.map((q) => q.id));
  }

  if (expertMode) {
    final childRoomExpertInstance = DeviceInstance(
      instanceId: 'scan_child_expert',
      template: _template('smart_router'),
      roomId: 'child_bedroom',
      roomName: 'child_bedroom',
      expertModeEnabled: true,
    );
    ids.addAll(childRoomExpertInstance.questions.map((q) => q.id));
  }

  return ids;
}

DeviceInstance _instanceWithQuestionId(
  String questionId, {
  required bool expertMode,
}) {
  for (final template in CatalogData.allDeviceTemplates) {
    final instance = DeviceInstance(
      instanceId: 'candidate_${template.id}_${expertMode ? 'expert' : 'basic'}',
      template: template,
      roomId: 'living',
      roomName: 'living',
      expertModeEnabled: expertMode,
    );
    if (instance.questions.any((q) => q.id == questionId)) {
      return instance;
    }
  }

  if (expertMode) {
    final childRoomExpertInstance = DeviceInstance(
      instanceId: 'candidate_child_expert',
      template: _template('smart_router'),
      roomId: 'child_bedroom',
      roomName: 'child_bedroom',
      expertModeEnabled: true,
    );
    if (childRoomExpertInstance.questions.any((q) => q.id == questionId)) {
      return childRoomExpertInstance;
    }
  }

  throw StateError('No instance found containing question id: $questionId');
}

void main() {
  group('Device risk scoring', () {
    test('all non-generic questions have dedicated no-answer remedies', () {
      final ids = {
        ..._allQuestionIds(expertMode: false),
        ..._allQuestionIds(expertMode: true),
      };

      for (final id in ids) {
        if (DeviceInstance.genericQuestionIds.contains(id)) {
          continue;
        }
        expect(
          DeviceInstance.remedyForNegativeAnswer(id),
          isNotNull,
          reason: 'Missing dedicated remedy for question: $id',
        );
      }
    });

    test('dont know answers only trigger the generic learning action', () {
      final ids = {
        ..._allQuestionIds(expertMode: false),
        ..._allQuestionIds(expertMode: true),
      };

      for (final id in ids) {
        final instance = _instanceWithQuestionId(
          id,
          expertMode: id.startsWith('expert_'),
        );
        _answerAll(instance, QuestionAnswer.yes);
        instance.setAnswer(id, QuestionAnswer.dontKnow);

        final actionTitles = instance.suggestedActions
            .map((action) => action.title)
            .toSet();

        expect(
          actionTitles,
          equals({'a_dont_know_title'}),
          reason: 'Question $id should only trigger dont-know generic action',
        );
      }
    });

    test(
      'merged sensor uses three shared questions and expected penalties',
      () {
        final sensor = _instance('simple_sensor');

        expect(
          sensor.questions.map((q) => q.id).toList(),
          equals(['sensor_frequency', 'sensor_data_deletion', 'sensor_local']),
        );

        _answerAll(sensor, QuestionAnswer.no);

        expect(sensor.riskScore, 44);
        expect(sensor.riskLevel, RiskLevel.medium);

        final labels = sensor.scoringFactors.map((f) => f.label).toSet();
        expect(labels.contains('sl_base_risk'), isTrue);
        expect(labels.contains('sl_sensor_frequency'), isTrue);
        expect(labels.contains('sl_sensor_data_deletion'), isTrue);
        expect(labels.contains('sl_sensor_local'), isTrue);
        expect(labels.contains('sl_sensor_granularity'), isFalse);
      },
    );

    test('score is clamped to 100 and child room bonus is applied', () {
      final lockInChildRoom = _instance('smart_lock', roomId: 'child_bedroom');
      _answerAll(lockInChildRoom, QuestionAnswer.no);

      expect(lockInChildRoom.riskScore, 100);
      expect(lockInChildRoom.riskLevel, RiskLevel.high);

      final childBonus = lockInChildRoom.scoringFactors.firstWhere(
        (f) => f.label == 'sl_child_room_bonus',
      );
      expect(childBonus.penalty, 10);
      expect(childBonus.isBaseRisk, isTrue);
    });

    test('dont know uses partial penalty and adds learning action', () {
      final speaker = _instance('smart_speaker');
      _answerAll(speaker, QuestionAnswer.yes);
      speaker.setAnswer('voice_history', QuestionAnswer.dontKnow);

      expect(speaker.riskScore, 54);
      expect(speaker.dontKnowAnswerCount, 1);

      final hasDontKnowFactor = speaker.scoringFactors.any(
        (f) => f.label == 'sl_voice_history' && f.penalty == 4 && f.isDontKnow,
      );
      expect(hasDontKnowFactor, isTrue);

      final actionTitles = speaker.suggestedActions.map((a) => a.title).toSet();
      expect(actionTitles.contains('a_dont_know_title'), isTrue);
      expect(actionTitles.contains('a_voice_history_title'), isFalse);
    });

    test('all positive answers on camera returns inherent camera hint', () {
      final camera = _instance('indoor_camera', roomId: 'hallway');
      _answerAll(camera, QuestionAnswer.yes);

      expect(camera.allAnswersPositive, isTrue);
      expect(camera.inherentRiskHint, 'risk_hint_camera');
    });

    test('expert mode adds expert questions and expert scoring factors', () {
      final wearable = _instance('fitness_tracker', expertMode: true);

      final ids = wearable.questions.map((q) => q.id).toSet();
      expect(ids.contains('expert_data_retention_duration'), isTrue);
      expect(ids.contains('expert_sensitive_inference_controls'), isTrue);

      _answerAll(wearable, QuestionAnswer.yes);
      wearable.setAnswer(
        'expert_sensitive_inference_controls',
        QuestionAnswer.no,
      );

      final hasExpertFactor = wearable.scoringFactors.any(
        (f) =>
            f.label == 'sl_expert_sensitive_inference_controls' &&
            f.penalty == 8,
      );
      expect(hasExpertFactor, isTrue);
    });
  });
}
