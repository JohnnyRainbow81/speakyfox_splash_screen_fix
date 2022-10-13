// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/dtos/base_dto.dart';
import 'package:speakyfox/data/dtos/course_dto.dart';
import 'package:speakyfox/data/dtos/image_dto.dart';
import 'package:speakyfox/data/dtos/language_pair_dto.dart';

part 'class_dto.g.dart';

@JsonSerializable()
class ClassDto extends BaseDto {
  String title;
  String description;
  bool isPublished;
  bool? isOnboarding;
  double? progress;
  int order;
  ImageDto? icon;
  String? fileId;
  String? languagePairId;
  bool isLocked;
  LanguagePairDto? languagePair; //FIXME type!
  List<CourseDto> courses;
  ClassDto({
    required String id,
    String? modified,
    String? modifiedBy,
    String? created,
    String? createdBy,
    String? deleted,
    String? deletedBy,
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

  factory ClassDto.fromJson(Map<String, dynamic> json) => _$ClassDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ClassDtoToJson(this);
}
