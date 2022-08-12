
import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/data/apis/authentication_client.dart';
import 'package:speakyfox/data/dio_factory.dart';

void main() async {
  final authDio = await DioFactory.initializeAuthDio();

  test('authentication client', () async {
    AuthenticationClient authenticationClient = AuthenticationClient(authDio);
    final answer = await authenticationClient.login("stefan_anders@gmx.net", "Kuchen1981!", "password");
    print(answer.accessToken.toString());
  });

  ;
}
