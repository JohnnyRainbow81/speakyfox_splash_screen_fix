// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageDto _$ImageDtoFromJson(Map<String, dynamic> json) => ImageDto(
      id: json['id'] as String,
      modified: json['modified'] as String?,
      modifiedBy: json['modifiedBy'] as String?,
      created: json['created'] as String?,
      createdBy: json['createdBy'] as String?,
      deleted: json['deleted'] as String?,
      deletedBy: json['deletedBy'] as String?,
      bucketName: json['bucketName'] as String?,
      name: json['name'] as String,
      size: json['size'] as int,
      contentType: json['contentType'] as String,
      type: $enumDecode(_$DatabaseTypeEnumMap, json['type']),
      metadata: json['metadata'],
      imageType: $enumDecodeNullable(_$ImageTypeEnumMap, json['imageType']),
      order: json['order'] as int?,
      coordinates: json['coordinates'] == null
          ? null
          : CoordinatesDto.fromJson(
              json['coordinates'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImageDtoToJson(ImageDto instance) => <String, dynamic>{
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
      'imageType': _$ImageTypeEnumMap[instance.imageType],
      'order': instance.order,
      'coordinates': instance.coordinates,
    };

const _$DatabaseTypeEnumMap = {
  DatabaseType.image: 'Image',
  DatabaseType.audio: 'Audio',
};

const _$ImageTypeEnumMap = {
  ImageType.none: 0,
  ImageType.whole: 'Whole',
  ImageType.focus: 'Focus',
  ImageType.part: 'Part',
};
