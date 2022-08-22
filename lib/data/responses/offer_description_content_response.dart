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
    String? modified,
    String? modifiedBy,
    String? created,
    String? createdBy,
    String? deleted,
    String? deletedBy,
    required this.content,
    required this.bulletPoints,
  }) : super(
            id: id,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            modified: modified,
            modifiedBy: modifiedBy);

  factory OfferDescriptionContentResponse.fromJson(Map<String, dynamic> json) =>
      _$OfferDescriptionContentResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OfferDescriptionContentResponseToJson(this);
}
