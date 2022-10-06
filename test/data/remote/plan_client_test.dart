import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/data/mappers/payment_method_mapper.dart';
import 'package:speakyfox/data/mappers/plan_mapper.dart';
import 'package:speakyfox/data/remote/plan_client.dart';
import 'package:dio/dio.dart';
import '../../http_client_test_setup.dart';

void main() async {
  Dio dio = await getAuthenticatedHTTPClientForTesting();

  PlanClient planClient = PlanClient(dio, baseUrl: "${TestConstants.baseUrlQA}plans");
  group(
    PlanClient,
    () {
      test(
        'getById',
        () async {
          final response = await planClient.getById("9d4d6877-ee24-4a6c-b0a2-3946e6756ae0");
          final plan = response.data.toPlan();

          debugPrint(plan.toString());
        },
      );
      test(
        'getAll()',
        () async {
          final response = await planClient.getAll("");
          final plans = response.data.map((e) => e.toPlan()).toList();

          debugPrint(plans.first.toString());
        },
      );
    },
  );
}
