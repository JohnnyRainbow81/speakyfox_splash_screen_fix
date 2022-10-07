import 'package:json_annotation/json_annotation.dart';
import 'package:speakyfox/domain/models/database_file.dart';

import 'language.dart';

enum AudioType {
  @JsonValue("Word")
  word,
  @JsonValue("Sentence")
  sentence
}

enum AudioCodingKeys {
  @JsonValue("AudioType")
  audioType,
  @JsonValue("LanguageType")
  languageType
}

class Audio extends DatabaseFile {
  AudioType audioType;
  LanguageType languageType;
  Audio({
    required String id,
    required String modified,
    required String modifiedBy,
    required String created,
    required String createdBy,
    required String deleted,
    required String deletedBy,
    required String bucketName,
    required List<dynamic> metadata,
    required int size,
    required String contentType,
    required String name,
    required DatabaseType type,
    required this.languageType,
    required this.audioType,
  }) : super(
            id: id,
            modified: modified,
            modifiedBy: modifiedBy,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            contentType: contentType,
            bucketName:  bucketName,
            metadata: metadata,
            name: name,
            size: size,
            type: type);
}
