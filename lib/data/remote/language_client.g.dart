// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _LanguageClient implements LanguageClient {
  _LanguageClient(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Response<List<LanguageDto>>> getTargetLanguages(
      {isTargetLanguage = true}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'isTargetLanguage': isTargetLanguage
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<List<LanguageDto>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<List<LanguageDto>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<LanguageDto>(
              (i) => LanguageDto.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<Response<LanguageDto>> getLanguageById(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<LanguageDto>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<LanguageDto>.fromJson(
      _result.data!,
      (json) => LanguageDto.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<Response<List<LanguageDto>>> getTargetLanguagesBySourceLanguageId(
      languageId,
      {isTargetLanguage = true}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'sourceLanguageId': languageId,
      r'isTargetLanguage': isTargetLanguage
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<List<LanguageDto>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<List<LanguageDto>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<LanguageDto>(
              (i) => LanguageDto.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<Response<List<LanguageDto>>> getSourceLanguages(
      {isSourceLanguage = true}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'isSourceLanguage': isSourceLanguage
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<List<LanguageDto>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<List<LanguageDto>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<LanguageDto>(
              (i) => LanguageDto.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<Response<List<LanguageDto>>> getSourceLanguagesByTargetLanguageId(
      languageId,
      {isSourceLanguage = true}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'targetLanguageId': languageId,
      r'isSourceLanguage': isSourceLanguage
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<List<LanguageDto>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<List<LanguageDto>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<LanguageDto>(
              (i) => LanguageDto.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<Response<List<LanguageDto>>> getAll(param) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'': param};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<List<LanguageDto>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<List<LanguageDto>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<LanguageDto>(
              (i) => LanguageDto.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<Response<LanguageDto>> getById(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<LanguageDto>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<LanguageDto>.fromJson(
      _result.data!,
      (json) => LanguageDto.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<Response<LanguageDto>> post(entity) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = entity;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<LanguageDto>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<LanguageDto>.fromJson(
      _result.data!,
      (json) => LanguageDto.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<Response<LanguageDto>> patchById(id, entity) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': id};
    final _headers = <String, dynamic>{};
    final _data = entity;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<LanguageDto>>(
            Options(method: 'PATCH', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<LanguageDto>.fromJson(
      _result.data!,
      (json) => LanguageDto.fromJson(json as Map<String, dynamic>),
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
