import 'package:dio/dio.dart' hide Response;
import 'package:retrofit/retrofit.dart';
import 'package:speakyfox/data/dtos/coupon_dto.dart';
import 'package:speakyfox/data/dtos/response.dart';
import 'package:speakyfox/data/remote/base_client.dart';
import 'package:speakyfox/domain/repositories/coupon_repository.dart';
part 'coupon_client.g.dart';

@RestApi()
abstract class CouponClient with BaseClient<CouponDto>{
  factory CouponClient(Dio dio, {String baseUrl}) = _CouponClient;

  @GET("/coupons")
  Future<Response<CouponDto>> getCouponByKeyAndPlanIdOrNull(@Query("key") String key, @Query("planId") String planId);
}
