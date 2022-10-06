import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/data/mappers/subscription_mapper.dart';
import 'package:speakyfox/data/remote/subscription_client.dart';

import '../../http_client_test_setup.dart';

void main() async {
  Dio dio = await getAuthenticatedHTTPClientForTesting();

//This url has NO endpoint here because we have different endpoints IN the single methods inside the SubscriptionClient
  SubscriptionClient subscriptionClient = SubscriptionClient(dio, baseUrl: "${TestConstants.baseUrlQA}subscriptions");
  group(SubscriptionClient, () {
    test(
      'getAll',
      () async {
        final response = await subscriptionClient.getAll("");

        final subscriptions = response.data.map((e) => e.toSubscription()).toList();

        for (final subscription in subscriptions) {
          debugPrint(subscription.toString());
        }
      },
    );
  });
}
