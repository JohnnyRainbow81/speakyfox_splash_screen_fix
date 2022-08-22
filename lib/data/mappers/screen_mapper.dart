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
        type: type,
        sequenceId: sequenceId,
        sequence: sequence.toSequence(),
        gameType: gameType,
        vocabularies: vocabularies.map((vocabulary) => vocabulary.toVocabulary()).toList(),
        vocabularyShells: vocabularyShells.map((vocabularyShell) => vocabularyShell.toVocabularyShell()).toList(),
        sentences: sentences.map((sentence) => sentence.toSentence()).toList(),
        sentenceShells: sentenceShells.map((sentenceShell) => sentenceShell.toSentenceShell()).toList());
  }
}
