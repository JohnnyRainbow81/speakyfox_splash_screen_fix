import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/data/dio_factory.dart';
import 'package:speakyfox/data/mappers/ticket_mapper.dart';
import 'package:speakyfox/data/mappers/user_mapper.dart';
import 'package:speakyfox/data/remote/authentication_client.dart';
import 'package:speakyfox/data/requests/authentication_body.dart';
import 'package:speakyfox/data/requests/refresh_token_body.dart';
import 'package:speakyfox/domain/models/ticket.dart';
import 'package:speakyfox/domain/models/user.dart';
import 'package:speakyfox/domain/services/authentication_service.dart';

void main() async {
  late User user;
  //Test on production server with real credentials! (because QA Server isn't up-to-date)
  final authDio = await DioAuth.initialize("https://speakyfox-api-production.herokuapp.com/api/v1/");
  AuthenticationClient authenticationClient = AuthenticationClient(authDio);

  test('accessToken()', () async {
    final response = await authenticationClient.accessToken(
        AuthenticationRequestBody(userName: "stefan_anders@gmx.net", password: "Kuchen1981!", grantType: "password"));
    debugPrint("accessToken: ${response.accessToken}");
    debugPrint("refreshToken: ${response.refreshToken}");
  });

  test('fetchUser()', (() async {
    final response = await authenticationClient.accessToken(
        AuthenticationRequestBody(userName: "stefan_anders@gmx.net", password: "Kuchen1981!", grantType: "password"));
    Ticket ticket = response.toTicket();
    final userDto = await authenticationClient.fetchUser("Bearer ${ticket.accessToken}");
    user = userDto.data.toUser();
  
    debugPrint(user.firstName);
  }));

  test(
    "refreshToken()",
    () async {
      final response = await authenticationClient.refreshToken(RefreshTokenBody(
          grantType: GrantType.refresh_token.name,
          refreshToken:
              "CfDJ8DQVF9EChGVAmh4IBXiwyLjkmONXXEXQiEv08OVkd2IAC74i3f_RC83-xg3glhEgflBkF3uToqeJNkjj71s2NVxlEME-D3juRT_GHhOOCnlDwK2iGQZ_CKJ0M8bNV1JwbXsQagntBlgHRnfKumb9qYjXHZJIH4XEVqDPly1amHsvYH7BC_TIPgEQOywDqpafyKXBxzZmcnlQFDqXnWRlMP5z9vMfTswvQHSIkLNzlfT6wCo9JGNc_NnIJA9AYcGXBKbSXxggVvVUiwcoWsdQENUFpGPutf6lh3fWEFIUOxtFdMyXHfW5BKqtEueVz_Ht-8Ciohe3D2FC8I9clQcTAxtnWTseRFUp6-y7bPiEa7v1CiAUvyBEV_Xhqy3WjYFFH3puRNJF4t0nxeOlULbDbIVGLGqPchDVxPQBtD12cDlf0el5NLOoYjGbCAj60pmAte10rfIm5wBSMVSXr947TD96wBOJg3MXwLoX4JsVHaE-wjiNskdrR5-Nu8AIxBI01w1RNqMjdU21_bfi904LIaWxgQWGV0oXZCHzb9pGXxHQz3lMqjf6uDm9ZFNoH9ZXg1-vt1lwKfjamxQCBfzhdL_Zg4gVdnk7Sc2ZmoNTkZikey-0h8o_LNefP7ijRW_IS-7x9pkH5dsaP66tat2mA3KkgpZGZbDr8GHIccZll2I2njPB2Vkiuw5O07uRiR2dQh4U5CvBWUM51CTr8E4SGRqjwIf0R3g0MlpZStG0UubyJ0LtjTPJvkOqDesqJ7pxue8FdRAHF-hn3MqxOZeCCGO14uTEpJdqmk8Uy8zbTvaqyoWmruGf9P-Q0wu6udasGU19E631YNYXw8nIPQvwPWthFbHoZuMnYFrpVHtbSmYTFzbaJeFwB0xSVY97upsIErYZ-SEXYh0MLRGkHxUyV_vMgMem64sLigK1sbkbPcMsoaAcsmCAqOY0zJil0TXC4g"));
      Ticket ticket = response.toTicket();
      debugPrint(ticket.toString());
    },
  );
  test('reset password', (() async {}));
}
