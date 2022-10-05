// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClassDto _$ClassDtoFromJson(Map<String, dynamic> json) => ClassDto(
      id: json['id'] as String,
      modified: json['modified'] as String?,
      modifiedBy: json['modifiedBy'] as String?,
      created: json['created'] as String?,
      createdBy: json['createdBy'] as String?,
      deleted: json['deleted'] as String?,
      deletedBy: json['deletedBy'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      isPublished: json['isPublished'] as bool,
      isOnboarding: json['isOnboarding'] as bool?,
      progress: json['progress'] as int?,
      order: json['order'] as int,
      icon: json['icon'] == null
          ? null
          : ImageDto.fromJson(json['icon'] as Map<String, dynamic>),
      fileId: json['fileId'] as String?,
      languagePairId: json['languagePairId'] as String?,
      isLocked: json['isLocked'] as bool,
      languagePair: LanguagePairDto.fromJson(
          json['languagePair'] as Map<String, dynamic>),
      courses: (json['courses'] as List<dynamic>)
          .map((e) => CourseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ClassDtoToJson(ClassDto instance) => <String, dynamic>{
      'id': instance.id,
      'modified': instance.modified,
      'modifiedBy': instance.modifiedBy,
      'created': instance.created,
      'createdBy': instance.createdBy,
      'deleted': instance.deleted,
      'deletedBy': instance.deletedBy,
      'title': instance.title,
      'description': instance.description,
      'isPublished': instance.isPublished,
      'isOnboarding': instance.isOnboarding,
      'progress': instance.progress,
      'order': instance.order,
      'icon': instance.icon,
      'fileId': instance.fileId,
      'languagePairId': instance.languagePairId,
      'isLocked': instance.isLocked,
      'languagePair': instance.languagePair,
      'courses': instance.courses,
    };
