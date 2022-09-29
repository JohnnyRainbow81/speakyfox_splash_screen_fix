import 'package:dio/dio.dart' hide Response;
import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/app/constants.dart';
import 'package:speakyfox/data/dio_factory.dart';
import 'package:speakyfox/data/remote/user_client.dart';
import 'package:speakyfox/data/requests/create_user_request.dart';

import '../../test_get_access_token.dart';

void main() async {
  String token = await getAuthTokenForTesting();
    final dioV1 =  DioFactory.initialize(baseUrl:Constants.baseUrlAuthQA);

  UserClient userClient = UserClient(dioV1, baseUrl: "https://speakyfox-api-production.herokuapp.com/api/v1/users/");
  test('createUser() throws 405', (() async {
    CreateProfileUserRequest request =
        CreateProfileUserRequest(firstname: "Lea", lastname: "D", email: "email", password: "123pass", affiliateId: "");

    expectLater(
        userClient.createUser(request.toJson()),
        throwsA(predicate(
            (f) => f is DioError && f.response?.statusCode == 405, "Forbidden to create User with this call")));
  }));

  test("getById() throws 403", (() async {
    //Should 403 be the answer here?? > ask Julien
    expectLater(userClient.getById("1c796ae2-b521-4128-9875-59785ed932d2"),
        throwsA(predicate((f) => f is DioError && f.response?.statusCode == 403, "Forbidden")));
  }));

  test(
    "getOrdersOfCurrentClient() throws 403",
    //Should 403 be the answer here?? > ask Julien
    () async {
      expectLater(userClient.getOrdersOfCurrentUser(),
          throwsA(predicate((f) => f is DioError && f.response?.statusCode == 403)));
    },
  );

  test(
    "getSubscriptions() throws 403",
    //Should 403 be the answer here?? > ask Julien
    () async {
      expectLater(
          userClient.getSubscriptions(), throwsA(predicate((f) => f is DioError && f.response?.statusCode == 403)));
    },
  );

  test(
    "changePassword() throws 400",
    //400 is OK here
    () async {
      Map<String, dynamic> request = {"currentPassword": "wrong_password_blabla", "password": "shouldn'tWork"};
      expectLater(userClient.changePassword(request),
          throwsA(predicate((f) => f is DioError && f.response?.statusCode == 400, "user/password couple is invalid")));
    },
  );
}
