// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/app/connectivity_service.dart';
import 'package:speakyfox/app/error_handling/error_handler.dart';
import 'package:speakyfox/app/error_handling/exceptions_ui.dart';
import 'package:speakyfox/data/mappers/coupon_mapper.dart';
import 'package:speakyfox/data/remote/coupon_client.dart';
import 'package:speakyfox/domain/models/coupon.dart';
import 'package:speakyfox/domain/repositories/coupon_repository.dart';

class CouponRepositoryImpl implements CouponRepository<Coupon> {
  final ConnectivityService _connectivityService;
  final CouponClient _couponClient;

  CouponRepositoryImpl(
    this._connectivityService,
    this._couponClient,
  );

  @override
  Future<Coupon> getCouponByKeyAndPlanIdOrNull(String key, String planId) async {
    //Try to load from local source

    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _couponClient.getCouponByKeyAndPlanIdOrNull(key, planId);
        return response.data.toCoupon();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "CouponRepositoryImpl.getCouponByKeyAndPlanIdOrNull");
  }

  @override
  Future<List<Coupon>> getAll(String param) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _couponClient.getAll(param);
        return response.data.map((couponDTO) => couponDTO.toCoupon()).toList();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "CouponRepositoryImpl.getAll");
  }

  @override
  Future<Coupon> getById(String id) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _couponClient.getById(id);
        return response.data.toCoupon();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "CouponRepositoryImpl.getAll");
  }

  @override
  Future<Coupon> patchById(String id, entity) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _couponClient.patchById(id, entity.toDto());
        return response.data.toCoupon();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "CouponRepositoryImpl.getAll");
  }

  @override
  Future<Coupon> post(entity) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<bool> removeById(String id) {
    // TODO: implement removeById
    throw UnimplementedError();
  }
}
