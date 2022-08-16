import 'package:speakyfox/domain/models/vocabulary_shell.dart';

import 'package:speakyfox/domain/models/sentence_shell.dart';

import 'package:speakyfox/domain/models/sentence.dart';

import 'package:speakyfox/domain/models/screen.dart';

import 'sequence.dart' show Sequence;
import 'vocabulary.dart' show Vocabulary;

class Game extends Screen {
  String title;
  String description;
  String instructions;
  num order;
  GameType gameType;
  List<Vocabulary> vocabularies = [];
  String sequenceId;
  Sequence sequence;

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
      required this.title,
      required this.description,
      required this.instructions,
      required this.order,
      required this.gameType,
      required this.sequence,
      required this.sequenceId,
      required this.vocabularies})
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

enum GameType {
  vocabularyImageGame,
  sentenceImageGame,
  vocabularyImageQuiz,
  vocabularyLearned,
  chooseTranslation,
  tapWhatYouHear,
  matchWords,
  singleTranslationWord,
  singleTranslationSentence,
  multipleTranslation,
  swipingVocabularyImage,
  translateThisSentence,
  translateSourceSentence,
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
