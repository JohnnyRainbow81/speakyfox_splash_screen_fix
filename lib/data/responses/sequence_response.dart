// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:speakyfox/data/responses/base_response.dart';

import 'package:speakyfox/data/responses/game_response.dart';
import 'package:speakyfox/data/responses/lecture_response.dart';
import 'package:speakyfox/domain/models/sequence.dart';

part 'sequence_response.g.dart';

@JsonSerializable()
class SequenceResponse extends BaseResponse {
  String title;
  String description;
  ProgressType progressType;
  List<GameResponse> games;
  LectureResponse parent;

  SequenceResponse({
    required String id,
    required this.title,
    required this.description,
    required this.progressType,
    required this.games,
    required this.parent,
  }) : super(id: id);

  factory SequenceResponse.fromJson(Map<String, dynamic> json) => _$SequenceResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SequenceResponseToJson(this);
}
