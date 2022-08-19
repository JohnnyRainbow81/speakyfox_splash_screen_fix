import 'package:speakyfox/data/mappers/vocabulary_shell_mapper.dart';
import 'package:speakyfox/data/responses/word_response.dart';
import 'package:speakyfox/domain/models/word.dart';

extension WordMapper on WordResponse {
  Word toWord() {
    return Word(
        id: id,
        modified: modified ?? "",
        modifiedBy: modifiedBy ?? "",
        created: created ?? "",
        createdBy: createdBy ?? "",
        deleted: deleted ?? "",
        deletedBy: deletedBy ?? "",
        index: index,
        entry: entry,
        metadata: metadata,
        type: type,
        vocabularyShellId: vocabularyShellId,
        vocabularyShell: vocabularyShell.toVocabularyShell());
  }
}
