import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

//Different Dio classes with different base urls are needed because we have different backend urls throughout the app.
//And because the dio classes are setup together by dependency injection at the start of the app.

//If we had only 1 Dio class we would need to change this single dio instance to different urls, which means we would need to
//touch the dependency injection layer, often while the user is on the same screen, using different functionalities.
//So i decided to make 4 seperate Dio instances, for auth-server, v1 and v2 and documents

// class DioAuth {
//   DioAuth._();

//   static Future<Dio> initialize(String baseUrl) async {
//     Dio dio = Dio();
//     int _timeOut = 60 * 1000; // 1 min
//     Map<String, String> headers = {
//       CONTENT_TYPE: X_WWW_FORM_URLENCODED,
//       ACCEPT: APPLICATION_JSON,
//     };

//     dio.options = BaseOptions(connectTimeout: _timeOut, receiveTimeout: _timeOut, headers: headers);
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
class DioAuth {
  DioAuth._();

  static Future<Dio> initialize(String baseUrl) async {
    Dio dio = Dio();
    int timeOut = 60 * 1000; // 1 min
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: Headers.formUrlEncodedContentType, 
      HttpHeaders.acceptHeader: Headers.jsonContentType,
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

class DioV1 {
  DioV1._();

  static Future<Dio> initialize(String baseUrl, String token) async {
    Dio dio = Dio();
    int timeOut = 10 * 1000; // 10sec
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: Headers.formUrlEncodedContentType, 
      HttpHeaders.acceptHeader: Headers.jsonContentType,
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    dio.options = BaseOptions(connectTimeout: timeOut, receiveTimeout: timeOut, headers: headers);
    dio.options.baseUrl = baseUrl;

    if (kReleaseMode) {
      print("release mode no logs");
    } else {
      //check this:
      //https://stackoverflow.com/questions/56740793/using-interceptor-in-dio-for-flutter-to-refresh-token
      //https://pub.dev/packages/dio#interceptors
      //use AuthenticationService here??
      dio.interceptors.add(
          PrettyDioLogger(error: true, request: true, requestHeader: true, requestBody: true, responseHeader: true));

      dio.interceptors.add(InterceptorsWrapper(
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onError: (error, handler) {
          return handler.next(error);
        },
      ));
    }

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
