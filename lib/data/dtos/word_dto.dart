// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/dtos/base_dto.dart';
import 'package:speakyfox/data/dtos/vocabulary_shell_dto.dart';

import '../../domain/models/sentence.dart';

part 'word_dto.g.dart';

@JsonSerializable()
class WordDto extends BaseDto {
  int index;
  String entry;
  List<Map> metadata;
  TermType type;
  String vocabularyShellId;
  VocabularyShellDto vocabularyShell;

  WordDto({
    required String id,
    String? modified,
    String? modifiedBy,
    String? created,
    String? createdBy,
    String? deleted,
    String? deletedBy,
    required this.index,
    required this.entry,
    required this.metadata,
    required this.type,
    required this.vocabularyShellId,
    required this.vocabularyShell,
  }) : super(
            id: id,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            modified: modified,
            modifiedBy: modifiedBy);

  factory WordDto.fromJson(Map<String, dynamic> json) => _$WordDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WordDtoToJson(this);
}
