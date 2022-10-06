// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _OrderClient implements OrderClient {
  _OrderClient(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Response<OrderDto>> createOrder(userId, order) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(order);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<OrderDto>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'users/{userid}/orders',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<OrderDto>.fromJson(
      _result.data!,
      (json) => OrderDto.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<Response<List<OrderDto>>> getAll(param) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'': param};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<List<OrderDto>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<List<OrderDto>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<OrderDto>((i) => OrderDto.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<Response<OrderDto>> getById(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<OrderDto>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<OrderDto>.fromJson(
      _result.data!,
      (json) => OrderDto.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<Response<OrderDto>> post(entity) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = entity;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<OrderDto>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<OrderDto>.fromJson(
      _result.data!,
      (json) => OrderDto.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<Response<OrderDto>> patchById(id, entity) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': id};
    final _headers = <String, dynamic>{};
    final _data = entity;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<OrderDto>>(
            Options(method: 'PATCH', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<OrderDto>.fromJson(
      _result.data!,
      (json) => OrderDto.fromJson(json as Map<String, dynamic>),
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
