import 'package:speakyfox/data/mappers/image_mapper.dart';
import 'package:speakyfox/data/mappers/language_mapper.dart';
import 'package:speakyfox/data/responses/language_pair_response.dart';
import 'package:speakyfox/domain/models/language_pair.dart';

extension LanguagePairMapper on LanguagePairResponse {
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
        key: key,
        subscriptions: subscriptions,
        icon: icon.toImage(),
        sourceLanguage: sourceLanguage.toLanguage(),
        sourceLanguageId: sourceLanguageId,
        appStoreProductId: appStoreProductId,
        isPublished: isPublished,
        targetLanguage: targetLanguage.toLanguage(),
        webAppProductId: webAppProductId,
        targetLanguageId: targetLanguageId);
  }
}
