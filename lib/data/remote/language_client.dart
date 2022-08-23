import 'package:dio/dio.dart' hide Response;
import 'package:retrofit/retrofit.dart';
import 'package:speakyfox/data/dtos/class_dto.dart';
import 'package:speakyfox/data/dtos/language_dto.dart';
import 'package:speakyfox/data/dtos/response.dart';
import 'package:speakyfox/data/remote/base_client.dart';
import 'package:speakyfox/domain/repositories/language_repository.dart';
   part 'language_client.g.dart';


@RestApi()
abstract class LanguageClient with BaseClient<LanguageDto> {
  factory LanguageClient(Dio dio, {String baseUrl}) = _LanguageClient;

  @GET("")
  Future<Response<List<LanguageDto>>> getTargetLanguages({@Query("isTargetLanguage") bool isTargetLanguage = true});

@GET("")
Future<Response<LanguageDto>> getLanguageById(@Path()String id);
// @GET("/languages")
// getTargetLanguagesBySourceLanguageId

}
