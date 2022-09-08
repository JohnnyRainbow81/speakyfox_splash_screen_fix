import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/data/dio_factory.dart';
import 'package:speakyfox/data/remote/class_client.dart';

import '../../test_get_access_token.dart';

void main() async{
   String token = await getAuthTokenForTesting();

  final dioV1 = await DioV1.initialize("");
  ClassClient courseClient = ClassClient(dioV1, baseUrl: "https://speakyfox-api-production.herokuapp.com/api/v1/classes");
  test('getAll()', () async {
     final response = await courseClient.getAll("");
    print(response);
  });
}