import 'package:retrofit/retrofit.dart';
import 'package:speakyfox/data/responses/course_response.dart';
import 'package:speakyfox/data/responses/response.dart';
 part 'course_client.g.dart';
 
@RestApi()
abstract class CourseClient {
  @GET("/courses/{id}")
  Future<Response<CourseReponse>> getByIdDetailed(@Path("id") String id, @Query("detailed") bool detailed);
}
