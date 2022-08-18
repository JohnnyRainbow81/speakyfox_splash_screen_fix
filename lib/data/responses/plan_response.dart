// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/responses/base_response.dart';
import 'package:speakyfox/data/responses/product_response.dart';

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
  }): super(id: id);


  factory PlanResponse extends BaseResponse.fromJson(Map<String, dynamic> json) => _$PlanResponse extends BaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PlanResponse extends BaseResponseToJson(this);
}
