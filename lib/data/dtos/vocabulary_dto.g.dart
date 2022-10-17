// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabulary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VocabularyDto _$VocabularyDtoFromJson(Map<String, dynamic> json) =>
    VocabularyDto(
      id: json['id'] as String,
      modified: json['modified'] as String?,
      modifiedBy: json['modifiedBy'] as String?,
      created: json['created'] as String?,
      createdBy: json['createdBy'] as String?,
      deleted: json['deleted'] as String?,
      deletedBy: json['deletedBy'] as String?,
      sourceWord: json['sourceWord'] as String,
      targetWord: json['targetWord'] as String,
      mnemonic: json['mnemonic'] as String?,
      sourceSentence: json['sourceSentence'] as String?,
      targetSentence: json['targetSentence'] as String?,
      sentence: json['sentence'] == null
          ? null
          : SentenceDto.fromJson(json['sentence'] as Map<String, dynamic>),
      question: json['question'] as String,
      imageNumber: json['imageNumber'] as String,
      languagePairId: json['languagePairId'] as String?,
      languagePair: json['languagePair'] == null
          ? null
          : LanguagePairDto.fromJson(
              json['languagePair'] as Map<String, dynamic>),
      vocabularyShellId: json['vocabularyShellId'] as String,
      imageGroups: (json['imageGroups'] as List<dynamic>?)
          ?.map(
              (e) => AnimationImageGroupDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      answers: (json['answers'] as List<dynamic>)
          .map((e) => AnswerDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json['images'] as List<dynamic>)
          .map((e) => ImageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      audios: (json['audios'] as List<dynamic>)
          .map((e) => AudioDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VocabularyDtoToJson(VocabularyDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'modified': instance.modified,
      'modifiedBy': instance.modifiedBy,
      'created': instance.created,
      'createdBy': instance.createdBy,
      'deleted': instance.deleted,
      'deletedBy': instance.deletedBy,
      'sourceWord': instance.sourceWord,
      'targetWord': instance.targetWord,
      'mnemonic': instance.mnemonic,
      'sourceSentence': instance.sourceSentence,
      'targetSentence': instance.targetSentence,
      'sentence': instance.sentence,
      'question': instance.question,
      'imageNumber': instance.imageNumber,
      'languagePairId': instance.languagePairId,
      'languagePair': instance.languagePair,
      'vocabularyShellId': instance.vocabularyShellId,
      'imageGroups': instance.imageGroups,
      'answers': instance.answers,
      'images': instance.images,
      'audios': instance.audios,
    };
