// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackDto _$FeedbackDtoFromJson(Map<String, dynamic> json) => FeedbackDto(
      id: json['id'] as String,
      modified: json['modified'] as String?,
      modifiedBy: json['modifiedBy'] as String?,
      created: json['created'] as String?,
      createdBy: json['createdBy'] as String?,
      deleted: json['deleted'] as String?,
      deletedBy: json['deletedBy'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      order: json['order'] as int,
      type: $enumDecode(_$ScreenTypeEnumMap, json['type']),
      sequenceId: json['sequenceId'] as String,
      sequence: SequenceDto.fromJson(json['sequence'] as Map<String, dynamic>),
      gameType: $enumDecode(_$GameTypeEnumMap, json['gameType']),
      vocabularies: (json['vocabularies'] as List<dynamic>)
          .map((e) => VocabularyDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      vocabularyShells: (json['vocabularyShells'] as List<dynamic>)
          .map((e) => VocabularyShellDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      sentences:
          (json['sentences'] as List<dynamic>).map((e) => SentenceDto.fromJson(e as Map<String, dynamic>)).toList(),
      sentenceShells: (json['sentenceShells'] as List<dynamic>)
          .map((e) => SentenceShellDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      feedbackType: json['feedbackType'] as String,
    );

Map<String, dynamic> _$FeedbackDtoToJson(FeedbackDto instance) => <String, dynamic>{
      'id': instance.id,
      'modified': instance.modified,
      'modifiedBy': instance.modifiedBy,
      'created': instance.created,
      'createdBy': instance.createdBy,
      'deleted': instance.deleted,
      'deletedBy': instance.deletedBy,
      'title': instance.title,
      'description': instance.description,
      'order': instance.order,
      'type': _$ScreenTypeEnumMap[instance.type]!,
      'sequenceId': instance.sequenceId,
      'sequence': instance.sequence,
      'gameType': instance.gameType,
      'vocabularies': instance.vocabularies,
      'vocabularyShells': instance.vocabularyShells,
      'sentences': instance.sentences,
      'sentenceShells': instance.sentenceShells,
      'feedbackType': instance.feedbackType,
    };

const _$ScreenTypeEnumMap = {
  ScreenType.game: 'game',
  ScreenType.feedback: 'feedback',
  ScreenType.tip: 'tip',
};

const _$GameTypeEnumMap = {
  GameType.vocabularyImageGame: 'vocabularyImageGame',
  GameType.sentenceImageGame: 'sentenceImageGame',
  GameType.vocabularyImageQuiz: 'vocabularyImageQuiz',
  GameType.vocabularyLearned: 'vocabularyLearned',
  GameType.chooseTranslation: 'chooseTranslation',
  GameType.tapWhatYouHear: 'tapWhatYouHear',
  GameType.matchWords: 'matchWords',
  GameType.singleTranslationWord: 'singleTranslationWord',
  GameType.singleTranslationSentence: 'singleTranslationSentence',
  GameType.multipleTranslation: 'multipleTranslation',
  GameType.swipingVocabularyImage: 'swipingVocabularyImage',
  GameType.translateThisSentence: 'translateThisSentence',
  GameType.translateSourceSentence: 'translateSourceSentence',
  GameType.translateTargetSentence: 'translateTargetSentence',
};
