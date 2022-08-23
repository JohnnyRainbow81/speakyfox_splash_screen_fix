import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:speakyfox/domain/repositories/entity_repository.dart';
//part 'entity_client.g.dart';

abstract class EntityClient<T> /* implements EntityRepository */ {
  //factory EntityClient(Dio dio, {String baseUrl}) = _EntityClient;
  
  //@override
  @GET("")
  Future<List<T>> getAll(String param);

  //@override
  @GET("")
  Future<T> getById(@Query("id") String id);

  //@override
  @POST("")
  Future<T> post(dynamic entity);

  //@override
  @PATCH("")
  Future<T> patchById(@Query("id") String id, @Body() T entity);

  //@override
  @DELETE("")
  Future<bool> removeById(@Query("id") String id);
}

