// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_file_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DatabaseFileDto _$DatabaseFileDtoFromJson(Map<String, dynamic> json) =>
    DatabaseFileDto(
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
    );

Map<String, dynamic> _$DatabaseFileDtoToJson(DatabaseFileDto instance) =>
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
    };

const _$DatabaseTypeEnumMap = {
  DatabaseType.image: 'Image',
  DatabaseType.audio: 'Audio',
};
