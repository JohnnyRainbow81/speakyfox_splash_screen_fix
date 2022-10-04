import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/app/constants.dart';
import 'package:speakyfox/data/dio_factory.dart';
import 'package:speakyfox/data/remote/coupon_client.dart';

import '../../http_client_test_setup.dart';

void main() async {
  final dio = await getAuthenticatedHTTPClientForTesting();

  final CouponClient couponClient =
      CouponClient(dio, baseUrl: "https://speakyfox-api-production.herokuapp.com/api/v1/coupons/");

  //TODO Enter valid key and planId
  test('getCouponByKeyAndPlanIdOrNull()', () async {
    try {
      final response = await couponClient.getCouponByKeyAndPlanIdOrNull("not valid", "also not valid");
    } catch (e) {
      print(e);
    }
  });
}
