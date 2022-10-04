import 'package:dio/dio.dart' hide Response;
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/app/constants.dart';
import 'package:speakyfox/data/dio_factory.dart';
import 'package:speakyfox/data/mappers/subscription_mapper.dart';
import 'package:speakyfox/data/mappers/user_mapper.dart';
import 'package:speakyfox/data/remote/user_client.dart';
import 'package:speakyfox/data/requests/create_user_request.dart';
import 'package:speakyfox/domain/models/user.dart';

import '../../http_client_test_setup.dart';

void main() async {
  final dio = await getAuthenticatedHTTPClientForTesting();

  UserClient userClient = UserClient(dio, baseUrl: "${TestConstants.baseUrlQA}users/");

  test('createUser() throws 405', (() async {
    CreateProfileUserRequest request =
        CreateProfileUserRequest(firstname: "Lea", lastname: "D", email: "email", password: "123pass", affiliateId: "");

    expectLater(
        userClient.createUser(request.toJson()),
        throwsA(predicate(
            (f) => f is DioError && f.response?.statusCode == 405, "Forbidden to create User with this call")));
  }));

  test("getById", (() async {
    final response = await userClient.getById("64c4813e-68bf-4552-b8d9-7f8ce798a9ed"); //Julien Id
    User julien = response.data.toUser();
    debugPrint(julien.toString());
  }));

  test(
    "getOrdersOfCurrentClient() throws 403",
    //Should 403 be the answer here?? > ask Julien
    () async {
      expectLater(userClient.getOrdersOfCurrentUser("64c4813e-68bf-4552-b8d9-7f8ce798a9ed"),
          throwsA(predicate((f) => f is DioError && f.response?.statusCode == 403)));
    },
  );

  test(
    "getSubscriptions()",
    () async {
      final response = await userClient.getSubscriptions("64c4813e-68bf-4552-b8d9-7f8ce798a9ed");
      final subscriptions = response.data.map((e) => e.toSubscription()).toList();
      
      for (final subscription in subscriptions) {
        debugPrint(subscription.toString());
      }
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
