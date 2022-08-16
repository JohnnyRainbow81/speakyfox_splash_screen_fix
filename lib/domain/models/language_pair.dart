import 'package:speakyfox/domain/models/base_model.dart';

import "File.dart" show Image;
import 'image.dart';
import 'language.dart' show Language;

class LanguagePair extends BaseModel {
  String title;
  String description;
  String key;
  List<dynamic> subscriptions = [];
  Image icon;
  Language sourceLanguage;
  String sourceLanguageId;
  bool isPublished;
  Language targetLanguage;
  String targetLanguageId;
  String webAppProductId;
  String appStoreProductId;

  LanguagePair(
      {required String id,
      required String modified,
      required String modifiedBy,
      required String created,
      required String createdBy,
      required String deleted,
      required String deletedBy,
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
}
