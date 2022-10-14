// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _UserClient implements UserClient {
  _UserClient(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Response<UserDto>> createUser(createUserRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(createUserRequest);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<UserDto>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/{id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<UserDto>.fromJson(
      _result.data!,
      (json) => UserDto.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<String> attachPaymentMethodToUser(userId, body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<String>(_setStreamType<String>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/${userId}/payment-methods',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<Response<OrderDto>> getOrdersOfCurrentUser(userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<OrderDto>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/${userId}/orders',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<OrderDto>.fromJson(
      _result.data!,
      (json) => OrderDto.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<Response<List<SubscriptionDto>>> getSubscriptions(userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<List<SubscriptionDto>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/${userId}/subscriptions',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<List<SubscriptionDto>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<SubscriptionDto>(
              (i) => SubscriptionDto.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<Response<bool>> changePassword(changePasswordRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Content-Type': 'application/json'};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(changePasswordRequest);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<bool>>(Options(
                method: 'PATCH',
                headers: _headers,
                extra: _extra,
                contentType: 'application/json')
            .compose(_dio.options, '/me/password',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<bool>.fromJson(
      _result.data!,
      (json) => json as bool,
    );
    return value;
  }

  @override
  Future<Response<LanguagePairDto>> patchLanguagePairBySourceTargetLanguagesIds(
      userId, body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<LanguagePairDto>>(
            Options(method: 'PATCH', headers: _headers, extra: _extra)
                .compose(_dio.options, '/${userId}/language-pair',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<LanguagePairDto>.fromJson(
      _result.data!,
      (json) => LanguagePairDto.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<Response<String>> createSetupIntent(userId, paymentMethodType) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(paymentMethodType);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<String>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(
                    _dio.options, '/${userId}/payment-methods/setup-intents',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<Response<bool>> removePaymentMethod(
      userId, paymentMethodType, externalId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'paymentMethodType': paymentMethodType,
      r'externalId': externalId
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<bool>>(
            Options(method: 'DELETE', headers: _headers, extra: _extra)
                .compose(_dio.options, '/${userId}/payment-methods',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<bool>.fromJson(
      _result.data!,
      (json) => json as bool,
    );
    return value;
  }

  @override
  Future<Response<SubscriptionDto>> createSubscription(id, subscription) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Content-Type': 'application/json'};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(subscription);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<SubscriptionDto>>(Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                contentType: 'application/json')
            .compose(_dio.options, '/${id}/subscriptions',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<SubscriptionDto>.fromJson(
      _result.data!,
      (json) => SubscriptionDto.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<Response<List<UserDto>>> getAll(param) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'': param};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<List<UserDto>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<List<UserDto>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<UserDto>((i) => UserDto.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<Response<UserDto>> getById(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<UserDto>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<UserDto>.fromJson(
      _result.data!,
      (json) => UserDto.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<Response<UserDto>> post(entity) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = entity;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<UserDto>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<UserDto>.fromJson(
      _result.data!,
      (json) => UserDto.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<Response<UserDto>> patchById(id, entity) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': id};
    final _headers = <String, dynamic>{};
    final _data = entity;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<UserDto>>(
            Options(method: 'PATCH', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Response<UserDto>.fromJson(
      _result.data!,
      (json) => UserDto.fromJson(json as Map<String, dynamic>),
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
