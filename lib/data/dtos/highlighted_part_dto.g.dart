// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'highlighted_part_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HighlightedPartDto _$HighlightedPartDtoFromJson(Map<String, dynamic> json) =>
    HighlightedPartDto(
      id: json['id'] as String,
      modified: json['modified'] as String,
      modifiedBy: json['modifiedBy'] as String,
      created: json['created'] as String,
      createdBy: json['createdBy'] as String,
      deleted: json['deleted'] as String,
      deletedBy: json['deletedBy'] as String,
      metadata: (json['metadata'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      type: $enumDecode(_$TermTypeEnumMap, json['type']),
      words: (json['words'] as List<dynamic>)
          .map((e) => WordDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HighlightedPartDtoToJson(HighlightedPartDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'modified': instance.modified,
      'modifiedBy': instance.modifiedBy,
      'created': instance.created,
      'createdBy': instance.createdBy,
      'deleted': instance.deleted,
      'deletedBy': instance.deletedBy,
      'metadata': instance.metadata,
      'type': _$TermTypeEnumMap[instance.type]!,
      'words': instance.words,
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
