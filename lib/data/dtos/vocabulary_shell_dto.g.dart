// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabulary_shell_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VocabularyShellDto _$VocabularyShellDtoFromJson(Map<String, dynamic> json) =>
    VocabularyShellDto(
      id: json['id'] as String,
      modified: json['modified'] as String?,
      modifiedBy: json['modifiedBy'] as String?,
      created: json['created'] as String?,
      createdBy: json['createdBy'] as String?,
      deleted: json['deleted'] as String?,
      deletedBy: json['deletedBy'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      vocabularies: (json['vocabularies'] as List<dynamic>)
          .map((e) => VocabularyDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VocabularyShellDtoToJson(VocabularyShellDto instance) =>
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
      'vocabularies': instance.vocabularies,
    };
