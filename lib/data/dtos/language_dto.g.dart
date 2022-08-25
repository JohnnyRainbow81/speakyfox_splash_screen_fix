// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageDto _$LanguageDtoFromJson(Map<String, dynamic> json) => LanguageDto(
      id: json['id'] as String,
      modified: json['modified'] as String?,
      modifiedBy: json['modifiedBy'] as String?,
      created: json['created'] as String?,
      createdBy: json['createdBy'] as String?,
      deleted: json['deleted'] as String?,
      deletedBy: json['deletedBy'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      key: json['key'] as String,
      icon: json['icon'] == null
          ? null
          : ImageDto.fromJson(json['icon'] as Map<String, dynamic>),
      buttonImage:
          ImageDto.fromJson(json['buttonImage'] as Map<String, dynamic>),
      isPublished: json['isPublished'] as bool,
      buttonFileId: json['buttonFileId'] as String,
      languagePair: (json['languagePair'] as List<dynamic>)
          .map((e) => LanguagePairDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LanguageDtoToJson(LanguageDto instance) =>
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
      'key': instance.key,
      'icon': instance.icon,
      'buttonImage': instance.buttonImage,
      'isPublished': instance.isPublished,
      'buttonFileId': instance.buttonFileId,
      'languagePair': instance.languagePair,
    };
