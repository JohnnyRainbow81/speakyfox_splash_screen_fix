import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/data/dio_factory.dart';
import 'package:speakyfox/data/remote/course_client.dart';

import '../../test_get_access_token.dart';

void main() async {
  String token = await testGetAuthToken();

  final dioV1 = await DioV1.initialize("", token);
  CourseClient courseClient = CourseClient(dioV1, baseUrl: "https://speakyfox-api-production.herokuapp.com/api/v1/courses");

  test('getAll()', () async {
    final response = await courseClient.getAll("");
    print(response);
  });
}
