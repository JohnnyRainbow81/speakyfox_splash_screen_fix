import 'package:speakyfox/data/mappers/vocabulary_mapper.dart';
import 'package:speakyfox/data/responses/vocabulary_shell_response.dart';
import 'package:speakyfox/domain/models/vocabulary_shell.dart';

extension VocabularyShellMapper on VocabularyShellResponse {
  VocabularyShell toVocabularyShell() {
    return VocabularyShell(
        id: id,
        modified: modified ?? "",
        modifiedBy: modifiedBy ?? "",
        created: created ?? "",
        createdBy: createdBy ?? "",
        deleted: deleted ?? "",
        deletedBy: deletedBy ?? "",
        title: title,
        description: description,
        vocabularies: vocabularies.map((vocabulary) => vocabulary.toVocabulary()).toList());
  }
}
