// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/app/connectivity_service.dart';
import 'package:speakyfox/app/error_handling/error_handler.dart';
import 'package:speakyfox/app/error_handling/exceptions_ui.dart';
import 'package:speakyfox/data/mappers/coupon_mapper.dart';
import 'package:speakyfox/data/remote/coupon_client.dart';
import 'package:speakyfox/domain/models/coupon.dart';
import 'package:speakyfox/domain/repositories/coupon_repository.dart';

class CouponRepositoryImpl implements CouponRepository {
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
          return response.toCoupon();
        } catch (error) {
          ErrorHandler.handleError(error);
        }
      } else {
        throw NoInternetConnectionUIException();
      }
    
    throw LoginNotSuccessfulException();
  }

}
