import 'package:dio/dio.dart' hide Response;
import 'package:retrofit/retrofit.dart';
import 'package:speakyfox/data/dtos/lecture_dto.dart';
import 'package:speakyfox/data/dtos/response.dart';
import 'package:speakyfox/data/dtos/vocabulary_dto.dart';
import 'package:speakyfox/data/remote/base_client.dart';

part 'vocabulary_client.g.dart';

@RestApi()
abstract class VocabularyClient with BaseClient<VocabularyDto> {
  factory VocabularyClient(Dio dio, {String baseUrl}) = _VocabularyClient;

  @GET("/{vocabularyId}")
  Future<Response<VocabularyDto>> getVocabularyById(@Path("vocabularyId") String vocabularyId);

  @GET("/{vocabularyId}/lectures")
  Future<Response<List<LectureDto>>> getLecturesOfVocabulary(
    @Path("vocabularyId") String vocabularyId,
  );
}
