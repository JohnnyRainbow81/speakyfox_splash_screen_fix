import 'package:dio/dio.dart' hide Response;
import 'package:retrofit/retrofit.dart';
import 'package:speakyfox/data/dtos/language_dto.dart';
import 'package:speakyfox/data/dtos/lecture_dto.dart';
import 'package:speakyfox/data/dtos/response.dart';
import 'package:speakyfox/data/remote/base_client.dart';
    part 'lecture_client.g.dart';

@RestApi()
abstract class LectureClient<SequenceDto> with BaseClient<LectureDto> {
  factory LectureClient(Dio dio, {String baseUrl}) = _LectureClient;

  @GET("")
  Future<Response<LectureDto>> getByIdDetailed(@Query("id") id, @Query("detailed") bool detailed);

  @GET("")
  Future<Response<List<LectureDto>>> getAllV2(@Query("queryParameters") String queryParameters);

  @GET("")
  Future<Response<LectureDto>> getByIdDetailedV2(@Query("id") id, @Query("detailed") bool detailed);

  @GET("")
  Future<Response<List<LectureDto>>> getOnboardingLecturesByLanguageIds(
      @Query("sourceLanguageId") sourceLanguageId, @Query("targetLanguageId") String targetLanguageId);

  @GET("")
  Future<Response<List<LectureDto>>> getAllLecturesByCourseId(@Query("courseId") courseId);

  @GET("")
  Future<Response<dynamic>> updateProgress(@Query("lectureId") lectureId, @Body() Map<String, double> progress);

  @GET("")
  Future<Response<dynamic>> patchSequences(@Query("lectureId") lectureId, @Body() List<SequenceDto> sequences);
}
