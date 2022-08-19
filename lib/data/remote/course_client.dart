import 'package:dio/dio.dart' hide Response;
import 'package:retrofit/retrofit.dart';
import 'package:speakyfox/data/responses/course_response.dart';
import 'package:speakyfox/data/responses/response.dart';
 part 'course_client.g.dart';

@RestApi()
abstract class CourseClient {
   factory CourseClient(Dio dio, {String baseUrl}) = _CourseClient;

  @GET("/courses/{id}")
  Future<Response<CourseResponse>> getByIdDetailed(@Path("id") String id, @Query("detailed") bool detailed);
}
