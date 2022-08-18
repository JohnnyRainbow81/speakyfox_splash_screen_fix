import 'package:speakyfox/data/responses/coupon_response.dart';
import 'package:speakyfox/domain/models/coupon.dart';

extension CouponMapper on CouponResponse {
  Coupon toCoupon() {
    return Coupon(
        id: id ?? "",
        modified: modified ?? "",
        modifiedBy: modifiedBy ?? "",
        created: created ?? "",
        createdBy: createdBy ?? "",
        deleted: deleted ?? "",
        deletedBy: deletedBy ?? "",
        key: key,
        name: name ?? "",
        amountOff: amountOff ?? 0,
        percentOff: percentOff ?? 0,
        planId: planId,
        duration: duration,
        durationInMonths: durationInMonths ?? 0);
  }
}
