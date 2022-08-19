// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:speakyfox/data/responses/base_response.dart';

part 'answer_response.g.dart';

@JsonSerializable()
class AnswerResponse extends BaseResponse {
  String title;
  bool isCorrect;

  AnswerResponse({
    required String id,
    required this.title,
    required this.isCorrect,
  }) : super(id: id);

  factory AnswerResponse.fromJson(Map<String, dynamic> json) => _$AnswerResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerResponseToJson(this);
}
