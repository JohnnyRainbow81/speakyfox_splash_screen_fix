import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/data/remote/progress_client.dart';
import 'package:dio/dio.dart';
import '../../http_client_test_setup.dart';

void main() async {
  Dio dio = await getAuthenticatedHTTPClientForTesting();

  ProgressClient progressClient = ProgressClient(dio, baseUrl: "${TestConstants.baseUrlQA}lectures");
  group(
    ProgressClient,
    () {
      test(
        '',
        () async {},
      );
    },
  );
}
