// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/dtos/base_dto.dart';
import 'package:speakyfox/data/dtos/product_dto.dart';


part 'plan_dto.g.dart';

@JsonSerializable()
class PlanDto extends BaseDto {
  String title;
  String description;
  String displayTitle;
  bool isPublished;
  String interval;
  int intervalCount;
  String currency;
  int unitAmount;
  int trialPeriodDays;
  int taxPercent;
  String productId;
  ProductDto product;

  PlanDto({
    required String id,
    String? modified,
    String? modifiedBy,
    String? created,
    String? createdBy,
    String? deleted,
    String? deletedBy,
    required this.title,
    required this.description,
    required this.displayTitle,
    required this.isPublished,
    required this.interval,
    required this.intervalCount,
    required this.currency,
    required this.unitAmount,
    required this.trialPeriodDays,
    required this.taxPercent,
    required this.productId,
    required this.product,
  }) : super(
            id: id,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            modified: modified,
            modifiedBy: modifiedBy);

  factory PlanDto.fromJson(Map<String, dynamic> json) => _$PlanDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PlanDtoToJson(this);
}
