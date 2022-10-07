import 'dart:io';

import 'package:dio/dio.dart' hide Response;
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/app/constants.dart';
import 'package:speakyfox/data/dio_factory.dart';
import 'package:speakyfox/data/remote/authentication_client.dart';
import 'package:speakyfox/data/remote/token_client.dart';
import 'package:speakyfox/data/requests/authentication_body.dart';

import '../../http_client_test_setup.dart';

void main() async {
  Dio dio = DioFactory.initialize(baseUrl: Constants.baseUrlAuthQA);
  AuthenticationClient authenticationClient = AuthenticationClient(dio);

  test(
    "get AGBs",
    () async {
      final response = await authenticationClient.fetchAGBs();
      String rawHTML = response;

      expect(rawHTML, isNotEmpty);

      debugPrint(rawHTML);
    },
  );

  test(
    'logout',
    () async {
      //get accessToken from authentication server
      final tokenDio = DioFactory.initialize(baseUrl: Constants.baseUrlAuthQA);
      TokenClient tokenClient = TokenClient(tokenDio);

      final ticket = await tokenClient.accessToken(AuthenticationRequestBody(
          userName: "julien.ambos@ja-developer.de", password: "Peter123!", grantType: "password"));
      String accessToken = ticket.accessToken;
      //Bis hier nur Token geholt

      final dioT = DioFactory.initialize(baseUrl: TestConstants.baseUrlQA);

      dioT.options.headers.addEntries({MapEntry(HttpHeaders.contentTypeHeader, "application/json")});

      var authClient = AuthenticationClient(dioT);

      await authClient.fetchUser(accessToken);

      authClient = AuthenticationClient(dioT, baseUrl: Constants.baseUrlAuthQA);

      final response = await authClient.logout();
      bool success = response.data;

      debugPrint(success.toString());
    },
  );
  test(
    'fetchUser',
    () async {
         final tokenDio = DioFactory.initialize(baseUrl: Constants.baseUrlAuthQA);
      TokenClient tokenClient = TokenClient(tokenDio);

      final ticket = await tokenClient.accessToken(AuthenticationRequestBody(
          userName: "julien.ambos@ja-developer.de", password: "Peter123!", grantType: "password"));
      String accessToken = ticket.accessToken;

      final response = await authenticationClient.fetchUser(accessToken);
    },
  );
}
