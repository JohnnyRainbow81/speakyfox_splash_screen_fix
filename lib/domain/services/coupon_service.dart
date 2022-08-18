// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/domain/models/coupon.dart';
import 'package:speakyfox/domain/repositories/coupon_repository.dart';

class CouponService {
  final CouponRepository _couponRepository;

  CouponService(
    this._couponRepository,
  );

  Future<Coupon> getCouponByKeyAndPlanIdOrNull(String key, String planId) {
    return _couponRepository.getCouponByKeyAndPlanIdOrNull(key, planId);
  }
}
