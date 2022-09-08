
abstract class CouponRepository<T> {
  Future<T> getCouponByKeyAndPlanIdOrNull(String key, String planId);
}
