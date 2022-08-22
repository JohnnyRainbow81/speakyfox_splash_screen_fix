// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _CourseClient implements CourseClient {
  _CourseClient(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Response<CourseDto>> getByIdDetailed(id, detailed) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'detailed': detailed};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<Response<CourseDto>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/courses/${id}', queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<CourseDto>.fromJson(
      _result.data!,
      (json) => CourseDto.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes || requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
