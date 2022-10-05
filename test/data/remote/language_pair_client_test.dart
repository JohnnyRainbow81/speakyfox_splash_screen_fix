import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/data/mappers/language_pair_mapper.dart';
import 'package:speakyfox/data/remote/language_pair_client.dart';

import '../../http_client_test_setup.dart';

void main() async {
  Dio dio = await getAuthenticatedHTTPClientForTesting();

  LanguagePairClient languagePairClient = LanguagePairClient(dio, baseUrl: "${TestConstants.baseUrlQA}language-pairs");
  group(
    "language_pair_client_test",
    () {
      test(
        'getById',
        () async {
          final response = await languagePairClient.getById("fa701d3c-2306-45cd-ab3c-e89cb990cd1d");
          final languagePair = response.data.toLanguagePair();

          debugPrint(languagePair.toString());
        },
      );
    },
  );
}
