import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:path_provider/path_provider.dart' as pth;

class FileClient2 {
  late Dio _dio;
  late String baseUrl;
  late String path;

  late String _localFilePath;

  FileClient2({required this.baseUrl, required this.path}) {
    Map<String, String> headers = {HttpHeaders.acceptHeader: "image/png"};
    BaseOptions options = BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 30 * 1000,
        headers: headers,
        responseType: ResponseType.stream   Hier weitermachen!! List<int> entgegennehmen und dann weiterverarbeiten
       );
    _dio = Dio(options);
    _dio.interceptors.add(PrettyDioLogger());
    pth.getTemporaryDirectory().then((value) => _localFilePath = value.path);
  }

  Future<Response<dynamic>> getFileById(String id) async {
    return _dio.get("$baseUrl$path$id");
  }
}
/* /*   static Dio initialize({required String baseUrl}) {
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
} */ */