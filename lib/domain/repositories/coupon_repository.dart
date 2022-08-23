import 'package:speakyfox/domain/models/coupon.dart';
import 'package:speakyfox/domain/repositories/base_repository.dart';

abstract class CouponRepository<T> extends BaseRepository<T>{
  Future<T> getCouponByKeyAndPlanIdOrNull(String key, String planId);
}