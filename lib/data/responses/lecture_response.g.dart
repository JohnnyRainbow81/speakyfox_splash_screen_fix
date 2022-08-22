// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LectureResponse _$LectureResponseFromJson(Map<String, dynamic> json) =>
    LectureResponse(
      id: json['id'] as String,
      modified: json['modified'] as String?,
      modifiedBy: json['modifiedBy'] as String?,
      created: json['created'] as String?,
      createdBy: json['createdBy'] as String?,
      deleted: json['deleted'] as String?,
      deletedBy: json['deletedBy'] as String?,
      title: json['title'] as String,
      languagePairId: json['languagePairId'] as String,
      description: json['description'] as String,
      isOnboarding: json['isOnboarding'] as bool,
      languagePair: LanguagePairResponse.fromJson(
          json['languagePair'] as Map<String, dynamic>),
      isPublished: json['isPublished'] as bool,
      isLocked: json['isLocked'] as bool,
      order: json['order'] as int,
      course: CourseResponse.fromJson(json['course'] as Map<String, dynamic>),
      progress: json['progress'] as int,
      offer: OfferResponse.fromJson(json['offer'] as Map<String, dynamic>),
      offerId: json['offerId'] as String,
      courseId: json['courseId'] as String,
      sequences: (json['sequences'] as List<dynamic>)
          .map((e) => SequenceResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LectureResponseToJson(LectureResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'modified': instance.modified,
      'modifiedBy': instance.modifiedBy,
      'created': instance.created,
      'createdBy': instance.createdBy,
      'deleted': instance.deleted,
      'deletedBy': instance.deletedBy,
      'title': instance.title,
      'languagePairId': instance.languagePairId,
      'description': instance.description,
      'isOnboarding': instance.isOnboarding,
      'languagePair': instance.languagePair,
      'isPublished': instance.isPublished,
      'isLocked': instance.isLocked,
      'order': instance.order,
      'course': instance.course,
      'progress': instance.progress,
      'offer': instance.offer,
      'offerId': instance.offerId,
      'courseId': instance.courseId,
      'sequences': instance.sequences,
    };
