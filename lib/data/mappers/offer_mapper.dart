import 'package:speakyfox/data/mappers/coupon_mapper.dart';
import 'package:speakyfox/data/mappers/offer_description_content_mapper.dart';
import 'package:speakyfox/data/mappers/plan_mapper.dart';
import 'package:speakyfox/data/dtos/offer_dto.dart';
import 'package:speakyfox/domain/models/offer.dart';

extension OfferMapper on OfferDto {
  Offer toOffer() {
    return Offer(
        id: id,
        modified: modified ?? "",
        modifiedBy: modifiedBy ?? "",
        created: created ?? "",
        createdBy: createdBy ?? "",
        deleted: deleted ?? "",
        deletedBy: deletedBy ?? "",
        planId: planId,
        offerTitle: offerTitle,
        registrationTitle: registrationTitle,
        descriptionTitle: descriptionTitle,
        descriptionContents:
            descriptionContents.map((descriptionContent) => descriptionContent.toOfferDescriptionContent()).toList(),
        offerContent: offerContent,
        thankYouContent: thankYouContent,
        coupons: coupons.map((coupon) => coupon.toCoupon()).toList(),
        thankYouPageEnabled: thankYouPageEnabled,
        registrationEnabled: registrationEnabled,
        loginEnabled: loginEnabled,
        offerStart: offerStart,
        offerEnd: offerEnd,
        originalAmount: originalAmount,
        loginTitle: loginTitle,
        referer: referer,
        isAllowedCoupon: isAllowedCoupon,
        ref: ref,
        plan: plan.toPlan(),
        details: details,
        planTitle: planTitle,
        planDescription: planDescription);
  }
}
