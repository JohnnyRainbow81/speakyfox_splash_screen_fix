import 'package:speakyfox/data/mappers/sentence_mapper.dart';
import 'package:speakyfox/data/responses/sentence_shell_response.dart';
import 'package:speakyfox/domain/models/sentence_shell.dart';

extension SentenceShellMapper on SentenceShellResponse {
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
