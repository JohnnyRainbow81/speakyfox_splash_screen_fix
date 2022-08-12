import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:speakyfox/app/environment.dart';

const String X_WWW_FORM_URLENCODED = "application/x-www-form-urlencoded";
const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";

class DioFactory {
  //AppPreferences _appPreferences;

  DioFactory();

  Future<Dio> initializeDio() async {
    Dio dio = Dio();
    int _timeOut = 60 * 1000; // 1 min
    //String language =  env.defaultLanguage;
    //String token =  _appPreferences.getToken();
    Map<String, String> headers = {
      CONTENT_TYPE: X_WWW_FORM_URLENCODED,
      ACCEPT: APPLICATION_JSON,
      //DEFAULT_LANGUAGE: language
    };

    dio.options = BaseOptions(
        connectTimeout: _timeOut,
        receiveTimeout: _timeOut,
        headers: headers);

    if (kReleaseMode) {
      print("release mode no logs");
    } else {
      dio.interceptors.add(PrettyDioLogger(error: true,request: true,
          requestHeader: true, requestBody: true, responseHeader: true));
    }

    return dio;
  }
}
