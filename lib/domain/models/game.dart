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
      String? modified,
      String? modifiedBy,
      String? created,
      String? createdBy,
      String? deleted,
      String? deletedBy,
      required ScreenType? screenType,
      List<VocabularyShell> ? vocabularyShells,
      List<Sentence>? sentences,
      List<SentenceShell>? sentenceShells,
      required String title,
      required String description,
      required this.instructions,
      required int order,
      required GameType gameType,
       Sequence? sequence,
       String? sequenceId,
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
            screenType: screenType,
            sequenceId: sequenceId,
            sequence: sequence,
            gameType: gameType,
            vocabularies: vocabularies,
            vocabularyShells: vocabularyShells,
            sentences: sentences,
            sentenceShells: sentenceShells);
}

enum GameType {
  @JsonValue("VocabularyImage")
  vocabularyImage,
  @JsonValue("VocabularyImageGame")
  vocabularyImageGame,
  @JsonValue("SentenceImageGame")
  sentenceImageGame,
  @JsonValue("VocabularyImageQuiz")
  vocabularyImageQuiz,
  @JsonValue("VocabularyLearned")
  vocabularyLearned,
  @JsonValue("ChooseTranslation")
  chooseTranslation,
  @JsonValue("TapWhatYouHear")
  tapWhatYouHear,
  @JsonValue("MatchWords")
  matchWords,
  @JsonValue("SingleTranslationWord")
  singleTranslationWord,
  @JsonValue("SingleTranslationSentence")
  singleTranslationSentence,
  @JsonValue("MultipleTranslation")
  multipleTranslation,
  @JsonValue("SwipingVocabularyImage")
  swipingVocabularyImage,
  @JsonValue("TranslateThisSentence")
  translateThisSentence,
  @JsonValue("TranslateSourceSentence")
  translateSourceSentence,
  @JsonValue("TranslateTargetSentence")
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
