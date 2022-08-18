// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScreenResponse _$ScreenResponseFromJson(Map<String, dynamic> json) =>
    ScreenResponse(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      order: json['order'] as int,
      type: $enumDecode(_$ScreenTypeEnumMap, json['type']),
      sequenceId: json['sequenceId'] as String,
      sequence:
          SequenceResponse.fromJson(json['sequence'] as Map<String, dynamic>),
      gameType: json['gameType'] as String,
      vocabularies: (json['vocabularies'] as List<dynamic>)
          .map((e) => VocabularyResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      vocabularyShells: (json['vocabularyShells'] as List<dynamic>)
          .map((e) =>
              VocabularyShellResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      sentences: (json['sentences'] as List<dynamic>)
          .map((e) => SentenceResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      sentenceShells: (json['sentenceShells'] as List<dynamic>)
          .map((e) => SentenceShellResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..modified = json['modified'] as String?
      ..modifiedBy = json['modifiedBy'] as String?
      ..created = json['created'] as String?
      ..createdBy = json['createdBy'] as String?
      ..deleted = json['deleted'] as String?
      ..deletedBy = json['deletedBy'] as String?;

Map<String, dynamic> _$ScreenResponseToJson(ScreenResponse instance) =>
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
      'type': _$ScreenTypeEnumMap[instance.type]!,
      'sequenceId': instance.sequenceId,
      'sequence': instance.sequence,
      'gameType': instance.gameType,
      'vocabularies': instance.vocabularies,
      'vocabularyShells': instance.vocabularyShells,
      'sentences': instance.sentences,
      'sentenceShells': instance.sentenceShells,
    };

const _$ScreenTypeEnumMap = {
  ScreenType.game: 'game',
  ScreenType.feedback: 'feedback',
  ScreenType.tip: 'tip',
};
