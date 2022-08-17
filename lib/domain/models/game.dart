import 'package:json_annotation/json_annotation.dart';
import 'package:speakyfox/domain/models/sentence_shell.dart';

import 'package:speakyfox/domain/models/sentence.dart';
import 'package:speakyfox/domain/models/screen.dart';
import 'package:speakyfox/domain/models/vocabulary_shell.dart';
import 'sequence.dart' show Sequence;
import 'vocabulary.dart' show Vocabulary;

class Game extends Screen {
  String instructions;

  Game(
      {required String id,
      required String modified,
      required String modifiedBy,
      required String created,
      required String createdBy,
      required String deleted,
      required String deletedBy,
      required ScreenType type,
      required List<VocabularyShell> vocabularyShells,
      required List<Sentence> sentences,
      required List<SentenceShell> sentenceShells,
      required String title,
      required String description,
      required this.instructions,
      required num order,
      required GameType gameType,
      required Sequence sequence,
      required String sequenceId,
      required List<Vocabulary> vocabularies})
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
            gameType: gameType.name,
            vocabularies: vocabularies,
            vocabularyShells: vocabularyShells,
            sentences: sentences,
            sentenceShells: sentenceShells);
}

enum GameType {
  @JsonValue("vocabularyImageGame")
  vocabularyImageGame,
  @JsonValue("sentenceImageGame")
  sentenceImageGame,
  @JsonValue("vocabularyImageQuiz")
  vocabularyImageQuiz,
  @JsonValue("vocabularyLearned")
  vocabularyLearned,
  @JsonValue("chooseTranslation")
  chooseTranslation,
  @JsonValue("tapWhatYouHear")
  tapWhatYouHear,
  @JsonValue("matchWords")
  matchWords,
  @JsonValue("singleTranslationWord")
  singleTranslationWord,
  @JsonValue("singleTranslationSentence")
  singleTranslationSentence,
  @JsonValue("multipleTranslation")
  multipleTranslation,
  @JsonValue("swipingVocabularyImage")
  swipingVocabularyImage,
  @JsonValue("translateThisSentence")
  translateThisSentence,
  @JsonValue("translateSourceSentence")
  translateSourceSentence,
  @JsonValue("translateTargetSentence")
  translateTargetSentence
}

// class GameTypeHelper {
//   static var GameTypes = [
//     GameType.vocabularyImageGame,
//     GameType.vocabularyImageQuiz,
//     GameType.vocabularyLearned,
//     GameType.chooseTranslation,
//     GameType.tapWhatYouHear,
//     GameType.matchWords,
//     GameType.singleTranslationWord,
//     GameType.singleTranslationSentence,
//     GameType.multipleTranslation,
//     GameType.swipingVocabularyImage,
//     GameType.translateThisSentence,
//     GameType.translateSourceSentence,
//     GameType.translateTargetSentence
//   ];
// }
