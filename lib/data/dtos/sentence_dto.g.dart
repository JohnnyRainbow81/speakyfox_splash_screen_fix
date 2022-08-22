// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sentence_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SentenceDto _$SentenceDtoFromJson(Map<String, dynamic> json) => SentenceDto(
      id: json['id'] as String,
      modified: json['modified'] as String?,
      modifiedBy: json['modifiedBy'] as String?,
      created: json['created'] as String?,
      createdBy: json['createdBy'] as String?,
      deleted: json['deleted'] as String?,
      deletedBy: json['deletedBy'] as String?,
      sentenceShellId: json['sentenceShellId'] as String,
      sentenceShell: SentenceShellDto.fromJson(json['sentenceShell'] as Map<String, dynamic>),
      isPublished: json['isPublished'] as bool,
      languagePairId: json['languagePairId'] as String,
      languagePair: LanguagePairDto.fromJson(json['languagePair'] as Map<String, dynamic>),
      sourceNormalized: json['sourceNormalized'] as String,
      targetNormalized: json['targetNormalized'] as String,
      sourceHighlightedParts: (json['sourceHighlightedParts'] as List<dynamic>)
          .map((e) => HighlightedPartDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      targetHighlightedParts: (json['targetHighlightedParts'] as List<dynamic>)
          .map((e) => HighlightedPartDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json['images'] as List<dynamic>).map((e) => ImageDto.fromJson(e as Map<String, dynamic>)).toList(),
      audios: (json['audios'] as List<dynamic>).map((e) => AudioDto.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$SentenceDtoToJson(SentenceDto instance) => <String, dynamic>{
      'id': instance.id,
      'modified': instance.modified,
      'modifiedBy': instance.modifiedBy,
      'created': instance.created,
      'createdBy': instance.createdBy,
      'deleted': instance.deleted,
      'deletedBy': instance.deletedBy,
      'sentenceShellId': instance.sentenceShellId,
      'sentenceShell': instance.sentenceShell,
      'isPublished': instance.isPublished,
      'languagePairId': instance.languagePairId,
      'languagePair': instance.languagePair,
      'sourceNormalized': instance.sourceNormalized,
      'targetNormalized': instance.targetNormalized,
      'sourceHighlightedParts': instance.sourceHighlightedParts,
      'targetHighlightedParts': instance.targetHighlightedParts,
      'images': instance.images,
      'audios': instance.audios,
    };
