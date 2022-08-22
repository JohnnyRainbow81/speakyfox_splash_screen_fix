// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/responses/base_response.dart';
import 'package:speakyfox/data/responses/language_pair_response.dart';
import 'package:speakyfox/data/responses/offer_response.dart';
import 'package:speakyfox/data/responses/sequence_response.dart';

import 'course_response.dart';

part 'lecture_response.g.dart';

@JsonSerializable()
class LectureResponse extends BaseResponse {
  String title;
  String languagePairId;
  String description;
  bool isOnboarding;
  LanguagePairResponse languagePair;
  bool isPublished;
  bool isLocked;
  int order;
  CourseResponse course;
  int progress;
  OfferResponse offer;
  String offerId;
  String courseId;
  List<SequenceResponse> sequences = [];
  LectureResponse({
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
    required this.order,
    required this.course,
    required this.progress,
    required this.offer,
    required this.offerId,
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

  factory LectureResponse.fromJson(Map<String, dynamic> json) => _$LectureResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LectureResponseToJson(this);
}
