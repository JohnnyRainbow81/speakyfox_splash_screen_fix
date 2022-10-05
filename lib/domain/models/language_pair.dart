// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/domain/models/model_base.dart';

import 'image.dart';
import 'language.dart' show Language;

class LanguagePair extends ModelBase {
  String title;
  String description;
  String key;
  List<dynamic> subscriptions = [];
  Image? icon;
  Language? sourceLanguage;
  String? sourceLanguageId;
  bool? isPublished;
  Language? targetLanguage;
  String? targetLanguageId;
  String webAppProductId;
  String appStoreProductId;

  LanguagePair(
      { required String id,
      String? modified,
      String? modifiedBy,
      String? created,
      String? createdBy,
      String? deleted,
      String? deletedBy,
      required this.title,
      required this.description,
      required this.key,
      required this.subscriptions,
      required this.icon,
      required this.sourceLanguage,
      required this.sourceLanguageId,
      required this.appStoreProductId,
      required this.isPublished,
      required this.targetLanguage,
      required this.webAppProductId,
      required this.targetLanguageId})
      : super(
            id: id,
            modified: modified,
            modifiedBy: modifiedBy,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy);

  @override
  String toString() {
    return 'LanguagePair(title: $title, description: $description, key: $key, subscriptions: $subscriptions, icon: $icon, sourceLanguage: $sourceLanguage, sourceLanguageId: $sourceLanguageId, isPublished: $isPublished, targetLanguage: $targetLanguage, targetLanguageId: $targetLanguageId, webAppProductId: $webAppProductId, appStoreProductId: $appStoreProductId)';
  }
}
