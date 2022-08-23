// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/data/remote/coupon_client.dart';
import 'package:speakyfox/domain/models/coupon.dart';
import 'package:speakyfox/domain/repositories/coupon_repository.dart';

class CouponService {
  final CouponRepository<Coupon> _couponRepository;

  CouponService(
    this._couponRepository,
  );

  Future<Coupon> getCouponByKeyAndPlanIdOrNull(String key, String planId) {
    return _couponRepository.getCouponByKeyAndPlanIdOrNull(key, planId);
  }

  Future<List<Coupon>> getAll(String param) async {
    return _couponRepository.getAll(param);
  }

  Future<Coupon> getById(String id) async {
    return _couponRepository.getById(id);
  }

  Future<Coupon> patchById(String id, Coupon entity) async {
    return _couponRepository.patchById(id, entity);
  }

  Future<Coupon> post(Coupon entity) async {
    // TODO: implement post
    throw UnimplementedError();
  }

  Future<bool> removeById(String id) async {
    // TODO: implement removeById
    throw UnimplementedError();
  }
}
