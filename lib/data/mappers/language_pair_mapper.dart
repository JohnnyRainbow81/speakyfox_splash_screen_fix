import 'package:speakyfox/data/mappers/image_mapper.dart';
import 'package:speakyfox/data/mappers/language_mapper.dart';
import 'package:speakyfox/data/dtos/language_pair_dto.dart';
import 'package:speakyfox/domain/models/language_pair.dart';

extension LanguagePairMapper on LanguagePairDto {
  LanguagePair toLanguagePair() {
    return LanguagePair(
        id: id,
        modified: modified ?? "",
        modifiedBy: modifiedBy ?? "",
        created: created ?? "",
        createdBy: createdBy ?? "",
        deleted: deleted ?? "",
        deletedBy: deletedBy ?? "",
        title: title,
        description: description,
        key: key ?? "",
        subscriptions: subscriptions ?? [],
        icon: icon?.toImage(),
        sourceLanguage: sourceLanguage?.toLanguage(),
        sourceLanguageId: sourceLanguageId,
        appStoreProductId: appStoreProductId ?? "",
        isPublished: isPublished,
        targetLanguage: targetLanguage?.toLanguage(),
        webAppProductId: webAppProductId ?? "",
        targetLanguageId: targetLanguageId);
  }
}

extension LanguagePairDtoMapper on LanguagePair {
  LanguagePairDto toLanguagePairDto() {
    return LanguagePairDto(
        id: id ?? "",
        title: title,
        description: description,
        subscriptions: subscriptions,
        icon: icon?.toImageDto(),
        sourceLanguage: sourceLanguage?.toLanguageDto(),
        sourceLanguageId: sourceLanguageId,
        isPublished: isPublished,
        targetLanguage: targetLanguage?.toLanguageDto(),
        targetLanguageId: targetLanguageId,
        webAppProductId: webAppProductId,
        appStoreProductId: appStoreProductId);
  }
}
