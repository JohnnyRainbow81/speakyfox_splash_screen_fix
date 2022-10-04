import 'dart:io';

import 'package:dio/dio.dart';
import 'package:speakyfox/app/constants.dart';
import 'package:speakyfox/data/dio_factory.dart';
import 'package:speakyfox/data/remote/token_client.dart';
import 'package:speakyfox/data/requests/authentication_body.dart';

class TestConstants {
  static const String baseUrlQA = "https://speakyfox-api-qa.herokuapp.com/api/v1/";
  static const userId_Julien = "";
}

Future<Dio> getAuthenticatedHTTPClientForTesting() async {
  final authDio = DioFactory.initialize(baseUrl: Constants.baseUrlAuthQA);

  TokenClient tokenClient = TokenClient(authDio);
  final response = await tokenClient.accessToken(AuthenticationRequestBody(
      userName: "julien.ambos@ja-developer.de", password: "Peter123!", grantType: "password"));

  String accessToken = response.accessToken;

  final dio = DioFactory.initialize(baseUrl: Constants.baseUrlAuthQA);
  dio.options.headers.addEntries({MapEntry(HttpHeaders.authorizationHeader, "Bearer $accessToken")});
  return dio;
}
