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
  test('getAll()', () async {
    final response = await classClient.getAll("");

    final classes = response.data.map((e) => e.toClass()).toList();

    for (final classs in classes) {
      debugPrint(classs.toString());
    }
  });
}



