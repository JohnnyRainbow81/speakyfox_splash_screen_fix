import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/app/constants.dart';
import 'package:speakyfox/data/dio_factory.dart';
import 'package:speakyfox/data/remote/coupon_client.dart';

import '../../http_client_test_setup.dart';

void main() async {
  final dio = await getAuthenticatedHTTPClientForTesting();

  final CouponClient couponClient = CouponClient(dio, baseUrl: "${TestConstants.baseUrlQA}coupons");

  //TODO Get a valid key and planId

  final response = await couponClient.getCouponByKeyAndPlanIdOrNull("not valid", "also not valid");
}
