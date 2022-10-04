import 'package:retrofit/retrofit.dart';
import 'package:speakyfox/data/dtos/response.dart';

//This BaseClient<T> can only be used as a Mixin for the concrete clients, because the code generator doesn't seem to be able 
//to handle something like  
//
//CouponClient extends BaseClient<CouponDto>   // = regular inheritance
//
//Only 
//CouponClient with BaseClient<CouponDto>  // = mixin
//
//seems to work.
//
//Unfortunately with Mixins and the predefined factory method to auto generate the implementation we cannot 
//forward the path - snippet (like "/coupons") to the BaseClient. So we need to specify the full URL (baseurl + path) in
//the dependency injection part (see dependency_injection.dart), which makes the HTTP calls less flexible.

abstract class BaseClient<T> {
  @GET("")
  Future<Response<List<T>>> getAll(@Query("") String param);

  @GET("/{id}")
  Future<Response<T>> getById(@Path("id") String id);

  @POST("")
  Future<Response<T>> post(@Body() dynamic entity); //FIXME Linter wants "dynamic" instead of "T" here?!

  @PATCH("")
  Future<Response<T>> patchById(
      @Query("id") String id, @Body() dynamic entity); //FIXME Linter wants "dynamic" instead of "T" here?!

  @DELETE("")
  Future<Response<bool>> removeById(@Query("id") String id);
}
