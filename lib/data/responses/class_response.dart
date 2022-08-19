// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/responses/base_response.dart';
import 'package:speakyfox/data/responses/course_response.dart';
import 'package:speakyfox/data/responses/image_response.dart';

part 'class_response.g.dart';

@JsonSerializable()
class ClassResponse extends BaseResponse {
  String title;
  String description;
  bool isPublished;
  bool isOnboarding;
  int progress;
  int order;
  ImageResponse icon;
  String fileId;
  String languagePairId;
  bool isLocked;
  String languagePair; //FIXME type!
  List<CourseResponse> courses;
  ClassResponse({
    required String id,
    required String modified,
    required String modifiedBy,
    required String created,
    required String createdBy,
    required String deleted,
    required String deletedBy,
    required this.title,
    required this.description,
    required this.isPublished,
    required this.isOnboarding,
    required this.progress,
    required this.order,
    required this.icon,
    required this.fileId,
    required this.languagePairId,
    required this.isLocked,
    required this.languagePair,
    required this.courses,
  }) : super(
            id: id,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            modified: modified,
            modifiedBy: modifiedBy);

  factory ClassResponse.fromJson(Map<String, dynamic> json) => _$ClassResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ClassResponseToJson(this);
}
