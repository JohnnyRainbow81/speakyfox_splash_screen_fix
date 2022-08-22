import 'package:speakyfox/data/responses/audio_response.dart';
import 'package:speakyfox/domain/models/audio.dart';

extension AudioMapper on AudioResponse {
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
        bucketName: bucketName,
        metadata: metadata ?? []);
  }
}
