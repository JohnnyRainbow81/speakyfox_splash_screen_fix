import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/data/dio_clients/authentication_client.dart';
import 'package:speakyfox/data/dio_factory.dart';

void main() async {
  // TODO: Implement test
  final dio = await DioV1.initialize("https://speakyfox-api-qa.herokuapp.com/api/v1/");

  test('invalid email at forgot password request', (() async {
    AuthenticationClient authenticationClient = AuthenticationClient(dio);
    try {
      //final answer = await _authenticationClient.resetPassword("not_valid@gmx.net");
      expect(() {}, throwsException);
    } catch (e) {
      print(e);
    }
  }));
}
