// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/dtos/screen_dto.dart';
import 'package:speakyfox/data/dtos/sentence_dto.dart';
import 'package:speakyfox/data/dtos/sentence_shell_dto.dart';
import 'package:speakyfox/data/dtos/sequence_dto.dart';
import 'package:speakyfox/data/dtos/vocabulary_dto.dart';
import 'package:speakyfox/data/dtos/vocabulary_shell_dto.dart';
import 'package:speakyfox/domain/models/screen.dart';

part 'game_dto.g.dart';

@JsonSerializable()
class GameDto extends ScreenDto {
  String instructions;
  GameDto({
    required String id,
    required String modified,
    required String modifiedBy,
    required String created,
    required String createdBy,
    required String deleted,
    required String deletedBy,
    required String title,
    required String description,
    required int order,
    required ScreenType type,
    required String sequenceId,
    required SequenceDto sequence,
    required String gameType,
    required List<VocabularyDto> vocabularies,
    required List<VocabularyShellDto> vocabularyShells,
    required List<SentenceDto> sentences,
    required List<SentenceShellDto> sentenceShells,
    required this.instructions,
  }) : super(
            description: description,
            gameType: gameType,
            id: id,
            order: order,
            sentenceShells: sentenceShells,
            sentences: sentences,
            sequence: sequence,
            sequenceId: sequenceId,
            title: title,
            type: type,
            vocabularies: vocabularies,
            vocabularyShells: vocabularyShells,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            modified: modified,
            modifiedBy: modifiedBy);

  factory GameDto.fromJson(Map<String, dynamic> json) => _$GameDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GameDtoToJson(this);
}
