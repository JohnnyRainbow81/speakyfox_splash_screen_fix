// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:speakyfox/data/dtos/base_dto.dart';
import 'package:speakyfox/data/dtos/image_dto.dart';
import 'package:speakyfox/data/dtos/language_dto.dart';

part 'language_pair_dto.g.dart';

@JsonSerializable()
class LanguagePairDto extends BaseDto {
  String title;
  String description;
  String? key;
  List<dynamic>? subscriptions = [];
  ImageDto? icon;
  LanguageDto? sourceLanguage;
  String? sourceLanguageId;
  bool? isPublished;
  LanguageDto? targetLanguage;
  String? targetLanguageId;
  String? webAppProductId;
  String? appStoreProductId;

  LanguagePairDto({
    required String id,
    String? modified,
    String? modifiedBy,
    String? created,
    String? createdBy,
    String? deleted,
    String? deletedBy,
    required this.title,
    required this.description,
    this.key,
    required this.subscriptions,
    required this.icon,
    required this.sourceLanguage,
    required this.sourceLanguageId,
    required this.isPublished,
    required this.targetLanguage,
    required this.targetLanguageId,
    required this.webAppProductId,
    required this.appStoreProductId,
  }) : super(
            id: id,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            modified: modified,
            modifiedBy: modifiedBy);

  factory LanguagePairDto.fromJson(Map<String, dynamic> json) => _$LanguagePairDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LanguagePairDtoToJson(this);

}
