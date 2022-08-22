// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/dtos/base_dto.dart';
import 'package:speakyfox/data/dtos/coupon_dto.dart';
import 'package:speakyfox/data/dtos/offer_description_content_dto.dart';
import 'package:speakyfox/data/dtos/plan_dto.dart';

part 'offer_dto.g.dart';

@JsonSerializable()
class OfferDto extends BaseDto {
  String planId;
  String offerTitle;
  String registrationTitle;
  String descriptionTitle;
  List<OfferDescriptionContentDto> descriptionContents = [];
  String offerContent;
  String thankYouContent;
  List<CouponDto> coupons = [];
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
  PlanDto plan;
  String details;
  String planTitle;
  String planDescription;

  OfferDto({
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

  factory OfferDto.fromJson(Map<String, dynamic> json) => _$OfferDtoFromJson(json);
  Map<String, dynamic> toJson() => _$OfferDtoToJson(this);
}
