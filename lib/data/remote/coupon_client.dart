import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:speakyfox/data/dtos/coupon_dto.dart';
import 'package:speakyfox/data/remote/entity_client.dart';
part 'coupon_client.g.dart';

@RestApi()
abstract class CouponClient with EntityClient<CouponDto> {
  factory CouponClient(Dio dio, {String baseUrl}) = _CouponClient;

  @GET("/coupons")
  Future<CouponDto> getCouponByKeyAndPlanIdOrNull(@Query("key") String key, @Query("planId") String planId);
}
