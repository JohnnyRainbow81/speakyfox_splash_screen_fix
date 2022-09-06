import 'dart:io';

import 'package:retrofit/http.dart';
import 'package:dio/dio.dart' hide Response, Headers;
import 'package:speakyfox/app/constants.dart';
import 'package:speakyfox/data/requests/authentication_body.dart';
import 'package:speakyfox/data/requests/refresh_token_body.dart';
import 'package:speakyfox/data/requests/reset_password_body.dart';
import 'package:speakyfox/data/requests/send_password_reset_body.dart';
import 'package:speakyfox/data/dtos/response.dart';
import 'package:speakyfox/data/dtos/ticket_dto.dart';
import 'package:speakyfox/data/dtos/user_dto.dart';
part 'authentication_client.g.dart';

@RestApi()
abstract class AuthenticationClient {
  factory AuthenticationClient(Dio dio, {String baseUrl}) = _AuthenticationClient;

  //Overwrites base url because the token-requests go to auth server and NOT to v1 server
  @POST("${Constants.baseUrlAuth}connect/token")
  @Headers(<String, dynamic>{"Content-type": "application/x-www-form-urlencoded"})
  Future<TicketDto> accessToken(
    @Body() AuthenticationRequestBody body,
    // @Field("username") String username,
    // @Field("password") String password,
    // @Field("grant_type") String grantType,
  );

  //Overwrites base url because the token-requests go to auth server and NOT to v1 server
  @POST("${Constants.baseUrlAuth}connect/token")
  @Headers(<String, dynamic>{"Content-type": "application/x-www-form-urlencoded"})
  Future<TicketDto> refreshToken(
    @Body() RefreshTokenBody body,
  );

  @GET("/users/me")
  @Headers({"Content-Type" : "application/json"})
  Future<Response<UserDto>> fetchUser(@Header(HttpHeaders.authorizationHeader) String token);

  @PATCH("/users/{userId}/password-reset")
  Future<Response<bool>> resetPassword(@Path("userId") String userId, @Body() ResetPasswordBody body);

  @POST("/users/password-reset")
  Future<Response<bool>> sendPasswordResetEmail(@Body() SendPasswordResetBody body);

  @POST("/users/{userId}/confirm-email")
  Future<Response<bool>> validateToken(@Path("userId") String userId, @Body() token);
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
