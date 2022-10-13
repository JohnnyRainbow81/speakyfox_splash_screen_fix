import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/app/constants.dart';
import 'package:speakyfox/data/dio_factory.dart';
import 'package:speakyfox/data/mappers/class_mapper.dart';
import 'package:speakyfox/data/remote/class_client.dart';

import '../../http_client_test_setup.dart';

void main() async {
  final dio = await getAuthenticatedHTTPClientForTesting();

  ClassClient classClient = ClassClient(dio, baseUrl: "${TestConstants.baseUrlQA}classes");
  test(
    'getByLanguagePairId',
    () async {
      final response = await classClient.getAllByLanguagePairId("649b2515-386f-4bb3-81ca-24f4c883b3aa");
      final classes = response.data.map((e) => e.toClass()).toList();

      for (final classs in classes) debugPrint(classs.toString());
    },
  );

  test('getAll()', () async {
    final response = await classClient.getAll("");

    final classes = response.data.map((e) => e.toClass()).toList();

    for (final classs in classes) {
      debugPrint(classs.toString());
    }
  });
}
