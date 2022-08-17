import 'dart:io';

import 'package:retrofit/http.dart';
import 'package:dio/dio.dart' hide Response;
import 'package:speakyfox/app/constants.dart';
import 'package:speakyfox/data/requests/reset_password_body.dart';
import 'package:speakyfox/data/responses/response.dart';
import 'package:speakyfox/data/responses/ticket_response.dart';
import 'package:speakyfox/data/responses/user_response.dart';
part 'authentication_client.g.dart';

@RestApi()
abstract class AuthenticationClient {
  factory AuthenticationClient(Dio dio, {String baseUrl}) = _AuthenticationClient;

  //Overwrites base url because this single request has another url than every other request in this class
  @POST("${Constants.baseUrlAuth}connect/token")
  Future<Response<TicketResponse>> accessToken(
    @Field("username") String username,
    @Field("password") String password,
    @Field("grant_type") String grantType,
  );

  @POST("${Constants.baseUrlAuth}connect/token")
  Future<Response<TicketResponse>>  refreshToken(
      @Field("refresh_token") String refreshToken, @Field("grant_type") String grantType);

  @GET("/users/me")
  Future<Response<UserResponse>> fetchMe(@Header(HttpHeaders.authorizationHeader) String token);

  @PATCH("/users/{userId}/password-reset")
  Future<Response<bool>>  resetPassword(@Path("userId") String userId, @Body() ResetPasswordBody body);
}
