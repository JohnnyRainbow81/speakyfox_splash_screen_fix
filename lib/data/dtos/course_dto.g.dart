// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseDto _$CourseDtoFromJson(Map<String, dynamic> json) => CourseDto(
      id: json['id'] as String,
      modified: json['modified'] as String?,
      modifiedBy: json['modifiedBy'] as String?,
      created: json['created'] as String?,
      createdBy: json['createdBy'] as String?,
      deleted: json['deleted'] as String?,
      deletedBy: json['deletedBy'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      languagePair: LanguagePairDto.fromJson(
          json['languagePair'] as Map<String, dynamic>),
      fileId: json['fileId'] as String,
      isOnboarding: json['isOnboarding'] as bool?,
      languagePairId: json['languagePairId'] as String,
      classs: ClassDto.fromJson(json['classs'] as Map<String, dynamic>),
      progress: json['progress'] as int?,
      lectures: (json['lectures'] as List<dynamic>?)
          ?.map((e) => LectureDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      icon: ImageDto.fromJson(json['icon'] as Map<String, dynamic>),
      isLocked: json['isLocked'] as bool,
      isPublished: json['isPublished'] as bool,
      order: json['order'] as int,
      classId: json['classId'] as String,
    );

Map<String, dynamic> _$CourseDtoToJson(CourseDto instance) => <String, dynamic>{
      'id': instance.id,
      'modified': instance.modified,
      'modifiedBy': instance.modifiedBy,
      'created': instance.created,
      'createdBy': instance.createdBy,
      'deleted': instance.deleted,
      'deletedBy': instance.deletedBy,
      'title': instance.title,
      'description': instance.description,
      'languagePair': instance.languagePair,
      'fileId': instance.fileId,
      'isOnboarding': instance.isOnboarding,
      'languagePairId': instance.languagePairId,
      'classs': instance.classs,
      'progress': instance.progress,
      'lectures': instance.lectures,
      'icon': instance.icon,
      'isLocked': instance.isLocked,
      'isPublished': instance.isPublished,
      'order': instance.order,
      'classId': instance.classId,
    };
