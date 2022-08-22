// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/dtos/base_dto.dart';
import 'package:speakyfox/data/dtos/sentence_dto.dart';
import 'package:speakyfox/data/dtos/sentence_shell_dto.dart';
import 'package:speakyfox/data/dtos/sequence_dto.dart';
import 'package:speakyfox/data/dtos/vocabulary_dto.dart';
import 'package:speakyfox/data/dtos/vocabulary_shell_dto.dart';

import '../../domain/models/screen.dart';

part 'screen_dto.g.dart';

@JsonSerializable()
class ScreenDto extends BaseDto {
  String title;
  String description;
  int order;
  ScreenType type;
  String sequenceId;
  SequenceDto sequence;
  String gameType; //FIXME   only to Subclass?
  List<VocabularyDto> vocabularies;
  List<VocabularyShellDto> vocabularyShells;
  List<SentenceDto> sentences;
  List<SentenceShellDto> sentenceShells;
  ScreenDto({
    required String id,
    String? modified,
    String? modifiedBy,
    String? created,
    String? createdBy,
    String? deleted,
    String? deletedBy,
    required this.title,
    required this.description,
    required this.order,
    required this.type,
    required this.sequenceId,
    required this.sequence,
    required this.gameType,
    required this.vocabularies,
    required this.vocabularyShells,
    required this.sentences,
    required this.sentenceShells,
  }) : super(
            id: id,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            modified: modified,
            modifiedBy: modifiedBy);

  factory ScreenDto.fromJson(Map<String, dynamic> json) => _$ScreenDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ScreenDtoToJson(this);
}
