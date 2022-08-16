import 'package:speakyfox/domain/models/file.dart';

import 'language.dart';

enum AudioType { word, sentence }
enum AudioCodingKeys { audioType, languageType }

class Audio extends File {
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
    required int size,
    required String contentType,
    required String name,
    required FileType type,
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
            name: name,
            size: size,
            type: type);
}