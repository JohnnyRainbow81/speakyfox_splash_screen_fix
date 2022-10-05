import 'package:speakyfox/data/mappers/game_mapper.dart';
import 'package:speakyfox/data/mappers/lecture_mapper.dart';
import 'package:speakyfox/data/dtos/sequence_dto.dart';
import 'package:speakyfox/domain/models/sequence.dart';

extension SequenceMapper on SequenceDto {
  Sequence toSequence() {
    return Sequence(
        id: id,
        modified: modified ?? "",
        modifiedBy: modifiedBy ?? "",
        created: created ?? "",
        createdBy: createdBy ?? "",
        deleted: deleted ?? "",
        deletedBy: deletedBy ?? "",
        title: title,
        description: description,
        progressType: progressType,
        games: games != null ? games!.map((game) => game.toGame()).toList() : [],
        parent: parent?.toLecture());
  }
}

extension SequenceDtoMapper on Sequence {
  SequenceDto toSequenceDto() {
    return SequenceDto(
        id: id,
        title: title,
        description: description,
        progressType: progressType,
        games: games.map((e) => e.toGameDto()).toList(),
        parent: parent?.toLectureDto());
  }
}
