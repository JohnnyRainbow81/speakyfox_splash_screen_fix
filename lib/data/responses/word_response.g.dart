// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordResponse _$WordResponseFromJson(Map<String, dynamic> json) => WordResponse(
      id: json['id'] as String,
      modified: json['modified'] as String,
      modifiedBy: json['modifiedBy'] as String,
      created: json['created'] as String,
      createdBy: json['createdBy'] as String,
      deleted: json['deleted'] as String,
      deletedBy: json['deletedBy'] as String,
      index: json['index'] as int,
      entry: json['entry'] as String,
      metadata: (json['metadata'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      type: $enumDecode(_$TermTypeEnumMap, json['type']),
      vocabularyShellId: json['vocabularyShellId'] as String,
      vocabularyShell: VocabularyShellResponse.fromJson(
          json['vocabularyShell'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WordResponseToJson(WordResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'modified': instance.modified,
      'modifiedBy': instance.modifiedBy,
      'created': instance.created,
      'createdBy': instance.createdBy,
      'deleted': instance.deleted,
      'deletedBy': instance.deletedBy,
      'index': instance.index,
      'entry': instance.entry,
      'metadata': instance.metadata,
      'type': _$TermTypeEnumMap[instance.type]!,
      'vocabularyShellId': instance.vocabularyShellId,
      'vocabularyShell': instance.vocabularyShell,
    };

const _$TermTypeEnumMap = {
  TermType.adjective: 'adjective',
  TermType.adverb: 'adverb',
  TermType.article: 'article',
  TermType.demonstrativePronoun: 'demonstrativePronoun',
  TermType.noun: 'noun',
  TermType.personalPronoun: 'personalPronoun',
  TermType.possessivePronoun: 'possessivePronoun',
  TermType.preposition: 'preposition',
  TermType.verb: 'verb',
};
