// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/responses/base_response.dart';

part 'offer_description_content_response.g.dart';

@JsonSerializable()
class OfferDescriptionContentResponse extends BaseResponse {
  String content;
  List<String> bulletPoints = [];

  OfferDescriptionContentResponse({
    required String id,
    required this.content,
    required this.bulletPoints,
  }) : super(id: id);

  factory OfferDescriptionContentResponse.fromJson(Map<String, dynamic> json) =>
      _$OfferDescriptionContentResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OfferDescriptionContentResponseToJson(this);
}
