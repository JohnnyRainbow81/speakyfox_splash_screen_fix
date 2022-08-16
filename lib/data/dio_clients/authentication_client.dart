import 'dart:io';

import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:speakyfox/app/constants.dart';
import 'package:speakyfox/data/responses/authentication_response.dart';
import 'package:speakyfox/data/responses/user_response.dart';
part 'authentication_client.g.dart';

@RestApi()
abstract class AuthenticationClient {
  factory AuthenticationClient(Dio dio, {String baseUrl}) = _AuthenticationClient;

 //Overwrites base url because this single request has another url than every other request in this class
  @POST("${Constants.baseUrlAuth}connect/token")
  Future<AuthenticationResponse> getAccessToken(
    @Field("username") String username,
    @Field("password") String password,
    @Field("grant_type") String grantType,
  );

  @GET("/users/me")
  Future<UserResponse> getMe(@Header(HttpHeaders.authorizationHeader) String token);

  @POST("/users/password-reset")
  Future<ResetPasswordResponse> resetPassword(@Field("email") String email);



}
