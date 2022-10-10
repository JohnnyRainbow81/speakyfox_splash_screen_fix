// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileDto _$FileDtoFromJson(Map<String, dynamic> json) => FileDto(
      id: json['id'] as String,
      modified: json['modified'] as String?,
      modifiedBy: json['modifiedBy'] as String?,
      created: json['created'] as String?,
      createdBy: json['createdBy'] as String?,
      deleted: json['deleted'] as String?,
      deletedBy: json['deletedBy'] as String?,
      size: json['size'] as int,
      contentType: json['contentType'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$FileTypeEnumMap, json['type']),
    )..data = json['data'];

Map<String, dynamic> _$FileDtoToJson(FileDto instance) => <String, dynamic>{
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
      'data': instance.data,
    };

const _$FileTypeEnumMap = {
  FileType.image: 'Image',
  FileType.audio: 'Audio',
  FileType.file: 'File',
};
