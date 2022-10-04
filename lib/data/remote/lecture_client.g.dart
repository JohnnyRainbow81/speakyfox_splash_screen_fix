// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _LectureClient implements LectureClient {
  _LectureClient(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Response<LectureDto>> getByIdDetailed(id, detailed) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'id': id.toJson(),
      r'detailed': detailed
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<LectureDto>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<LectureDto>.fromJson(
      _result.data!,
      (json) => LectureDto.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<Response<List<LectureDto>>> getAllV2(queryParams) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'queryParams': queryParams};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<List<LectureDto>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<List<LectureDto>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<LectureDto>(
              (i) => LectureDto.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<Response<LectureDto>> getByIdDetailedV2(id, detailed) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'id': id.toJson(),
      r'detailed': detailed
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<LectureDto>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<LectureDto>.fromJson(
      _result.data!,
      (json) => LectureDto.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<Response<List<LectureDto>>> getOnboardingLecturesByLanguageIds(
      sourceLanguageId, targetLanguageId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'sourceLanguageId': sourceLanguageId.toJson(),
      r'targetLanguageId': targetLanguageId
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<List<LectureDto>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<List<LectureDto>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<LectureDto>(
              (i) => LectureDto.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<Response<List<LectureDto>>> getAllLecturesByCourseId(courseId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'courseId': courseId};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<List<LectureDto>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<List<LectureDto>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<LectureDto>(
              (i) => LectureDto.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<Response<dynamic>> updateProgress(lectureId, progress) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'lectureId': lectureId};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(progress);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<dynamic>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<dynamic>.fromJson(
      _result.data!,
      (json) => json as dynamic,
    );
    return value;
  }

  @override
  Future<Response<dynamic>> patchSequences(lectureId, sequences) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'lectureId': lectureId};
    final _headers = <String, dynamic>{};
    final _data = sequences.map((e) => e.toJson()).toList();
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<dynamic>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<dynamic>.fromJson(
      _result.data!,
      (json) => json as dynamic,
    );
    return value;
  }

  @override
  Future<Response<List<LectureDto>>> getAll(param) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'': param};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<List<LectureDto>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<List<LectureDto>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<LectureDto>(
              (i) => LectureDto.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<Response<LectureDto>> getById(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<LectureDto>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<LectureDto>.fromJson(
      _result.data!,
      (json) => LectureDto.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<Response<LectureDto>> post(entity) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = entity;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<LectureDto>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<LectureDto>.fromJson(
      _result.data!,
      (json) => LectureDto.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<Response<LectureDto>> patchById(id, entity) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': id};
    final _headers = <String, dynamic>{};
    final _data = entity;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<LectureDto>>(
            Options(method: 'PATCH', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<LectureDto>.fromJson(
      _result.data!,
      (json) => LectureDto.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<Response<bool>> removeById(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': id};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<bool>>(
            Options(method: 'DELETE', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<bool>.fromJson(
      _result.data!,
      (json) => json as bool,
    );
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
