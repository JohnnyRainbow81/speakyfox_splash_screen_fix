import 'package:speakyfox/data/mappers/sentence_mapper.dart';
import 'package:speakyfox/data/mappers/sentence_shell_mapper.dart';
import 'package:speakyfox/data/mappers/sequence_mapper.dart';
import 'package:speakyfox/data/mappers/vocabulary_mapper.dart';
import 'package:speakyfox/data/mappers/vocabulary_shell_mapper.dart';
import 'package:speakyfox/data/dtos/screen_dto.dart';
import 'package:speakyfox/domain/models/screen.dart';

extension ScreenMapper on ScreenDto {
  Screen toScreen() {
    return Screen(
        id: id,
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
        sequence: sequence?.toSequence(),
        gameType: gameType,
        vocabularies: vocabularies?.map((vocabulary) => vocabulary.toVocabulary()).toList() ?? [],
        vocabularyShells: vocabularyShells?.map((vocabularyShell) => vocabularyShell.toVocabularyShell()).toList(),
        sentences: sentences?.map((sentence) => sentence.toSentence()).toList(),
        sentenceShells: sentenceShells?.map((sentenceShell) => sentenceShell.toSentenceShell()).toList());
  }
}

extension ScreenDtoMaper on Screen {
  ScreenDto toScreenDto() {
    return ScreenDto(
        id: id,
        modified: modified,
        modifiedBy: modifiedBy,
        created: created,
        createdBy: createdBy,
        deleted: deleted,
        deletedBy: deletedBy,
        screenType: screenType,
        sequence: sequence?.toSequenceDto(),
        vocabularyShells: vocabularyShells?.map((e) => e.toVocabularyShellDto()).toList(),
        sentences: sentences?.map((e) => e.toSentenceDto()).toList(),
        sentenceShells: sentenceShells?.map((e) => e.toSentenceShellDto()).toList(),
        title: title,
        description: description,
        order: order,
        sequenceId: sequenceId,
        gameType: gameType,
        vocabularies: vocabularies.map((e) => e.toVocabularyDto()).toList());
  }
}
