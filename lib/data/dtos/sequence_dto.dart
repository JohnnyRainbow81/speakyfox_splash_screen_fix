// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:speakyfox/data/dtos/base_dto.dart';

import 'package:speakyfox/data/dtos/game_dto.dart';
import 'package:speakyfox/data/dtos/lecture_dto.dart';
import 'package:speakyfox/data/dtos/screen_dto.dart';
import 'package:speakyfox/domain/models/sequence.dart';

part 'sequence_dto.g.dart';

@JsonSerializable()
class SequenceDto extends BaseDto {
  String title;
  String description;
  ProgressType progressType;
  List<GameDto>? games;
  LectureDto? parent;
  int order;
  List<ScreenDto>? screens;

  SequenceDto({
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
    required this.order,
    this.screens,
  }) : super(
            id: id,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            modified: modified,
            modifiedBy: modifiedBy);

  factory SequenceDto.fromJson(Map<String, dynamic> json) => _$SequenceDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SequenceDtoToJson(this);
}
