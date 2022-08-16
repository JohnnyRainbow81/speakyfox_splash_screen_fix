
import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/app/constants.dart';
import 'package:speakyfox/data/dio_clients/authentication_client.dart';
import 'package:speakyfox/data/dio_factory.dart';

void main() async {
  final authDio = await DioAuth.initialize(Constants.baseUrlAuth);

  //Test on production server with real credentials! (because QA Server isn't up-to-date)
  test('authentication client', () async {
    AuthenticationClient authenticationClient = AuthenticationClient(authDio);
    final answer = await authenticationClient.accessToken("stefan_anders@gmx.net", "Kuchen1981!", "password");
    print(answer.accessToken.toString());
  });

  ;
}
