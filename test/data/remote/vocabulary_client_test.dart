import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/data/mappers/lecture_mapper.dart';
import 'package:speakyfox/data/mappers/vocabulary_mapper.dart';
import 'package:speakyfox/data/remote/vocabulary_client.dart';
import 'package:dio/dio.dart';
import '../../http_client_test_setup.dart';

void main() async {
  Dio dio = await getAuthenticatedHTTPClientForTesting();

  VocabularyClient vocabularyClient = VocabularyClient(dio, baseUrl: "${TestConstants.baseUrlQA}vocabularies");
  group(
    VocabularyClient,
    () {
      test(
        'getVocabularyById',
        () async {
          final response = await vocabularyClient.getVocabularyById("f770ac9b-60be-41e6-82c3-7265e2b93462");

          final vocabulary = response.data;

          debugPrint(vocabulary.toString());
        },
      );
      test(
        'getLecturesOfVocabulary',
        () async {
          final response = await vocabularyClient.getLecturesOfVocabulary("f770ac9b-60be-41e6-82c3-7265e2b93462");

          final lectures = response.data.map((e) => e.toLecture()).toList();

          for (final lecture in lectures) {
            debugPrint(lecture.toString());
          }
        },
      );
    },
  );
}
