// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/dtos/screen_dto.dart';
import 'package:speakyfox/data/dtos/sentence_dto.dart';
import 'package:speakyfox/data/dtos/sentence_shell_dto.dart';
import 'package:speakyfox/data/dtos/sequence_dto.dart';
import 'package:speakyfox/data/dtos/vocabulary_dto.dart';
import 'package:speakyfox/data/dtos/vocabulary_shell_dto.dart';
import 'package:speakyfox/domain/models/game.dart';
import 'package:speakyfox/domain/models/screen.dart';

part 'game_dto.g.dart';

@JsonSerializable()
class GameDto extends ScreenDto {
  String instructions;
  GameDto({
    required String id,
    String? modified,
    String? modifiedBy,
    String? created,
    String? createdBy,
    String? deleted,
    String? deletedBy,
    required String title,
    required String description,
    required int order,
     ScreenType? screenType,
     String? sequenceId,
     SequenceDto? sequence,
    required GameType gameType,
    required List<VocabularyDto> vocabularies,
    List<VocabularyShellDto>? vocabularyShells,
    List<SentenceDto>? sentences,
     List<SentenceShellDto>? sentenceShells,
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
            screenType: screenType,
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
