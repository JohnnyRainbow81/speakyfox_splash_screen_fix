import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/data/dtos/class_dto.dart';
import 'package:speakyfox/data/dtos/course_dto.dart';
import 'package:speakyfox/data/mappers/lecture_mapper.dart';
import 'package:speakyfox/data/remote/lecture_client.dart';

import '../../http_client_test_setup.dart';

void main() async {
  Dio dio = await getAuthenticatedHTTPClientForTesting();

  LectureClient lectureClient = LectureClient(dio, baseUrl: "${TestConstants.baseUrlQA}lectures");
  test('getByIdDetailed', () async {
    final response = await lectureClient.getByIdDetailed("fe225b45-9a9c-4a96-a89f-c73c0b859ffe", true);
    final lecture = response.data.toLecture();

    debugPrint(lecture.toString());
  });

  test('getById', () async {
    final response = await lectureClient.getById("fe225b45-9a9c-4a96-a89f-c73c0b859ffe");
    final lecture = response.data.toLecture();

    debugPrint(lecture.toString());
  });
  test(
    'getAllV2',
    () async {
      // Error, this call NEEDS /v2  !!
      final response = await lectureClient.getAllV2(
          "02c6e388-bcb1-427b-8b8d-d49704671c22", "49513cb6-32f1-4efd-9542-ad1ecd968c4f"); //TODO
      final lectures = response.data.map((e) => e.toLecture()).toList();

      for (final lecture in lectures) {
        debugPrint(lecture.toString());
      }
    },
  );

  test(
    'getByIdDetailedV2',
    () async {
      final response = await lectureClient.getByIdDetailedV2("fe225b45-9a9c-4a96-a89f-c73c0b859ffe", true);
      final lecture = response.data;

      debugPrint(lecture.toString());
    },
  );

  test(
    'getAllLecturesByCourseId',
    () async {
      final response = await lectureClient.getAllLecturesByCourseId("af64ae47-360f-4368-b1b4-63d765ceed65");
      final lecture = response.data;

      debugPrint(lecture.toString());
    },
  );

  test(
    'getAll',
    () async {
      final response = await lectureClient.getAll("");
    },
  );

  test(
    'updateProgress',
    () async {
      final response = await lectureClient.updateProgress("fe225b45-9a9c-4a96-a89f-c73c0b859ffe", 5);

      debugPrint("runtimeType: ${response.data.runtimeType.toString()}");

      final data = response.data as Map<String, dynamic>;
      final course = CourseDto.fromJson(data);

      debugPrint(course.toString());
    },
  );
}
