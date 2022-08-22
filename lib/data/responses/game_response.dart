// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/responses/screen_response.dart';
import 'package:speakyfox/data/responses/sentence_response.dart';
import 'package:speakyfox/data/responses/sentence_shell_response.dart';
import 'package:speakyfox/data/responses/sequence_response.dart';
import 'package:speakyfox/data/responses/vocabulary_response.dart';
import 'package:speakyfox/data/responses/vocabulary_shell_response.dart';
import 'package:speakyfox/domain/models/screen.dart';

part 'game_response.g.dart';

@JsonSerializable()
class GameResponse extends ScreenResponse {
  String instructions;
  GameResponse({
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
    required SequenceResponse sequence,
    required String gameType,
    required List<VocabularyResponse> vocabularies,
    required List<VocabularyShellResponse> vocabularyShells,
    required List<SentenceResponse> sentences,
    required List<SentenceShellResponse> sentenceShells,
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

  factory GameResponse.fromJson(Map<String, dynamic> json) => _$GameResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GameResponseToJson(this);
}
