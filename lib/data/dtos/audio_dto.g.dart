// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudioDto _$AudioDtoFromJson(Map<String, dynamic> json) => AudioDto(
      id: json['id'] as String,
      modified: json['modified'] as String?,
      modifiedBy: json['modifiedBy'] as String?,
      created: json['created'] as String?,
      createdBy: json['createdBy'] as String?,
      deleted: json['deleted'] as String?,
      deletedBy: json['deletedBy'] as String?,
      bucketName: json['bucketName'] as String,
      metadata: json['metadata'] as List<dynamic>,
      size: json['size'] as int,
      contentType: json['contentType'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$DatabaseTypeEnumMap, json['type']),
      audioType: $enumDecode(_$AudioTypeEnumMap, json['audioType']),
      languageType: $enumDecode(_$LanguageTypeEnumMap, json['languageType']),
    );

Map<String, dynamic> _$AudioDtoToJson(AudioDto instance) => <String, dynamic>{
      'id': instance.id,
      'modified': instance.modified,
      'modifiedBy': instance.modifiedBy,
      'created': instance.created,
      'createdBy': instance.createdBy,
      'deleted': instance.deleted,
      'deletedBy': instance.deletedBy,
      'bucketName': instance.bucketName,
      'name': instance.name,
      'size': instance.size,
      'contentType': instance.contentType,
      'type': _$DatabaseTypeEnumMap[instance.type]!,
      'metadata': instance.metadata,
      'audioType': _$AudioTypeEnumMap[instance.audioType]!,
      'languageType': _$LanguageTypeEnumMap[instance.languageType]!,
    };

const _$DatabaseTypeEnumMap = {
  DatabaseType.image: 'image',
  DatabaseType.audio: 'audio',
};

const _$AudioTypeEnumMap = {
  AudioType.word: 'word',
  AudioType.sentence: 'sentence',
};

const _$LanguageTypeEnumMap = {
  LanguageType.sourceLanguage: 'sourceLanguage',
  LanguageType.targetLanguage: 'targetLanguage',
};
