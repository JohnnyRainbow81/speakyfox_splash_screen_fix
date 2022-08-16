// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:speakyfox/app/connectivity_service.dart';
import 'package:speakyfox/app/error_handling/error_handler.dart';
import 'package:speakyfox/app/error_handling/exceptions_ui.dart';
import 'package:speakyfox/data/mappers/authentication_mapper.dart';
import 'package:speakyfox/data/mappers/user_mapper.dart';
import 'package:speakyfox/data/responses/authentication_response.dart';
import 'package:speakyfox/data/responses/user_response.dart';
import 'package:speakyfox/data/sources/authorization/authorization_remote_source.dart';
import 'package:speakyfox/domain/models/authentication.dart';
import 'package:speakyfox/domain/models/user.dart';
import 'package:speakyfox/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository<Authentication, User, ResetPassword> {
  final ConnectivityService _connectivityService;
  final AuthenticationRemoteSource _authenticationRemoteSource;

  AuthenticationRepositoryImpl(
    this._authenticationRemoteSource,
    this._connectivityService,
  );

  @override
  Future<Authentication> fetchAccessToken(String username, String password, String grantType) async {
    if (await _connectivityService.hasConnection()) {
      try {
        AuthenticationResponse response = await _authenticationRemoteSource.fetchAccessToken(username, password, grantType);
        return response.toAuthentication();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      //No internet
      //get from Cache?
      throw NoInternetConnectionUIException();
    }
    throw LoginNotSuccessfulException();
  }


  @override
  Future<ResetPassword> resetPassword(String email) async {
    if (await _connectivityService.hasConnection()) {
      try {
        ResetPasswordResponse response = await _authenticationRemoteSource.resetPassword(email);
        if (response.statusCode == HttpStatus.ok) {
          return response.toResetPassword();
        } else {
          throw ResetPasswordException();
        }
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      //No internet
      //get from Cache?
      throw NoInternetConnectionUIException();
    }
    throw UIException();
  }

  @override
  Future<User> fetchMe(String authToken) async {
    if (await _connectivityService.hasConnection()) {
      try {
        UserResponse response = await _authenticationRemoteSource.fetchMe(authToken);
        return response.toUser();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      //No internet
      //get from Cache?
      throw NoInternetConnectionUIException();
    }
    throw UIException();
  }
}
