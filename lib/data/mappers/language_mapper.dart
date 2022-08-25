import 'package:speakyfox/data/mappers/image_mapper.dart';
import 'package:speakyfox/data/mappers/language_pair_mapper.dart';
import 'package:speakyfox/data/dtos/language_dto.dart';
import 'package:speakyfox/domain/models/language.dart';

extension LanguageMapper on LanguageDto {
  Language toLanguage() {
    return Language(
        id: id,
        modified: modified ?? "",
        modifiedBy: modifiedBy ?? "",
        created: created ?? "",
        createdBy: createdBy ?? "",
        deleted: deleted ?? "",
        deletedBy: deletedBy ?? "",
        title: title,
        description: description,
        key: key,
        icon: icon?.toImage(),  //TODO standard Image? ask Julien
        buttonImage: buttonImage.toImage(),
        buttonFileId: buttonFileId,
        isPublished: isPublished,
        languagePair: languagePair.isNotEmpty ?  languagePair.first.toLanguagePair() : null); //TODO should be a List or single value? WebApp has a single value..
  }
}
