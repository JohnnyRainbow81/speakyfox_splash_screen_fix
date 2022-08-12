import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/app/constants.dart';
import 'package:speakyfox/app/dependency_injection.dart';
import 'package:speakyfox/app/environment.dart';
import 'package:speakyfox/data/apis/authentication_client.dart';
import 'package:speakyfox/data/dio_factory.dart';

void main() async {

  final dioFactory = DioFactory();
  final dio = await dioFactory.initializeDio();

  test('authentication client', () async {
    AuthenticationClient authenticationClient = AuthenticationClient(dio, baseUrl: Constants.baseUrlAuth );
    final answer = await authenticationClient.login("stefan_anders@gmx.net", "Kuchen1981!", "password");
    print(answer.accessToken.toString());
  });
}
