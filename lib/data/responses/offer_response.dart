// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/responses/base_response.dart';
import 'package:speakyfox/data/responses/coupon_response.dart';
import 'package:speakyfox/data/responses/offer_description_content_response.dart';
import 'package:speakyfox/data/responses/plan_response.dart';

part 'offer_response.g.dart';

@JsonSerializable()
class OfferResponse extends BaseResponse {
  String planId;
  String offerTitle;
  String registrationTitle;
  String descriptionTitle;
  List<OfferDescriptionContentResponse> descriptionContents = [];
  String offerContent;
  String thankYouContent;
  List<CouponResponse> coupons = [];
  bool thankYouPageEnabled;
  bool registrationEnabled;
  bool loginEnabled;
  String offerStart;
  String offerEnd;
  int originalAmount;
  String loginTitle;
  String referer;
  bool isAllowedCoupon;
  String ref;
  PlanResponse plan;
  String details;
  String planTitle;
  String planDescription;

  OfferResponse({
    required String id,
    String? modified,
    String? modifiedBy,
    String? created,
    String? createdBy,
    String? deleted,
    String? deletedBy,
    required this.planId,
    required this.offerTitle,
    required this.registrationTitle,
    required this.descriptionTitle,
    required this.descriptionContents,
    required this.offerContent,
    required this.thankYouContent,
    required this.coupons,
    required this.thankYouPageEnabled,
    required this.registrationEnabled,
    required this.loginEnabled,
    required this.offerStart,
    required this.offerEnd,
    required this.originalAmount,
    required this.loginTitle,
    required this.referer,
    required this.isAllowedCoupon,
    required this.ref,
    required this.plan,
    required this.details,
    required this.planTitle,
    required this.planDescription,
  }) : super(
            id: id,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            modified: modified,
            modifiedBy: modifiedBy);

  factory OfferResponse.fromJson(Map<String, dynamic> json) => _$OfferResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OfferResponseToJson(this);
}
