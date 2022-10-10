import 'dart:convert';
import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/data/remote/file_client.dart';

import '../../http_client_test_setup.dart';

void main() async {
  final dio = await getAuthenticatedHTTPClientForTesting();

  FileClient fileClient = FileClient(dio, baseUrl: "${TestConstants.baseUrlQA}files");

//FIXME Doesn't work yet! Ask Julien about file handling

  test(
    'getImage',
    () async {
      final response = await fileClient.getFileById("65819ea5-f68f-47cb-aa51-133d6052f7a6");
      var image = Base64Decoder().convert(response.data);
      Image.memory(image);
    },
  );
}


/* 
/*  */
/* import 'package:flutter/foundation.dart';
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



 */ */