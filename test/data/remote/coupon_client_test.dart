import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/app/constants.dart';
import 'package:speakyfox/data/dio_factory.dart';
import 'package:speakyfox/data/remote/coupon_client.dart';

import '../../test_get_access_token.dart';

void main() async {
  String token = await getAuthTokenForTesting();

  final dioV1 =  DioFactory.initialize(baseUrl:Constants.baseUrlAuthQA);

  final CouponClient couponClient =
      CouponClient(dioV1, baseUrl: "https://speakyfox-api-production.herokuapp.com/api/v1/coupons/");
      
  //TODO Enter valid key and planId
  test('getCouponByKeyAndPlanIdOrNull()', () async {
    try {
      final response = await couponClient.getCouponByKeyAndPlanIdOrNull("not valid", "also not valid");
    } catch (e) {
      print(e);
    }
  });
}
