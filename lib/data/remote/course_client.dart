import 'package:dio/dio.dart' hide Response;
import 'package:retrofit/retrofit.dart';
import 'package:speakyfox/data/dtos/course_dto.dart';
import 'package:speakyfox/data/dtos/response.dart';
import 'package:speakyfox/data/remote/entity_client.dart';
part 'course_client.g.dart';

@RestApi()
abstract class CourseClient with EntityClient<CourseDto> {
  factory CourseClient(Dio dio, {String baseUrl}) = _CourseClient;

  @GET("/courses/{id}")
  Future<Response<CourseDto>> getByIdDetailed(@Path("id") String id, @Query("detailed") bool detailed);
}
