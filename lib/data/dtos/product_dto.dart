// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/dtos/base_dto.dart';
import 'package:speakyfox/data/dtos/plan_dto.dart';
import 'package:speakyfox/domain/models/plan.dart';

part 'product_dto.g.dart';

@JsonSerializable()
class ProductDto extends BaseDto {
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
  List<PlanDto> plans;

  ProductDto(
      {required String id,
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
      required this.plans})
      : super(
            id: id,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            modified: modified,
            modifiedBy: modifiedBy);

  factory ProductDto.fromJson(Map<String, dynamic> json) => _$ProductDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);
}
