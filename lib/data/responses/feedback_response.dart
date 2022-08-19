// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/responses/screen_response.dart';
import 'package:speakyfox/data/responses/sentence_response.dart';
import 'package:speakyfox/data/responses/sentence_shell_response.dart';
import 'package:speakyfox/data/responses/sequence_response.dart';
import 'package:speakyfox/data/responses/vocabulary_response.dart';
import 'package:speakyfox/data/responses/vocabulary_shell_response.dart';
import 'package:speakyfox/domain/models/game.dart';
import 'package:speakyfox/domain/models/screen.dart';

part 'feedback_response.g.dart';

@JsonSerializable()
class FeedbackResponse extends ScreenResponse {
  String feedbackType;

  FeedbackResponse({
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
      required GameType gameType,
      required List<VocabularyResponse> vocabularies,
      required List<VocabularyShellResponse> vocabularyShells,
      required List<SentenceResponse> sentences,
      required List<SentenceShellResponse> sentenceShells,
    required this.feedbackType,
  }) : super(id: id,
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



  factory FeedbackResponse.fromJson(Map<String, dynamic> json) => _$FeedbackResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FeedbackResponseToJson(this);
}
