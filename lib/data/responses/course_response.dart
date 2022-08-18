// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/responses/base_response.dart';
import 'package:speakyfox/data/responses/class_response.dart';
import 'package:speakyfox/data/responses/image_response.dart';
import 'package:speakyfox/data/responses/language_pair_response.dart';
import 'package:speakyfox/data/responses/lecture_response.dart';

part 'course_response.g.dart';

@JsonSerializable()
class CourseResponse extends BaseResponse {

 String title;
  String description;
  LanguagePairResponse languagePair;
  String fileId;
  bool? isOnboarding;
  String languagePairId;
  ClassResponse classs;
  int? progress;
  List<LectureResponse>? lectures;
  ImageResponse icon;  
  bool isLocked;
  bool isPublished;
  int order;
  String classId;

  CourseResponse({
    required String id,
    required this.title,
    required this.description,
    required this.languagePair,
    required this.fileId,
    this.isOnboarding,
    required this.languagePairId,
    required this.classs,
    this.progress,
    this.lectures,
    required this.icon,
    required this.isLocked,
    required this.isPublished,
    required this.order,
    required this.classId,
  }) : super(id: id);

  

  factory CourseResponse.fromJson(Map<String, dynamic> json) => _$CourseReponseFromJson(json);
  Map<String, dynamic> toJson() => _$CourseReponseToJson(this);
}
