import 'package:speakyfox/data/dtos/answer_dto.dart';
import 'package:speakyfox/domain/models/answer.dart';

extension AnswerMapper on AnswerDto {
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
