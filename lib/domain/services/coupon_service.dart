// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/data/remote/coupon_client.dart';
import 'package:speakyfox/data/repositories_impls/coupon_repository_impl.dart';
import 'package:speakyfox/domain/models/coupon.dart';
import 'package:speakyfox/domain/repositories/base_repository.dart';
import 'package:speakyfox/domain/repositories/coupon_repository.dart';
import 'package:speakyfox/domain/services/base_service.dart';

class CouponService extends BaseService<Coupon> {
  late final CouponRepository<Coupon> _couponRepository;

  CouponService(
    CouponRepositoryImpl repositoryImpl,
  ) : super(repositoryImpl) {
    _couponRepository = repositoryImpl;
  }

  Future<Coupon> getCouponByKeyAndPlanIdOrNull(String key, String planId) {
    return _couponRepository.getCouponByKeyAndPlanIdOrNull(key, planId);
  }
}
