// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/responses/base_response.dart';
import 'package:speakyfox/data/responses/image_response.dart';
import 'package:speakyfox/data/responses/language_pair_response.dart';

part 'language_response.g.dart';

@JsonSerializable()
class LanguageResponse extends BaseResponse {
  String title;
  String description;
  String key;
  ImageResponse icon;
  ImageResponse buttonImage;
  bool isPublished;
  String buttonFileId;
  LanguagePairResponse languagePair;

  LanguageResponse({
    required String id,
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

  factory LanguageResponse.fromJson(Map<String, dynamic> json) => _$LanguageResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LanguageResponseToJson(this);
}
