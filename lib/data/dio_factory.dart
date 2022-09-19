import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:speakyfox/app/dependency_injection.dart';
import 'package:speakyfox/app/error_handling/error_handler.dart';
import 'package:speakyfox/domain/models/identity_token.dart';
import 'package:speakyfox/domain/services/authentication_service.dart';

//Different Dio classes with different base urls are needed because we have different backend urls throughout the app.
//And because the dio classes are setup together by dependency injection at the start of the app.

//If we had only 1 Dio class we would need to change this single dio instance to different urls, which means we would need to
//touch the dependency injection layer, often while the user is on the same screen, using different functionalities.
//So i decided to make 4 seperate Dio instances, for auth-server, v1 and v2 and documents

// class DioAuth {
//   DioAuth._();

//   static Future<Dio> initialize(String baseUrl) async {
//     Dio dio = Dio();
//     int timeOut = 60 * 1000; // 1 min
//     Map<String, String> headers = {
//       HttpHeaders.contentTypeHeader: Headers.formUrlEncodedContentType,
//       HttpHeaders.acceptHeader: Headers.jsonContentType,
//     };

//     dio.options = BaseOptions(connectTimeout: timeOut, receiveTimeout: timeOut, headers: headers);
//     dio.options.baseUrl = baseUrl;

//     if (kReleaseMode) {
//       print("release mode no logs");
//     } else {
//       dio.interceptors.add(
//           PrettyDioLogger(error: true, request: true, requestHeader: true, requestBody: true, responseHeader: true));
//     }

//     return dio;
//   }
// }

class DioV1 {
  DioV1._();
  static final AuthenticationService _authenticationService = locator<AuthenticationService>();

  static Future<Dio> initialize(String baseUrl) async {
    Dio dio = Dio();
    int timeOut = 30 * 1000; // 10sec
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: Headers.formUrlEncodedContentType,
      HttpHeaders.acceptHeader: Headers.jsonContentType,
    };

    dio.options = BaseOptions(connectTimeout: timeOut, receiveTimeout: timeOut, headers: headers);
    dio.options.baseUrl = baseUrl;

    //check this:
    //https://stackoverflow.com/questions/56740793/using-interceptor-in-dio-for-flutter-to-refresh-token
    //https://pub.dev/packages/dio#interceptors
    //use AuthenticationService here?? Because Dio <> AuthenticationService would be in a cyclic dependency then
    dio.interceptors
        .add(PrettyDioLogger(error: true, request: true, requestHeader: true, requestBody: true, responseHeader: true));

    dio.interceptors.add(InterceptorsWrapper(
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onRequest: (options, handler) {
        //Request already has accessToken? > return
        //FIXME REDUNDANT because there will never be an auth header until this point
        if (options.headers.containsKey(HttpHeaders.authorizationHeader)) {
          return handler.next(options);
        }
        IdentityToken? credentials = _authenticationService.getCredentials();
        
        if (credentials != null) {
          String accessToken = credentials.accessToken;
          options.headers.addEntries({MapEntry(HttpHeaders.authorizationHeader, "Bearer $accessToken")});
        }
        //TODO check if OK
        return handler.next(options);//handler.resolve(Response(requestOptions: options)); //handler.next(options);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          try {
            //refresh accessToken by using refreshToken:
            await _authenticationService.refreshToken();

            //get new accessToken
            String accessToken = _authenticationService.getCredentials()!.accessToken;

            //re-issue the failed request with new accessToken:
            final options = Options(
              method: error.requestOptions.method,
              headers: error.requestOptions.headers
                ..update(HttpHeaders.authorizationHeader, (_) => "Bearer $accessToken"),
            );
            final response = await dio.request<dynamic>(error.requestOptions.path,
                data: error.requestOptions.data,
                queryParameters: error.requestOptions.queryParameters,
                options: options);
            handler.resolve(response);

          } catch (e) {
            debugPrint("Error in Dio.onErrorInterceptor: $e");
            ErrorHandler.handleError(e);
          }
        } else if (error.response?.statusCode == 403) {
          //TODO
          ErrorHandler.handleError(error);
        }
        return handler.next(error);
      },
    ));

    return dio;
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

    if (kReleaseMode) {
      print("release mode no logs");
    } else {
      dio.interceptors.add(
          PrettyDioLogger(error: true, request: true, requestHeader: true, requestBody: true, responseHeader: true));
    }

    return dio;
  }
}
