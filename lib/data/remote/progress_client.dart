import 'package:dio/dio.dart' hide Response;
import 'package:retrofit/retrofit.dart';
import 'package:speakyfox/data/dtos/response.dart';
import 'package:speakyfox/data/remote/base_client.dart';
part 'progress_client.g.dart';

@RestApi()
abstract class ProgressClient with BaseClient<dynamic> {
  factory ProgressClient(Dio dio, {String baseUrl}) = _ProgressClient;

  @PATCH("/{lectureId}")
  Future<Response<dynamic>> updateProgress(@Path("lectureId") String lectureId, @Body() double progress);
}
