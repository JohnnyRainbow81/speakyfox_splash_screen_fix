// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudioResponse _$AudioResponseFromJson(Map<String, dynamic> json) =>
    AudioResponse(
      size: json['size'] as int,
      contentType: json['contentType'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$FileTypeEnumMap, json['type']),
      id: json['id'] as String,
      audioType: $enumDecode(_$AudioTypeEnumMap, json['audioType']),
      languageType: $enumDecode(_$LanguageTypeEnumMap, json['languageType']),
    )
      ..modified = json['modified'] as String?
      ..modifiedBy = json['modifiedBy'] as String?
      ..created = json['created'] as String?
      ..createdBy = json['createdBy'] as String?
      ..deleted = json['deleted'] as String?
      ..deletedBy = json['deletedBy'] as String?;

Map<String, dynamic> _$AudioResponseToJson(AudioResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'modified': instance.modified,
      'modifiedBy': instance.modifiedBy,
      'created': instance.created,
      'createdBy': instance.createdBy,
      'deleted': instance.deleted,
      'deletedBy': instance.deletedBy,
      'size': instance.size,
      'contentType': instance.contentType,
      'name': instance.name,
      'type': _$FileTypeEnumMap[instance.type]!,
      'audioType': _$AudioTypeEnumMap[instance.audioType]!,
      'languageType': _$LanguageTypeEnumMap[instance.languageType]!,
    };

const _$FileTypeEnumMap = {
  FileType.image: 'image',
  FileType.audio: 'audio',
};

const _$AudioTypeEnumMap = {
  AudioType.word: 'word',
  AudioType.sentence: 'sentence',
};

const _$LanguageTypeEnumMap = {
  LanguageType.sourceLanguage: 'sourceLanguage',
  LanguageType.targetLanguage: 'targetLanguage',
};
