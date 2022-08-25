import 'package:speakyfox/data/dtos/audio_dto.dart';
import 'package:speakyfox/domain/models/audio.dart';

extension AudioMapper on AudioDto {
  Audio toAudio() {
    return Audio(
        id: id,
        modified: modified ?? "",
        modifiedBy: modifiedBy ?? "",
        created: created ?? "",
        createdBy: createdBy ?? "",
        deleted: deleted ?? "",
        deletedBy: deletedBy ?? "",
        size: size,
        contentType: contentType,
        name: name,
        type: type,
        languageType: languageType,
        audioType: audioType,
        bucketName: bucketName ?? "",
        metadata: metadata ?? []);
  }
}
