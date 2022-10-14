import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:speakyfox/app/error_handling/error_handler.dart';
import 'package:speakyfox/domain/models/identity_token.dart';
import 'package:speakyfox/domain/services/authentication_service.dart';

class DioFactory {
  DioFactory._();

  static Dio initialize({required String baseUrl}) {
    Dio dio = Dio();
    int timeOut = 30 * 1000; // 30sec
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: Headers.formUrlEncodedContentType,
      HttpHeaders.acceptHeader: Headers.jsonContentType,
    };

    dio.options = BaseOptions(connectTimeout: timeOut, receiveTimeout: timeOut, headers: headers);
    dio.options.baseUrl = baseUrl;

    dio.interceptors
        .add(PrettyDioLogger(error: true, request: true, requestHeader: true, requestBody: true, responseHeader: true));

    return dio;
  }
}

class CustomInterceptor extends Interceptor {
  Dio dio;
  // FIXME Having AuthService here produces a circular dependency. Waiting for Juliens feedback to get rid of it
  AuthenticationService _authenticationService;

  CustomInterceptor(this.dio, this._authenticationService);

// check this:
  // https://stackoverflow.com/questions/56740793/using-interceptor-in-dio-for-flutter-to-refresh-token
  // https://pub.dev/packages/dio#interceptors
  // use AuthenticationService here?? Because Dio <> AuthenticationService would be in a cyclic dependency then
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //https://medium.com/flutter-community/dio-interceptors-in-flutter-17be4214f363

    // TODO Add custom header "requiresToken" : "true" in individual client calls
    // and use it here to specify which calls needs the auth token and which doesn't
    IdentityToken? credentials = _authenticationService.getCredentials();

    if (credentials != null) {
      String accessToken = credentials.accessToken;
      options.headers.putIfAbsent(HttpHeaders.authorizationHeader, (() => "Bearer $accessToken"));
      return handler.next(options); //super.onRequest(options, handler);
    }

    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      try {
        //refresh accessToken by using refreshToken:
        await _authenticationService.refreshToken();

        //get new accessToken
        String accessToken = _authenticationService.getCredentials()!.accessToken;

        //re-issue the failed request with new accessToken:
        final options = Options(
          method: err.requestOptions.method,
          headers: err.requestOptions.headers
            ..putIfAbsent(HttpHeaders.authorizationHeader, () => "Bearer $accessToken"),
        );

        final response = await dio.request<dynamic>(err.requestOptions.path,
            data: err.requestOptions.data, queryParameters: err.requestOptions.queryParameters, options: options);
        handler.resolve(response);
      } catch (e) {
        debugPrint("Error in Dio.onErrorInterceptor: $e");
      }
    } else if (err.response?.statusCode == 404) {
      // ErrorHandler.handleError(err);
      return handler.next(err);
    }
    return handler.next(err);
  }
}

class DioDocuments {
  DioDocuments._();

  static Future<Dio> initialize(String baseUrl) async {
    Dio dio = Dio();
    int timeOut = 60 * 1000; // 1 min
    Map<String, String> headers = {
      Headers.contentTypeHeader: Headers.formUrlEncodedContentType,
      Headers.acceptHeader: Headers.jsonContentType,
    };

    dio.options = BaseOptions(connectTimeout: timeOut, receiveTimeout: timeOut, headers: headers);
    dio.options.baseUrl = baseUrl;

    dio.interceptors
        .add(PrettyDioLogger(error: true, request: true, requestHeader: true, requestBody: true, responseHeader: true));

    return dio;
  }
}
