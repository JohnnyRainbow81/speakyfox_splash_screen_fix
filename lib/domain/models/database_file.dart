// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:speakyfox/domain/models/base_model.dart';

enum DatabaseType {
  @JsonValue("image")
  image,
  @JsonValue("audio")
  audio
}

class DatabaseFile extends BaseModel {
  String bucketName;
  String name;
  int size;
  String contentType;
  DatabaseType type;
  List<dynamic> metadata;
  DatabaseFile({
    required String id,
    String? modified,
    String? modifiedBy,
    String? created,
    String? createdBy,
    String? deleted,
    String? deletedBy,
    required this.bucketName,
    required this.name,
    required this.size,
    required this.contentType,
    required this.type,
    required this.metadata,
  }) : super(
            id: id,
            modified: modified,
            modifiedBy: modifiedBy,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy);
}
