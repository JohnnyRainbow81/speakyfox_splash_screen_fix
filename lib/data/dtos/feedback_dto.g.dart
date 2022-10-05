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
      screenType: $enumDecodeNullable(_$ScreenTypeEnumMap, json['screenType']),
      sequenceId: json['sequenceId'] as String?,
      sequence: SequenceDto.fromJson(json['sequence'] as Map<String, dynamic>),
      gameType: $enumDecode(_$GameTypeEnumMap, json['type']),
      vocabularies: (json['vocabularies'] as List<dynamic>)
          .map((e) => VocabularyDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      vocabularyShells: (json['vocabularyShells'] as List<dynamic>)
          .map((e) => VocabularyShellDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      sentences: (json['sentences'] as List<dynamic>)
          .map((e) => SentenceDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      sentenceShells: (json['sentenceShells'] as List<dynamic>)
          .map((e) => SentenceShellDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      feedbackType: json['feedbackType'] as String,
    );

Map<String, dynamic> _$FeedbackDtoToJson(FeedbackDto instance) =>
    <String, dynamic>{
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
      'screenType': _$ScreenTypeEnumMap[instance.screenType],
      'sequenceId': instance.sequenceId,
      'sequence': instance.sequence,
      'type': _$GameTypeEnumMap[instance.gameType]!,
      'vocabularies': instance.vocabularies,
      'vocabularyShells': instance.vocabularyShells,
      'sentences': instance.sentences,
      'sentenceShells': instance.sentenceShells,
      'feedbackType': instance.feedbackType,
    };

const _$ScreenTypeEnumMap = {
  ScreenType.game: 'Game',
  ScreenType.feedback: 'Feedback',
  ScreenType.tip: 'Tip',
};

const _$GameTypeEnumMap = {
  GameType.vocabularyImage: 'VocabularyImage',
  GameType.vocabularyImageGame: 'VocabularyImageGame',
  GameType.sentenceImageGame: 'SentenceImageGame',
  GameType.vocabularyImageQuiz: 'VocabularyImageQuiz',
  GameType.vocabularyLearned: 'VocabularyLearned',
  GameType.chooseTranslation: 'ChooseTranslation',
  GameType.tapWhatYouHear: 'TapWhatYouHear',
  GameType.matchWords: 'MatchWords',
  GameType.singleTranslationWord: 'SingleTranslationWord',
  GameType.singleTranslationSentence: 'SingleTranslationSentence',
  GameType.multipleTranslation: 'MultipleTranslation',
  GameType.swipingVocabularyImage: 'SwipingVocabularyImage',
  GameType.translateThisSentence: 'TranslateThisSentence',
  GameType.translateSourceSentence: 'TranslateSourceSentence',
  GameType.translateTargetSentence: 'TranslateTargetSentence',
};
