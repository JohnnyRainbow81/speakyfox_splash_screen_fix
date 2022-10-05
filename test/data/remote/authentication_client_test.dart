import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/app/constants.dart';
import 'package:speakyfox/data/dio_factory.dart';
import 'package:speakyfox/data/remote/authentication_client.dart';

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
}
