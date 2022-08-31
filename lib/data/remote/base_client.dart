import 'package:retrofit/retrofit.dart';
import 'package:speakyfox/data/dtos/response.dart';
//part 'entity_client.g.dart';

abstract class BaseClient<T> {
  //factory EntityClient(Dio dio, {String baseUrl}) = _EntityClient;
  @GET("")
  Future<Response<List<T>>> getAll(@Query("") String param);

  @GET("{id}")
  Future<Response<T>> getById(@Path("id") String id);

  @POST("")
  Future<Response<T>> post(@Body() dynamic entity);//FIXME Linter wants "dynamic" instead of "T" here?!

  @PATCH("")
  Future<Response<T>> patchById(
      @Query("id") String id, @Body() dynamic entity); //FIXME Linter wants "dynamic" instead of "T" here?!

  @DELETE("")
  Future<Response<bool>> removeById(@Query("id") String id);
}

//Future<Response<List<ClassDto>> getAll(param) async