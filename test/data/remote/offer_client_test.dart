import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/data/mappers/offer_mapper.dart';
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
        'getById',
        () async {
          final response = await offerClient.getById("7dfddc1e-c88e-431f-b576-5b7a5c1b29c2");
          debugPrint(response.data.toOffer().toString());
        },
      );
      test(
        'getOfferByRefOrNull',
        () async {
          // TODO find offer ref? > ask Julien
          final response = await offerClient.getOfferByRefOrNull("");
        },
      );

      test(
        'getAll',
        () async {
          final response = await offerClient.getAll("");
        },
      );
    },
  );
}
