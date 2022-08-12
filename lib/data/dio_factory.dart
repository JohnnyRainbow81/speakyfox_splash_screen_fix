import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String X_WWW_FORM_URLENCODED = "application/x-www-form-urlencoded";
const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";
const String TEXT_PLAIN = "text/plain";

class DioFactory {
  //AppPreferences _appPreferences;

  DioFactory._();

  static Future<Dio> initializeAuthDio() async {
    Dio dio = Dio();
    int _timeOut = 60 * 1000; // 1 min
    Map<String, String> headers = {
      CONTENT_TYPE: X_WWW_FORM_URLENCODED,
      ACCEPT: APPLICATION_JSON,
    };

    dio.options =
        BaseOptions(
          connectTimeout: _timeOut, receiveTimeout: _timeOut, headers: headers);

    if (kReleaseMode) {
      print("release mode no logs");
    } else {
      dio.interceptors.add(
          PrettyDioLogger(error: true, request: true, requestHeader: true, requestBody: true, responseHeader: true));
    }

    return dio;
  }

  static Future<Dio> initializeUserDio() async {
    Dio dio = Dio();
    int _timeOut = 60 * 1000; // 1 min
    Map<String, String> headers = {
      ACCEPT: APPLICATION_JSON,
    };

    dio.options =
        BaseOptions(
          connectTimeout: _timeOut, receiveTimeout: _timeOut, headers: headers);

    if (kReleaseMode) {
      print("release mode no logs");
    } else {
      dio.interceptors.add(
          PrettyDioLogger(error: true, request: true, requestHeader: true, requestBody: true, responseHeader: true));
    }

    return dio;
  }
}
