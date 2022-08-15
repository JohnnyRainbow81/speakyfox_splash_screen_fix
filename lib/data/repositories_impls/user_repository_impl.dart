import 'dart:io';

import 'package:speakyfox/app/connectivity_service.dart';
import 'package:speakyfox/app/error_handling/error_handler.dart';
import 'package:speakyfox/app/error_handling/exceptions_ui.dart';
import 'package:speakyfox/data/data_sources/user/user_remote_source.dart';
import 'package:speakyfox/data/mappers/authentication_mapper.dart';
import 'package:speakyfox/data/mappers/user_mapper.dart';
import 'package:speakyfox/data/responses/authentication_response.dart';
import 'package:speakyfox/data/responses/user_response.dart';
import 'package:speakyfox/domain/models/authentication.dart';
import 'package:speakyfox/domain/models/user.dart';
import 'package:speakyfox/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository<User, ResetPassword> {
  final ConnectivityService _connectivityService;
  final RemoteUserSource _remoteUserSource;

  UserRepositoryImpl(this._connectivityService, this._remoteUserSource);

  @override
  Future<ResetPassword> resetPassword(String email) async {
    if (await _connectivityService.hasConnection()) {
      try {
        ResetPasswordResponse response = await _remoteUserSource.resetPassword(email);
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
  Future<User> getMe(String authToken) async {
    if (await _connectivityService.hasConnection()) {
      try {
        UserResponse response = await _remoteUserSource.getMe(authToken);
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
