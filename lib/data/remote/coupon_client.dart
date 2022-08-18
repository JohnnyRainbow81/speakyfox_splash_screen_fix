import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:speakyfox/data/responses/coupon_response.dart';
part 'coupon_client.g.dart';

@RestApi()
abstract class CouponClient {
  factory CouponClient(Dio dio, {String baseUrl}) = _CouponClient;

  @GET("/coupons")
  Future<CouponResponse> getCouponByKeyAndPlanIdOrNull(@Query("key") String key, @Query("planId") String planId);
}
