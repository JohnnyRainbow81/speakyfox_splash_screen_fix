import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/app/connectivity_service.dart';
import 'package:speakyfox/data/dio_factory.dart';
import 'package:speakyfox/data/remote/plan_client.dart';
import 'package:speakyfox/data/repositories_impls/plan_repository_impl.dart';
import 'package:speakyfox/domain/repositories/plan_repository.dart';

import '../../test_get_access_token.dart';

void main() async {

  //Connectivity plugin error here

  String token = await getAuthTokenForTesting();

  final dioV1 = await DioV1.initialize("", token);
  TestWidgetsFlutterBinding.ensureInitialized();
  final connectivityService = ConnectivityService();
  PlanClient client = PlanClient(dioV1, baseUrl: "https://speakyfox-api-production.herokuapp.com/api/v1/plans");
  Firebase.initializeApp();
  PlanRepository planRepository = PlanRepositoryImpl(connectivityService, client);
  test('getAll()', () async {
    final response = await planRepository.getAll("");
    debugPrint(response.toString());
  }, );
}
