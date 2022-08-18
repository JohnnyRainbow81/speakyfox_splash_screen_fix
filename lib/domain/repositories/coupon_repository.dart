import 'package:speakyfox/domain/models/coupon.dart';

abstract class CouponRepository {
  Future<Coupon> getCouponByKeyAndPlanIdOrNull(String key, String planId);
}
