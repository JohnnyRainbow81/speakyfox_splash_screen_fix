import 'package:speakyfox/data/mappers/word_mapper.dart';
import 'package:speakyfox/data/responses/highlighted_part_response.dart';
import 'package:speakyfox/domain/models/highlighted_part.dart';

extension HighlightedPartMapper on HighlightedPartResponse {
  HighlightedPart toHighlightedPart() {
    return HighlightedPart(
        id: id,
        modified: modified ?? "",
        modifiedBy: modifiedBy ?? "",
        created: created ?? "",
        createdBy: createdBy ?? "",
        deleted: deleted ?? "",
        deletedBy: deletedBy ?? "",
        metadata: metadata,
        type: type,
        words: words.map((word) => word.toWord()).toList());
  }
}
