import 'package:dio/dio.dart' hide Response;
import 'package:retrofit/retrofit.dart';
import 'package:speakyfox/data/dtos/course_dto.dart';
import 'package:speakyfox/data/dtos/lecture_dto.dart';
import 'package:speakyfox/data/dtos/response.dart';
import 'package:speakyfox/data/dtos/sequence_dto.dart';
import 'package:speakyfox/data/remote/base_client.dart';
part 'lecture_client.g.dart';

@RestApi()
abstract class LectureClient with BaseClient<LectureDto> {
  factory LectureClient(Dio dio, {String baseUrl}) = _LectureClient;

  @GET("/{id}")
  Future<Response<LectureDto>> getByIdDetailed(@Path("id") id, @Query("detailed") bool detailed);

  @GET("")
  Future<Response<List<LectureDto>>> getAllV2(
    @Query("sourceLanguageId") String id,
    @Query("targetLanguageId") String targetLanguageId, [
    @Query("isOnboarding") bool isOnboarding = false,
    @Query("lectureUrlName") String lectureUrlName = "null",
    @Query("lastModified") String lastModified = "null",
  ]);

  @GET("/{id}")
  Future<Response<LectureDto>> getByIdDetailedV2(@Path("id") id, @Query("detailed") bool detailed);

  @GET("")
  Future<Response<List<LectureDto>>> getOnboardingLecturesByLanguageIds(
      @Query("sourceLanguageId") sourceLanguageId, @Query("targetLanguageId") String targetLanguageId);

  @GET("")
  Future<Response<List<LectureDto>>> getAllLecturesByCourseId(@Query("courseId") String courseId);

  @GET("/{lectureId}")  //this seems to return [Course]! (the web app had [dynamic] return type here)
  Future<Response<CourseDto>> updateProgress(@Path("lectureId") String lectureId, @Body() double progress);

  @GET("")
  Future<Response<dynamic>> patchSequences(@Query("lectureId") String lectureId, @Body() List<SequenceDto> sequences);
}
