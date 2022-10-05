import 'package:json_annotation/json_annotation.dart';
import 'package:speakyfox/domain/models/model_base.dart';
import 'package:speakyfox/domain/models/lecture.dart';

import 'game.dart';

enum ProgressType {
  @JsonValue("Single")
  single,
  @JsonValue("Whole")
  whole
}

class Sequence extends ModelBase {
  String title;
  String description;
  ProgressType progressType;
  List<Game> games;
  Lecture? parent;

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
    this.parent,
  }) : super(
            id: id,
            modified: modified,
            modifiedBy: modifiedBy,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy);
}
