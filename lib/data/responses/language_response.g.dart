// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageResponse _$LanguageResponseFromJson(Map<String, dynamic> json) =>
    LanguageResponse(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      key: json['key'] as String,
      icon: ImageResponse.fromJson(json['icon'] as Map<String, dynamic>),
      buttonImage:
          ImageResponse.fromJson(json['buttonImage'] as Map<String, dynamic>),
      isPublished: json['isPublished'] as bool,
      buttonFileId: json['buttonFileId'] as String,
      languagePair: LanguagePairResponse.fromJson(
          json['languagePair'] as Map<String, dynamic>),
    )
      ..modified = json['modified'] as String?
      ..modifiedBy = json['modifiedBy'] as String?
      ..created = json['created'] as String?
      ..createdBy = json['createdBy'] as String?
      ..deleted = json['deleted'] as String?
      ..deletedBy = json['deletedBy'] as String?;

Map<String, dynamic> _$LanguageResponseToJson(LanguageResponse instance) =>
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
