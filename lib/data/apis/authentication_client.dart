import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:speakyfox/app/constants.dart';
import 'package:speakyfox/app/environment.dart';
import 'package:speakyfox/data/responses/authentication_response.dart';
import 'package:speakyfox/data/responses/forgot_password_response.dart';
part 'authentication_client.g.dart';

@RestApi(baseUrl: Constants.baseUrlAuth )
abstract class AuthenticationClient {
  factory AuthenticationClient(Dio dio, {String baseUrl}) = _AuthenticationClient;

  @POST("/connect/token")
  Future<AuthenticationResponse> login(
    @Field("username") String username,
    @Field("password") String password,
    @Field("grant_type") String grantType,
  );

  @POST("/customer/forgotPassword")
  Future<ForgotPasswordResponse> forgotPassword(@Field("email") String email);

  @POST("/customer/register")
  Future<AuthenticationResponse> register(
      @Field("country_mobile_code") String countryCode,
      @Field("user_name") String userName,
      @Field("email") String email,
      @Field("password") String password,
      @Field("mobile_number") String mobileNumber,
      @Field("profile_picture") String profilePicture,
      );

  // @GET("/home")
  // Future<HomeResponse> getHome();

  // @GET("/storeDetails/{id}")
  // Future<StoreDetailsResponse> getStoreDetails(@Path("id") int id);
}
