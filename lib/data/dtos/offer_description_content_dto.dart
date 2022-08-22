// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/dtos/base_dto.dart';

part 'offer_description_content_dto.g.dart';

@JsonSerializable()
class OfferDescriptionContentDto extends BaseDto {
  String content;
  List<String> bulletPoints = [];

  OfferDescriptionContentDto({
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

  factory OfferDescriptionContentDto.fromJson(Map<String, dynamic> json) => _$OfferDescriptionContentDtoFromJson(json);
  Map<String, dynamic> toJson() => _$OfferDescriptionContentDtoToJson(this);
}
