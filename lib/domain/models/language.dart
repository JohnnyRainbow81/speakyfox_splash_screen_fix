import 'package:speakyfox/domain/models/base_model.dart';
import 'package:speakyfox/domain/models/image.dart';
import 'package:speakyfox/domain/models/language_pair.dart';


enum LanguageType { sourceLanguage, targetLanguage }


class Language extends BaseModel {
  String title;
  String description;
  String key;
  Image icon;
  Image buttonImage;
  bool isPublished;
  String buttonFileId;
  LanguagePair languagePair;

  Language(
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
      required this.icon,
      required this.buttonImage,
      required this.buttonFileId,
      required this.isPublished,
      required this.languagePair})
      : super(
            id: id,
            modified: modified,
            modifiedBy: modifiedBy,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy);
}
