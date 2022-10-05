import 'package:speakyfox/data/mappers/word_mapper.dart';
import 'package:speakyfox/data/dtos/highlighted_part_dto.dart';
import 'package:speakyfox/domain/models/highlighted_part.dart';

extension HighlightedPartMapper on HighlightedPartDto {
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

extension HighLightedPartDtoMapper on HighlightedPart {
  HighlightedPartDto toHighlightedPartDto() {
    return HighlightedPartDto(
        id: id,
        modified: modified ??"",
        modifiedBy: modifiedBy ??"",
        created: created ??"",
        createdBy: createdBy ??"",
        deleted: deleted ??"",
        deletedBy: deletedBy ??"",
        metadata: metadata,
        type: type,
        words: words.map((e) => e.toWordDto()).toList());
  }
}
