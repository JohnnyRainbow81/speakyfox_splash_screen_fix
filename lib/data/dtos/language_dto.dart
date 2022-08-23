// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/dtos/base_dto.dart';
import 'package:speakyfox/data/dtos/image_dto.dart';
import 'package:speakyfox/data/dtos/language_pair_dto.dart';

part 'language_dto.g.dart';

@JsonSerializable()
class LanguageDto extends BaseDto {
  String title;
  String description;
  String key;
  ImageDto icon;
  ImageDto buttonImage;
  bool isPublished;
  String buttonFileId;
  LanguagePairDto languagePair;

  LanguageDto({
    required String id,
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
    required this.isPublished,
    required this.buttonFileId,
    required this.languagePair,
  }) : super(
            id: id,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            modified: modified,
            modifiedBy: modifiedBy);

  factory LanguageDto.fromJson(Map<String, dynamic> json) => _$LanguageDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LanguageDtoToJson(this);


  @override
  String toString() {
    return 'LanguageDto(title: $title, description: $description, key: $key, icon: $icon, buttonImage: $buttonImage, isPublished: $isPublished, buttonFileId: $buttonFileId, languagePair: $languagePair)';
  }
}