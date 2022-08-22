// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/dtos/base_dto.dart';
import 'package:speakyfox/data/dtos/word_dto.dart';

import '../../domain/models/sentence.dart';

part 'highlighted_part_dto.g.dart';

@JsonSerializable()
class HighlightedPartDto extends BaseDto {
  List<Map> metadata;
  TermType type;
  List<WordDto> words;

  HighlightedPartDto({
    required String id,
    required String modified,
    required String modifiedBy,
    required String created,
    required String createdBy,
    required String deleted,
    required String deletedBy,
    required this.metadata,
    required this.type,
    required this.words,
  }) : super(
            id: id,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            modified: modified,
            modifiedBy: modifiedBy);

  factory HighlightedPartDto.fromJson(Map<String, dynamic> json) => _$HighlightedPartDtoFromJson(json);
  Map<String, dynamic> toJson() => _$HighlightedPartDtoToJson(this);
}
