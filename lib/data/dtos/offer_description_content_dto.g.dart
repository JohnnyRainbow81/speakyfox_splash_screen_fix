// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_description_content_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferDescriptionContentDto _$OfferDescriptionContentDtoFromJson(
        Map<String, dynamic> json) =>
    OfferDescriptionContentDto(
      id: json['id'] as String,
      modified: json['modified'] as String?,
      modifiedBy: json['modifiedBy'] as String?,
      created: json['created'] as String?,
      createdBy: json['createdBy'] as String?,
      deleted: json['deleted'] as String?,
      deletedBy: json['deletedBy'] as String?,
      content: json['content'] as String,
      bulletPoints: (json['bulletPoints'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$OfferDescriptionContentDtoToJson(
        OfferDescriptionContentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'modified': instance.modified,
      'modifiedBy': instance.modifiedBy,
      'created': instance.created,
      'createdBy': instance.createdBy,
      'deleted': instance.deleted,
      'deletedBy': instance.deletedBy,
      'content': instance.content,
      'bulletPoints': instance.bulletPoints,
    };