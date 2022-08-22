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
    String? modified,
    String? modifiedBy,
    String? created,
    String? createdBy,
    String? deleted,
    String? deletedBy,
    required this.title,
    required this.description,
    required this.progressType,
    required this.games,
    required this.parent,
  }) : super(
            id: id,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            modified: modified,
            modifiedBy: modifiedBy);

  factory SequenceResponse.fromJson(Map<String, dynamic> json) => _$SequenceResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SequenceResponseToJson(this);
}
