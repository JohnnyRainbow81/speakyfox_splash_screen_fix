// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/domain/models/model_base.dart';
import 'package:speakyfox/domain/models/coupon.dart';
import 'package:speakyfox/domain/models/offer_description_content.dart';

import 'plan.dart' show Plan;

class Offer extends ModelBase {
  String planId;
  String offerTitle;
  String registrationTitle;
  String descriptionTitle;
  List<OfferDescriptionContent> descriptionContents = [];
  String offerContent;
  String thankYouContent;
  List<Coupon> coupons = [];
  bool thankYouPageEnabled;
  bool registrationEnabled;
  bool loginEnabled;
  String? offerStart;
  String? offerEnd;
  int originalAmount;
  String loginTitle;
  String referer;
  bool isAllowedCoupon;
  String ref;
  Plan plan;
  String details;
  String planTitle;
  String planDescription;
  Offer({
    required String id,
    required String modified,
    required String modifiedBy,
    required String created,
    required String createdBy,
    required String deleted,
    required String deletedBy,
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
     this.offerStart,
     this.offerEnd,
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
            modified: modified,
            modifiedBy: modifiedBy,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy);
}
