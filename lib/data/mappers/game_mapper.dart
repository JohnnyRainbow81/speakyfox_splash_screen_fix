import 'package:speakyfox/data/mappers/sentence_mapper.dart';
import 'package:speakyfox/data/mappers/sentence_shell_mapper.dart';
import 'package:speakyfox/data/mappers/sequence_mapper.dart';
import 'package:speakyfox/data/mappers/vocabulary_mapper.dart';
import 'package:speakyfox/data/mappers/vocabulary_shell_mapper.dart';
import 'package:speakyfox/data/dtos/game_dto.dart';
import 'package:speakyfox/domain/models/game.dart';

extension GameMapper on GameDto {
  Game toGame() {
    return Game(
        id: id,
        modified: modified ?? "",
        modifiedBy: modifiedBy ?? "",
        created: created ?? "",
        createdBy: createdBy ?? "",
        deleted: deleted ?? "",
        deletedBy: deletedBy ?? "",
        type: type,
        vocabularyShells: vocabularyShells.map((vocabularyShell) => vocabularyShell.toVocabularyShell()).toList(),
        sentences: sentences.map((sentence) => sentence.toSentence()).toList(),
        sentenceShells: sentenceShells.map((sentenceShell) => sentenceShell.toSentenceShell()).toList(),
        title: title,
        description: description,
        instructions: instructions,
        order: order,
        gameType: GameType.values.byName(gameType.toLowerCase()),
        sequence: sequence.toSequence(),
        sequenceId: sequenceId,
        vocabularies: vocabularies.map((vocabulary) => vocabulary.toVocabulary()).toList());
  }
}
