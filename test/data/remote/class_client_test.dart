import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/app/constants.dart';
import 'package:speakyfox/data/dio_factory.dart';
import 'package:speakyfox/data/remote/class_client.dart';

import '../../http_client_test_setup.dart';

void main() async {
  final dio = await getAuthenticatedHTTPClientForTesting();

  ClassClient courseClient =
      ClassClient(dio, baseUrl: "https://speakyfox-api-production.herokuapp.com/api/v1/classes");
  test('getAll()', () async {
    final response = await courseClient.getAll("");
    print(response);
  });
}
