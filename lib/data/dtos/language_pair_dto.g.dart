// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_pair_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguagePairDto _$LanguagePairDtoFromJson(Map<String, dynamic> json) =>
    LanguagePairDto(
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
      subscriptions: json['subscriptions'] as List<dynamic>,
      icon: ImageDto.fromJson(json['icon'] as Map<String, dynamic>),
      sourceLanguage:
          LanguageDto.fromJson(json['sourceLanguage'] as Map<String, dynamic>),
      sourceLanguageId: json['sourceLanguageId'] as String,
      isPublished: json['isPublished'] as bool,
      targetLanguage:
          LanguageDto.fromJson(json['targetLanguage'] as Map<String, dynamic>),
      targetLanguageId: json['targetLanguageId'] as String,
      webAppProductId: json['webAppProductId'] as String,
      appStoreProductId: json['appStoreProductId'] as String,
    );

Map<String, dynamic> _$LanguagePairDtoToJson(LanguagePairDto instance) =>
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
      'subscriptions': instance.subscriptions,
      'icon': instance.icon,
      'sourceLanguage': instance.sourceLanguage,
      'sourceLanguageId': instance.sourceLanguageId,
      'isPublished': instance.isPublished,
      'targetLanguage': instance.targetLanguage,
      'targetLanguageId': instance.targetLanguageId,
      'webAppProductId': instance.webAppProductId,
      'appStoreProductId': instance.appStoreProductId,
    };
