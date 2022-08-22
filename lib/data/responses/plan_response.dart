// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/responses/base_response.dart';
import 'package:speakyfox/data/responses/product_response.dart';

import '../../domain/models/plan.dart';

part 'plan_response.g.dart';

@JsonSerializable()
class PlanResponse extends BaseResponse {
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
  ProductResponse product;

  PlanResponse({
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

  }) : super(id: id,created: created,createdBy: createdBy,deleted: deleted,deletedBy: deletedBy,modified: modified,modifiedBy: modifiedBy);

  factory PlanResponse.fromJson(Map<String, dynamic> json) => _$PlanResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PlanResponseToJson(this);
}
