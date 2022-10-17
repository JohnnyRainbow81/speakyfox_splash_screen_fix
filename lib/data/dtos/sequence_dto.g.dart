// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sequence_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SequenceDto _$SequenceDtoFromJson(Map<String, dynamic> json) => SequenceDto(
      id: json['id'] as String,
      modified: json['modified'] as String?,
      modifiedBy: json['modifiedBy'] as String?,
      created: json['created'] as String?,
      createdBy: json['createdBy'] as String?,
      deleted: json['deleted'] as String?,
      deletedBy: json['deletedBy'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      progressType: $enumDecode(_$ProgressTypeEnumMap, json['progressType']),
      games: (json['games'] as List<dynamic>?)
          ?.map((e) => GameDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      parent: json['parent'] == null
          ? null
          : LectureDto.fromJson(json['parent'] as Map<String, dynamic>),
      order: json['order'] as int,
      screens: (json['screens'] as List<dynamic>?)
          ?.map((e) => ScreenDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SequenceDtoToJson(SequenceDto instance) =>
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
      'progressType': _$ProgressTypeEnumMap[instance.progressType]!,
      'games': instance.games,
      'parent': instance.parent,
      'order': instance.order,
      'screens': instance.screens,
    };

const _$ProgressTypeEnumMap = {
  ProgressType.single: 'Single',
  ProgressType.whole: 'Whole',
};
