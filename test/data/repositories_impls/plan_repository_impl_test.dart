import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/app/connectivity_service.dart';
import 'package:speakyfox/app/constants.dart';
import 'package:speakyfox/data/dio_factory.dart';
import 'package:speakyfox/data/remote/plan_client.dart';
import 'package:speakyfox/data/repositories_impls/plan_repository_impl.dart';
import 'package:speakyfox/domain/repositories/plan_repository.dart';

import '../../http_client_test_setup.dart';

void main() async {
  //Connectivity plugin error here

  final dio = await getAuthenticatedHTTPClientForTesting();

  TestWidgetsFlutterBinding.ensureInitialized();
  final connectivityService = ConnectivityService();
  PlanClient client = PlanClient(dio, baseUrl: "${TestConstants.baseUrlQA}plans");
  Firebase.initializeApp();
  PlanRepositoryImpl planRepository = PlanRepositoryImpl(connectivityService, client);
  test(
    'getAll()',
    () async {
      final response = await planRepository.getAll("");
      debugPrint(response.toString());
    },
  );
}
