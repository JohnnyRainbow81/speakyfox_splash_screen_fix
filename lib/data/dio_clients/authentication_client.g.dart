// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _AuthenticationClient implements AuthenticationClient {
  _AuthenticationClient(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<TicketResponse> accessToken(username, password, grantType) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'username': username,
      'password': password,
      'grant_type': grantType
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TicketResponse>(Options(
                method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options,
                'https://speakyfox-api-production.herokuapp.com/connect/token',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TicketResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TicketResponse> refreshToken(refreshToken, grantType) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'refresh_token': refreshToken, 'grant_type': grantType};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TicketResponse>(Options(
                method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options,
                'https://speakyfox-api-production.herokuapp.com/connect/token',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TicketResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserResponse> fetchMe(token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/users/me',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<bool> resetPassword(userId, body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _result = await _dio.fetch<bool>(_setStreamType<bool>(
        Options(method: 'PATCH', headers: _headers, extra: _extra)
            .compose(_dio.options, '/users/${userId}/password-reset',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
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
