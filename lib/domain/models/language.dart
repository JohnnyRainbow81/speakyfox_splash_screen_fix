// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/domain/models/model_base.dart';
import 'package:speakyfox/domain/models/image.dart';
import 'package:speakyfox/domain/models/language_pair.dart';

enum LanguageType {
  @JsonValue("sourceLanguage")
  sourceLanguage,
  @JsonValue("targetLanguage")
  targetLanguage
}

class Language extends ModelBase {
  String title;
  String description;
  String key;
  Image? icon;
  Image buttonImage;
  bool isPublished;
  String buttonFileId;
  LanguagePair? languagePair;

  Language(
      {required String id,
      String? modified,
      String? modifiedBy,
      String? created,
      String? createdBy,
      String? deleted,
      String? deletedBy,
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

  @override
  String toString() {
    return 'Language(title: $title, description: $description, key: $key, icon: $icon, buttonImage: $buttonImage, isPublished: $isPublished, buttonFileId: $buttonFileId)\n${super.toString()}';
  }
}
