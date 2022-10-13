import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:dio/dio.dart' hide Response, Headers;
import 'package:retrofit/retrofit.dart';
import 'package:speakyfox/data/dtos/file_dto.dart';
import 'package:speakyfox/data/dtos/language_dto.dart';
import 'package:speakyfox/data/dtos/response.dart';
import 'package:speakyfox/data/remote/base_client.dart';
import 'package:speakyfox/domain/models/audio.dart';
import 'package:speakyfox/domain/models/image.dart';
import 'package:speakyfox/domain/models/language.dart';

part 'file_client_DELETE?.g.dart';

//TODO Ask Julien about file handling in general!
//Neither the web app nor the backend give me a clear picture of how files are handled..
@RestApi()
abstract class FileClient with BaseClient<FileDto> {
  factory FileClient(Dio dio, {String baseUrl}) = _FileClient;

  @GET("/{id}")
  @Headers({"accept": "application/octet-stream"})
  @CacheControl(noTransform: true)
  Future<Response<Uint8List>> getFileById(@Path("id")String id);

  @POST("")
  @FormUrlEncoded()
  Future<Response> uploadFile(@Path("resource") String resource, @Path("entityId") String entityId);

  @GET("")
  Future<Response> getAllFiles(String filter, String type, ImageType? imageType, AudioType? audioType,
      LanguageType? languageType, String languageId);

  @GET("{id}/metadata")
  Future<Response<dynamic>> GetMetadataById(@Path("id") String id);
}
