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
        screenType: screenType,
        vocabularyShells: vocabularyShells?.map((vocabularyShell) => vocabularyShell.toVocabularyShell()).toList(),
        sentences: sentences?.map((sentence) => sentence.toSentence()).toList(),
        sentenceShells: sentenceShells?.map((sentenceShell) => sentenceShell.toSentenceShell()).toList(),
        title: title,
        description: description,
        instructions: instructions,
        order: order,
        gameType: gameType,
        sequence: sequence?.toSequence(),
        sequenceId: sequenceId,
        vocabularies: vocabularies.map((vocabulary) => vocabulary.toVocabulary()).toList());
  }
}

extension GameDtoMapper on Game {
  GameDto toGameDto() {
    return GameDto(
        id: id ?? "",
        modified: modified ?? "",
        modifiedBy: modifiedBy ?? "",
        created: created ?? "",
        createdBy: createdBy ?? "",
        deleted: deleted ?? "",
        deletedBy: deletedBy ?? "",
        title: title,
        description: description,
        order: order,
        screenType: screenType,
        sequenceId: sequenceId,
        sequence: sequence?.toSequenceDto(),
        gameType: gameType,
        vocabularies: vocabularies.map((e) => e.toVocabularyDto()).toList(),
        vocabularyShells: vocabularyShells?.map((e) => e.toVocabularyShellDto()).toList(),
        sentences: sentences?.map((e) => e.toSentenceDto()).toList(),
        sentenceShells: sentenceShells?.map((e) => e.toSentenceShellDto()).toList(),
        instructions: instructions);
  }
}
