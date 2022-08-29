// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/domain/models/model_base.dart';

enum DatabaseType {
  @JsonValue("Image")
  image,
  @JsonValue("Audio")
  audio
}

class DatabaseFile extends ModelBase {
  String bucketName;
  String name;
  int size;
  String contentType;
  DatabaseType type;
  List<dynamic> metadata;
  DatabaseFile({
    required String id,
    required String modified,
    required String modifiedBy,
    required String created,
    required String createdBy,
    required String deleted,
    required String deletedBy,
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

  @override
  String toString() {
    return 'DatabaseFile(bucketName: $bucketName, name: $name, size: $size, contentType: $contentType, type: $type, metadata: $metadata)${super.toString()}';
  }
}
