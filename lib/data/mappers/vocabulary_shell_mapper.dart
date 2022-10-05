import 'package:speakyfox/data/mappers/vocabulary_mapper.dart';
import 'package:speakyfox/data/dtos/vocabulary_shell_dto.dart';
import 'package:speakyfox/domain/models/vocabulary_shell.dart';

extension VocabularyShellMapper on VocabularyShellDto {
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

extension VocabularyShellDtoMapper on VocabularyShell {
  VocabularyShellDto toVocabularyShellDto() {
    return VocabularyShellDto(id: id, title: title, description: description, vocabularies: vocabularies.map((e) => e.toVocabularyDto()).toList());
  }
}
