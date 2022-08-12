import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/data/apis/user_client.dart';
import 'package:speakyfox/data/dio_factory.dart';

void main() async {
  // TODO: Implement test
  final dio = await DioFactory.initializeUserDio();

  test('invalid email at forgot password request', (() async {
    UserClient userClient = UserClient(dio, baseUrl: "https://speakyfox-api-qa.herokuapp.com/api/v1/");
    try {
      final answer = await userClient.forgotPassword("not_valid@gmx.net");
      expect(() {}, throwsException);
    } catch (e) {
      print(e);
    }
  }));
}
