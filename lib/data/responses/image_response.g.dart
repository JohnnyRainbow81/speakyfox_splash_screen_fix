// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageResponse _$ImageResponseFromJson(Map<String, dynamic> json) =>
    ImageResponse(
      bucketName: json['bucketName'] as String,
      name: json['name'] as String,
      size: json['size'] as int,
      contentType: json['contentType'] as String,
      type: $enumDecode(_$DatabaseTypeEnumMap, json['type']),
      metadata: json['metadata'] as List<dynamic>?,
      id: json['id'] as String,
      imageType: $enumDecode(_$ImageTypeEnumMap, json['imageType']),
      order: json['order'] as int,
      coordinates: CoordinatesResponse.fromJson(
          json['coordinates'] as Map<String, dynamic>),
    )
      ..modified = json['modified'] as String?
      ..modifiedBy = json['modifiedBy'] as String?
      ..created = json['created'] as String?
      ..createdBy = json['createdBy'] as String?
      ..deleted = json['deleted'] as String?
      ..deletedBy = json['deletedBy'] as String?;

Map<String, dynamic> _$ImageResponseToJson(ImageResponse instance) =>
    <String, dynamic>{
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
      'imageType': _$ImageTypeEnumMap[instance.imageType]!,
      'order': instance.order,
      'coordinates': instance.coordinates,
    };

const _$DatabaseTypeEnumMap = {
  DatabaseType.image: 'image',
  DatabaseType.audio: 'audio',
};

const _$ImageTypeEnumMap = {
  ImageType.whole: 'whole',
  ImageType.focus: 'focus',
  ImageType.part: 'part',
};
