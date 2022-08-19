import 'package:speakyfox/data/mappers/image_mapper.dart';
import 'package:speakyfox/data/mappers/language_pair_mapper.dart';
import 'package:speakyfox/data/responses/language_response.dart';
import 'package:speakyfox/domain/models/language.dart';

extension LanguageMapper on LanguageResponse {
  Language toLanguage() {
    return Language(
        id: id,
        modified: modified ?? "",
        modifiedBy: modifiedBy ?? "",
        created: created ?? "",
        createdBy: createdBy ?? "",
        deleted: deleted ?? "",
        deletedBy: deletedBy ??"",
        title: title,
        description: description,
        key: key,
        icon: icon.toImage(),
        buttonImage: buttonImage.toImage(),
        buttonFileId: buttonFileId,
        isPublished: isPublished,
        languagePair: languagePair.toLanguagePair());
  }
}
