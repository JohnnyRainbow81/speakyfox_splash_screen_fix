import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/app/constants.dart';
import 'package:speakyfox/data/dio_factory.dart';
import 'package:speakyfox/data/mappers/course_mapper.dart';
import 'package:speakyfox/data/remote/course_client.dart';
import 'package:speakyfox/domain/models/course.dart';

import '../../http_client_test_setup.dart';

void main() async {
  final dio = await getAuthenticatedHTTPClientForTesting();

  CourseClient courseClient = CourseClient(dio, baseUrl: "${TestConstants.baseUrlQA}courses");

  test("getById()", () async {
    final response = await courseClient.getById("af64ae47-360f-4368-b1b4-63d765ceed65");
    Course course = response.data.toCourse();

    expect(course.id, "af64ae47-360f-4368-b1b4-63d765ceed65");

    debugPrint(course.toString());
  });

  test('getAll()', () async {
    final response = await courseClient.getAll("");
    final courses = response.data.map((e) => e.toCourse()).toList();

    expect(courses, isNotNull);
    expect(courses.first.id, isNotEmpty);
    
    for (final course in courses) {
      debugPrint(course.toString());
    }
  });
}

//Example ID
//https://speakyfox-api-production.herokuapp.com/api/v1/courses/fa999236-6aeb-473b-b5f8-7b76f1e15ad8
