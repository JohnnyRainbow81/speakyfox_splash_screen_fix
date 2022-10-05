// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/dtos/base_dto.dart';
import 'package:speakyfox/data/dtos/class_dto.dart';
import 'package:speakyfox/data/dtos/image_dto.dart';
import 'package:speakyfox/data/dtos/lecture_dto.dart';

part 'course_dto.g.dart';

@JsonSerializable()
class CourseDto extends BaseDto {
  String title;
  String description;
  String? fileId;
  bool? isOnboarding;
  String languagePairId;
  ClassDto? classs;
  double? progress;
  List<LectureDto>? lectures;
  ImageDto? icon;
  bool isLocked;
  bool isPublished;
  int order;
  String? classId;

  CourseDto({
    required String id,
    String? modified,
    String? modifiedBy,
    String? created,
    String? createdBy,
    String? deleted,
    String? deletedBy,
    required this.title,
    required this.description,
    required this.fileId,
    this.isOnboarding,
    required this.languagePairId,
     this.classs,
    this.progress,
    this.lectures,
    this.icon,
    required this.isLocked,
    required this.isPublished,
    required this.order,
    this.classId,
  }) : super(
            id: id,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            modified: modified,
            modifiedBy: modifiedBy);

  factory CourseDto.fromJson(Map<String, dynamic> json) => _$CourseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CourseDtoToJson(this);
}
