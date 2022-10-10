import 'package:json_annotation/json_annotation.dart';
import 'package:speakyfox/domain/models/model_base.dart';

enum FileType {
  @JsonValue("Image")
  image,
  @JsonValue("Audio")
  audio,
  @JsonValue("File")
  file
}

class File extends ModelBase {
  int size;
  String contentType;
  String name;
  FileType type;

  File({
    required String id,
    required String modified,
    required String modifiedBy,
    required String created,
    required String createdBy,
    required String deleted,
    required String deletedBy,
    required this.size,
    required this.contentType,
    required this.name,
    required this.type,
  }) : super(
            id: id,
            modified: modified,
            modifiedBy: modifiedBy,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy);
}
