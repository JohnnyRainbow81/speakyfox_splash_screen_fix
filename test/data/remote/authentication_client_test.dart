import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/app/constants.dart';
import 'package:speakyfox/data/dio_factory.dart';
import 'package:speakyfox/data/remote/authentication_client.dart';

void main() async {
   TestWidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Dio dio = await DioV1.initialize(Constants.baseUrlAuthQA);
  AuthenticationClient authenticationClient = AuthenticationClient(dio);

  test(
    "get AGBs",
    () async {
      final response = await authenticationClient.fetchAGBs();
      String rawHTML = response;
      debugPrint(rawHTML);
    },
  );
}
