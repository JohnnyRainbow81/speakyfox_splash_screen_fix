// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/responses/base_response.dart';
import 'package:speakyfox/data/responses/sentence_response.dart';

part 'sentence_shell_response.g.dart';

@JsonSerializable()
class SentenceShellResponse extends BaseResponse {
  String title;
  String description;
  List<SentenceResponse> sentences;

  SentenceShellResponse({
    required String id,
    required this.title,
    required this.description,
    required this.sentences,
  }) : super(id: id);

  factory SentenceShellResponse.fromJson(Map<String, dynamic> json) => _$SentenceShellResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SentenceShellResponseToJson(this);
}
