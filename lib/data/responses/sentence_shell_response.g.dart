// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sentence_shell_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SentenceShellResponse _$SentenceShellResponseFromJson(
        Map<String, dynamic> json) =>
    SentenceShellResponse(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      sentences: (json['sentences'] as List<dynamic>)
          .map((e) => SentenceResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..modified = json['modified'] as String?
      ..modifiedBy = json['modifiedBy'] as String?
      ..created = json['created'] as String?
      ..createdBy = json['createdBy'] as String?
      ..deleted = json['deleted'] as String?
      ..deletedBy = json['deletedBy'] as String?;

Map<String, dynamic> _$SentenceShellResponseToJson(
        SentenceShellResponse instance) =>
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
      'sentences': instance.sentences,
    };
