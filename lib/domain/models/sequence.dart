import 'package:json_annotation/json_annotation.dart';
import 'package:speakyfox/domain/models/base_model.dart';
import 'package:speakyfox/domain/models/lecture.dart';

import 'game.dart';

enum ProgressType {
  @JsonValue("single")
  single,
  @JsonValue("whole")
  whole
}

class Sequence extends BaseModel {
  String title;
  String description;
  ProgressType progressType;
  List<Game> games;
  Lecture parent;

  Sequence({
    required String id,
    required String modified,
    required String modifiedBy,
    required String created,
    required String createdBy,
    required String deleted,
    required String deletedBy,
    required this.title,
    required this.description,
    required this.progressType,
    required this.games,
    required this.parent,
  }) : super(
            id: id,
            modified: modified,
            modifiedBy: modifiedBy,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy);
}
