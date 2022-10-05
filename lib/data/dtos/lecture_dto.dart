// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/dtos/base_dto.dart';
import 'package:speakyfox/data/dtos/language_pair_dto.dart';
import 'package:speakyfox/data/dtos/offer_dto.dart';
import 'package:speakyfox/data/dtos/sequence_dto.dart';

import 'course_dto.dart';

part 'lecture_dto.g.dart';

@JsonSerializable()
class LectureDto extends BaseDto {
  String title;
  String languagePairId;
  String description;
  bool? isOnboarding;
  LanguagePairDto? languagePair;
  bool isPublished;
  bool isLocked;
  int? order;
  CourseDto? course;
  double? progress;
  OfferDto? offer;
  String? offerId;
  String courseId;
  List<SequenceDto> sequences = [];
  LectureDto({
    required String id,
    String? modified,
    String? modifiedBy,
    String? created,
    String? createdBy,
    String? deleted,
    String? deletedBy,
    required this.title,
    required this.languagePairId,
    required this.description,
    required this.isOnboarding,
    required this.languagePair,
    required this.isPublished,
    required this.isLocked,
    this.order,
    this.course,
    required this.progress,
    this.offer,
    this.offerId,
    required this.courseId,
    required this.sequences,
  }) : super(
            id: id,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            modified: modified,
            modifiedBy: modifiedBy);

  factory LectureDto.fromJson(Map<String, dynamic> json) => _$LectureDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LectureDtoToJson(this);
}
