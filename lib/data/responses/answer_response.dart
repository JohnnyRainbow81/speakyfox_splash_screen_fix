// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'answer_response.g.dart';

@JsonSerializable()
class AnswerResponse {
  String title;
  bool isCorrect;
  
  AnswerResponse({
    required this.title,
    required this.isCorrect,
  });

  factory AnswerResponse.fromJson(Map<String, dynamic> json) => _$AnswerResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerResponseToJson(this);
}
