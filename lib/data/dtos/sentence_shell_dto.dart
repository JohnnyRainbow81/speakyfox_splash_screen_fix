// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/dtos/base_dto.dart';
import 'package:speakyfox/data/dtos/sentence_dto.dart';

part 'sentence_shell_dto.g.dart';

@JsonSerializable()
class SentenceShellDto extends BaseDto {
  String title;
  String description;
  List<SentenceDto> sentences;

  SentenceShellDto({
    required String id,
    String? modified,
    String? modifiedBy,
    String? created,
    String? createdBy,
    String? deleted,
    String? deletedBy,
    required this.title,
    required this.description,
    required this.sentences,
  }) : super(
            id: id,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            modified: modified,
            modifiedBy: modifiedBy);

  factory SentenceShellDto.fromJson(Map<String, dynamic> json) => _$SentenceShellDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SentenceShellDtoToJson(this);
}
