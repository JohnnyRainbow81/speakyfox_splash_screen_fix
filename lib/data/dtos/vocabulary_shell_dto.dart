// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/dtos/base_dto.dart';
import 'package:speakyfox/data/dtos/vocabulary_dto.dart';

part 'vocabulary_shell_dto.g.dart';

@JsonSerializable()
class VocabularyShellDto extends BaseDto {
  String title;
  String description;
  List<VocabularyDto> vocabularies;

  VocabularyShellDto({
    required String id,
    String? modified,
    String? modifiedBy,
    String? created,
    String? createdBy,
    String? deleted,
    String? deletedBy,
    required this.title,
    required this.description,
    required this.vocabularies,
  }) : super(
            id: id,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            modified: modified,
            modifiedBy: modifiedBy);

  factory VocabularyShellDto.fromJson(Map<String, dynamic> json) => _$VocabularyShellDtoFromJson(json);
  Map<String, dynamic> toJson() => _$VocabularyShellDtoToJson(this);
}
