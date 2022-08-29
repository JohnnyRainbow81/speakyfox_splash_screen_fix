import 'package:dio/dio.dart' hide Response;
import 'package:retrofit/retrofit.dart';
import 'package:speakyfox/data/dtos/language_dto.dart';
import 'package:speakyfox/data/dtos/response.dart';
import 'package:speakyfox/data/remote/base_client.dart';
part 'language_client.g.dart';

@RestApi()
abstract class LanguageClient with BaseClient<LanguageDto> {
  factory LanguageClient(Dio dio, {String baseUrl}) = _LanguageClient;

  @GET("")
  Future<Response<List<LanguageDto>>> getTargetLanguages({@Query("isTargetLanguage") bool isTargetLanguage = true});

  @GET("{id}")
  Future<Response<LanguageDto>> getLanguageById(@Path() String id);

  @GET("")
  Future<Response<List<LanguageDto>>> getTargetLanguagesBySourceLanguageId(@Query("sourceLanguageId") String languageId,
      {@Query("isTargetLanguage") bool isTargetLanguage = true});

  @GET("")
  Future<Response<List<LanguageDto>>> getSourceLanguages(
      {@Query("isSourceLanguage") bool isSourceLanguage = true}); //isSourceLanguage

  @GET("")
  Future<Response<List<LanguageDto>>> getSourceLanguagesByTargetLanguageId(@Query("targetLanguageId") String languageId,
      {@Query("isSourceLanguage") bool isSourceLanguage = true});
}
