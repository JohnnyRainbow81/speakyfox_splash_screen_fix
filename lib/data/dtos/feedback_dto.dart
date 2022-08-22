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

part 'feedback_dto.g.dart';

@JsonSerializable()
class FeedbackDto extends ScreenDto {
  String feedbackType;

  FeedbackDto({
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
    required ScreenType type,
    required String sequenceId,
    required SequenceDto sequence,
    required GameType gameType,
    required List<VocabularyDto> vocabularies,
    required List<VocabularyShellDto> vocabularyShells,
    required List<SentenceDto> sentences,
    required List<SentenceShellDto> sentenceShells,
    required this.feedbackType,
  }) : super(
            id: id,
            modified: modified,
            modifiedBy: modifiedBy,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            title: title,
            description: description,
            order: order,
            type: type,
            sequenceId: sequenceId,
            sequence: sequence,
            gameType: gameType.name,
            vocabularies: vocabularies,
            vocabularyShells: vocabularyShells,
            sentences: sentences,
            sentenceShells: sentenceShells);

  factory FeedbackDto.fromJson(Map<String, dynamic> json) => _$FeedbackDtoFromJson(json);
  Map<String, dynamic> toJson() => _$FeedbackDtoToJson(this);
}
