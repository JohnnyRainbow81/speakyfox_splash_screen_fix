import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/data/dio_factory.dart';
import 'package:speakyfox/data/mappers/course_mapper.dart';
import 'package:speakyfox/data/remote/course_client.dart';
import 'package:speakyfox/domain/models/course.dart';

import '../../test_get_access_token.dart';

void main() async {
  String token = await getAuthTokenForTesting();

  final dioV1 = await DioV1.initialize("", token);

  CourseClient courseClient =
      CourseClient(dioV1, baseUrl: "https://speakyfox-api-production.herokuapp.com/api/v1/courses/");

  test("getById()", () async {
    final response = await courseClient.getById("fa999236-6aeb-473b-b5f8-7b76f1e15ad8");
    Course course = response.data.toCourse();

    debugPrint(course.toString());
  });

  test('getAll()', () async {
    //final response = await courseClient.getAll("");

    //Not allowed for role = user    
    expect(courseClient.getAll(""), throwsException);
  });
}

//Example ID
//https://speakyfox-api-production.herokuapp.com/api/v1/courses/fa999236-6aeb-473b-b5f8-7b76f1e15ad8
