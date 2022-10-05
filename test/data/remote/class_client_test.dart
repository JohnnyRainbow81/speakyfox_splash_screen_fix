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



/*   Future<Response<List<ClassDto>>> getAll(param) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'': param};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<List<ClassDto>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<List<ClassDto>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<ClassDto>((i) => ClassDto.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value; */