import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/data/remote/file_client_2.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

import '../../http_client_test_setup.dart';

void main() {
  FileClient2 fileClient2 = FileClient2(baseUrl: TestConstants.baseUrlQA, path: "files");

  group(
    FileClient2,
    () {
      test(
        'getFileById',
        () async {
          final response = await fileClient2.getFileById("65819ea5-f68f-47cb-aa51-133d6052f7a6");
          //final bytes = File(response.data).readAsBytesSync();
          final decodedBytes = base64Decode(response.data);

          File file = File("65819ea5-f68f-47cb-aa51-133d6052f7a6.png");
          file.writeAsBytesSync(decodedBytes);

          Image.file(file);
        },
      );
    },
  );
}
