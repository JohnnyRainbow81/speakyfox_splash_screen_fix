import 'package:json_annotation/json_annotation.dart';
import 'package:speakyfox/domain/models/game.dart';
import 'package:speakyfox/domain/models/screen.dart';
import 'package:speakyfox/domain/models/vocabulary_shell.dart';
import 'package:speakyfox/domain/models/vocabulary.dart';
import 'package:speakyfox/domain/models/sequence.dart';
import 'package:speakyfox/domain/models/sentence_shell.dart';
import 'package:speakyfox/domain/models/sentence.dart';

enum FeedbackType { @JsonValue("situative")situative, @JsonValue("immediate")immediate }

final List<dynamic> FeedbackTypes = [
  {"id": 1, "key": FeedbackType.situative},
  {"id": 2, "key": FeedbackType.immediate}
];

class Feedback extends Screen {
  String feedbackType;

  Feedback(
      {required String id,
      required String modified,
      required String modifiedBy,
      required String created,
      required String createdBy,
      required String deleted,
      required String deletedBy,
      required String title,
      required String description,
      required num order,
      required ScreenType type,
      required String sequenceId,
      required Sequence sequence,
      required GameType gameType,
      required List<Vocabulary> vocabularies,
      required List<VocabularyShell> vocabularyShells,
      required List<Sentence> sentences,
      required List<SentenceShell> sentenceShells,
      required this.feedbackType})
      : super(
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
            gameType: gameType,
            vocabularies: vocabularies,
            vocabularyShells: vocabularyShells,
            sentences: sentences,
            sentenceShells: sentenceShells);
}
