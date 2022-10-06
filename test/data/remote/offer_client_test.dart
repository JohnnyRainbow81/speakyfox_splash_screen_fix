import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/data/remote/offer_client.dart';

import 'package:dio/dio.dart';
import '../../http_client_test_setup.dart';

void main() async {
  Dio dio = await getAuthenticatedHTTPClientForTesting();

  OfferClient offerClient = OfferClient(dio, baseUrl: "${TestConstants.baseUrlQA}offers");

  group(
    OfferClient,
    () {
      test(
        'getOfferByRefOrNull',
        () async {
          // TODO find offer ref? > ask Julien
          final response = offerClient.getOfferByRefOrNull("");
        },
      );
    },
  );
}
