import 'dart:io';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:speakyfox/data/responses/authentication_response.dart';
import 'package:speakyfox/data/responses/user_response.dart';
part 'user_client.g.dart';

@RestApi()
abstract class UserClient {
  factory UserClient(Dio dio, {String baseUrl}) = _UserClient;

  @GET("/users/me")
  Future<UserResponse> getMe(@Header(HttpHeaders.authorizationHeader) String token);

  @POST("/users/password-reset")
  Future<ResetPasswordResponse> resetPassword(@Field("email") String email);

  // @POST("/users/register")
  // Future<AuthenticationResponse> register(
  //   @Field("country_mobile_code") String countryCode,
  //   @Field("user_name") String userName,
  //   @Field("email") String email,
  //   @Field("password") String password,
  //   @Field("mobile_number") String mobileNumber,
  //   @Field("profile_picture") String profilePicture,
  // );
}
