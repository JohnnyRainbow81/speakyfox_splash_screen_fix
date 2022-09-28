import 'dart:io';
import 'package:dio/dio.dart' hide Response, Headers;
import 'package:retrofit/http.dart';
import 'package:speakyfox/app/constants.dart';
import 'package:speakyfox/data/dtos/response.dart';
import 'package:speakyfox/data/dtos/ticket_dto.dart';
import 'package:speakyfox/data/dtos/user_dto.dart';
import 'package:speakyfox/data/requests/create_user_request.dart';
import 'package:speakyfox/data/requests/reset_password_body.dart';
import 'package:speakyfox/data/requests/send_password_reset_body.dart';

part 'authentication_client.g.dart';

@RestApi()
abstract class AuthenticationClient {
  factory AuthenticationClient(Dio dio, {String baseUrl}) = _AuthenticationClient;

  @POST("/users")
  @Headers(<String, dynamic>{"Content-type": "application/json"})
  Future<Response<UserDto>> register(@Body() CreateProfileUserRequest user);

  @GET("/users/me")
  @Headers({"Content-Type": "application/json"})
  Future<Response<UserDto>> fetchUser(@Header(HttpHeaders.authorizationHeader) String token);

  @PATCH("/users/{userId}/password-reset")
  Future<Response<bool>> resetPassword(@Path("userId") String userId, @Body() ResetPasswordBody body);

  @POST("/users/password-reset")
  @Headers({"Content-Type": "application/json"})
  Future<Response<bool>> sendPasswordResetEmail(@Body() SendPasswordResetBody body);

  @POST("/users/{userId}/confirm-email")
  Future<Response<bool>> validateToken(@Path("userId") String userId, @Body() token);

  @GET(Constants.urlAGBs)
  @Headers(<String, dynamic>{"Content-type": "text/html"})
  Future<Response<String>> fetchAGBs();

  @GET(Constants.urlAGBs)
  @Headers(<String, dynamic>{"Content-type": "text/html"})
  Future<Response<String>> fetchDataProtection();
}


// Future<T> accessToken(
//     String username,
//     String password,
//     String grantType,
//   );
//   Future<RT> refreshToken(String refreshToken, String grantType);

//   Future<RU> fetchUser(String authToken);

//   Future<RR> resetPassword(String userId, ResetPasswordBody body);
//   Future<RR> sendPasswordResetEmail(String body);

//   Future<RL> getLastLecture(String lectureId);
//   Future<RL> setLastLecture(String lectureId);
