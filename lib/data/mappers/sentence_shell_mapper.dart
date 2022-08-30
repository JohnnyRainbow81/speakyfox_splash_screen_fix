import 'package:speakyfox/data/mappers/sentence_mapper.dart';
import 'package:speakyfox/data/dtos/sentence_shell_dto.dart';
import 'package:speakyfox/domain/models/sentence_shell.dart';

extension SentenceShellMapper on SentenceShellDto {
  SentenceShell toSentenceShell() {
    return SentenceShell(
        id: id,
        modified: modified ?? "",
        modifiedBy: modifiedBy ?? "",
        created: created ?? "",
        createdBy: createdBy ?? "",
        deleted: deleted ?? "",
        deletedBy: deletedBy ?? "",
        title: title,
        description: description,
        sentences: sentences.map((sentence) => sentence.toSentence()).toList());
  }
}

extension SentenceShellDtoMapper on SentenceShell {
  SentenceShellDto toSentenceShellDto() {
    return SentenceShellDto(
        id: id ?? "",
        title: title,
        description: description,
        sentences: sentences.map((e) => e.toSentenceDto()).toList());
  }
}
