// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/responses/base_response.dart';
import 'package:speakyfox/data/responses/plan_response.dart';
import 'package:speakyfox/domain/models/plan.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse extends BaseResponse {
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
  List<PlanResponse> plans;

  ProductResponse(
      {required String id,
      required String modified,
      required String modifiedBy,
      required String created,
      required String createdBy,
      required String deleted,
      required String deletedBy,
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

  factory ProductResponse.fromJson(Map<String, dynamic> json) => _$ProductResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}
