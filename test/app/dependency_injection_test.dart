import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/app/dependency_injection.dart';
import 'package:speakyfox/domain/services/authentication_service.dart';
import 'package:speakyfox/domain/services/coupon_service.dart';

void main() async {
  await initializeServiceLocator();
  //TEMPORARY! Only DI-stuff should be tested here!

  AuthenticationService _authenticationService = locator<AuthenticationService>();
  bool loggedIn = await _authenticationService.login("stefan_anders@gmx.net", "Kuchen1981!");
  CouponService _couponService = locator<CouponService>();
  if(loggedIn) {
    //_couponService.
  }
  print("loggedIn : $loggedIn");

  test('dependency injection ...', () async {});
}
