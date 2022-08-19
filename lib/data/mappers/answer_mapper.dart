import 'package:speakyfox/data/responses/answer_response.dart';
import 'package:speakyfox/domain/models/answer.dart';

extension AnswerMapper on AnswerResponse {
  Answer toAnswer() {
    return Answer(
        id: id,
        modified: modified ?? "",
        modifiedBy: modifiedBy ?? "",
        created: created ?? "",
        createdBy: createdBy ?? "",
        deleted: deleted ?? "",
        deletedBy: deletedBy ?? "",
        title: title,
        isCorrect: isCorrect);
  }
}
