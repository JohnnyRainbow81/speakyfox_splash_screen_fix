import 'package:speakyfox/data/dtos/coupon_dto.dart';
import 'package:speakyfox/domain/models/coupon.dart';

extension CouponMapper on CouponDto {
  Coupon toCoupon() {
    return Coupon(
        id: id,
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

extension CouponDtoMapper on Coupon {
  CouponDto toDto() {
    return CouponDto(
        id: id ?? "",
        key: key,
        name: name,
        amountOff: amountOff,
        percentOff: percentOff,
        planId: planId,
        duration: duration,
        durationInMonths: durationInMonths);
  }
}
