// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:speakyfox/data/responses/base_response.dart';
import 'package:speakyfox/data/responses/image_response.dart';
import 'package:speakyfox/data/responses/language_response.dart';

part 'language_pair_response.g.dart';

@JsonSerializable()
class LanguagePairResponse extends BaseResponse {
  String title;
  String description;
  String key;
  List<dynamic> subscriptions = [];
  ImageResponse icon;
  LanguageResponse sourceLanguage;
  String sourceLanguageId;
  bool isPublished;
  LanguageResponse targetLanguage;
  String targetLanguageId;
  String webAppProductId;
  String appStoreProductId;
  
  LanguagePairResponse({
    required String id,
    required this.title,
    required this.description,
    required this.key,
    required this.subscriptions,
    required this.icon,
    required this.sourceLanguage,
    required this.sourceLanguageId,
    required this.isPublished,
    required this.targetLanguage,
    required this.targetLanguageId,
    required this.webAppProductId,
    required this.appStoreProductId,
  }): super(id: id);

  factory LanguagePairResponse.fromJson(Map<String, dynamic> json) => _$LanguagePairResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LanguagePairResponseToJson(this);
}
