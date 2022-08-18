import 'dart:io';

import 'package:retrofit/http.dart';
import 'package:dio/dio.dart' hide Response;
import 'package:speakyfox/app/constants.dart';
import 'package:speakyfox/data/requests/reset_password_body.dart';
import 'package:speakyfox/data/requests/send_password_reset_body.dart';
import 'package:speakyfox/data/responses/response.dart';
import 'package:speakyfox/data/responses/ticket_response.dart';
import 'package:speakyfox/data/responses/user_response.dart';
part 'authentication_client.g.dart';

@RestApi()
abstract class AuthenticationClient {
  factory AuthenticationClient(Dio dio, {String baseUrl}) = _AuthenticationClient;

  //Overwrites base url because the token-requests go to auth server and NOT to v1 server
  @POST("${Constants.baseUrlAuth}connect/token")
  Future<TicketResponse> accessToken(
    @Field("username") String username,
    @Field("password") String password,
    @Field("grant_type") String grantType,
  );

  //Overwrites base url because the token-requests go to auth server and NOT to v1 server
  @POST("${Constants.baseUrlAuth}connect/token")
  Future<Response<TicketResponse>> refreshToken(
      @Field("refresh_token") String refreshToken, @Field("grant_type") String grantType);

  @GET("/users/me")
  Future<Response<UserResponse>> fetchUser(@Header(HttpHeaders.authorizationHeader) String token);

  @PATCH("/users/{userId}/password-reset")
  Future<Response<bool>> resetPassword(@Path("userId") String userId, @Body() ResetPasswordBody body);

  @POST("/users/password-reset")
  Future<Response<bool>> sendPasswordResetEmail(@Body() SendPasswordResetBody body);

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