import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class FileClient2 {
  late Dio _dio;
  late String baseUrl;
  late String path;

  late String _localFilePath;

  FileClient2({required this.baseUrl, required this.path}) {
    Map<String, String> headers = {HttpHeaders.acceptHeader: "application/octet-stream"};
    BaseOptions options =
        BaseOptions(baseUrl: baseUrl, connectTimeout: 30 * 1000, headers: headers, responseType: ResponseType.bytes);
    _dio = Dio(options);

    //Log calls, but don't log response bodies cause they're too big
    _dio.interceptors.add(PrettyDioLogger(compact: true,maxWidth: 100,responseBody: false ));
  }

  Future<Response<Uint8List>> getFileById(String id) async {
    return _dio.get("$baseUrl$path$id");
  }
}
