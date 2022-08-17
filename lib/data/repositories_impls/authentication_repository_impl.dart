// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:speakyfox/app/connectivity_service.dart';
import 'package:speakyfox/app/error_handling/error_handler.dart';
import 'package:speakyfox/app/error_handling/exceptions_ui.dart';
import 'package:speakyfox/data/mappers/ticket_mapper.dart';
import 'package:speakyfox/data/mappers/user_mapper.dart';
import 'package:speakyfox/data/requests/reset_password_body.dart';
import 'package:speakyfox/data/sources/authorization/authentication_remote_source.dart';
import 'package:speakyfox/domain/models/lecture.dart';
import 'package:speakyfox/domain/models/ticket.dart';
import 'package:speakyfox/domain/models/user.dart';
import 'package:speakyfox/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository<Ticket, Ticket, User, Lecture, bool> {
  final ConnectivityService _connectivityService; //A, U, L, R
  final AuthenticationRemoteSource _authenticationRemoteSource;

  AuthenticationRepositoryImpl(
    this._authenticationRemoteSource,
    this._connectivityService,
  );

  @override
  Future<Ticket> accessToken(String username, String password, String grantType) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _authenticationRemoteSource.accessToken(username, password, grantType);
        return response.toTicket();
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
  Future<Ticket> refreshToken(String refreshToken, String grantType) async {
    //more logic here
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _authenticationRemoteSource.refreshToken(refreshToken, grantType);
        return response.data.toTicket();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }
    throw LoginNotSuccessfulException();
  }

  @override
  Future<bool> resetPassword(String userId, ResetPasswordBody body) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _authenticationRemoteSource.resetPassword(userId, body);
        if (response.code.statusCode == HttpStatus.ok) {
          return response.data;
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
  Future<User> fetchUser(String authToken) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _authenticationRemoteSource.fetchUser(authToken);
        return response.data.toUser();
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
  Future<Lecture> getLastLecture(String lectureId) {
    // TODO: implement getLastLecture
    throw UnimplementedError();
  }

  @override
  Future<Lecture> setLastLecture(String lectureId) {
    // TODO: implement setLastLecture
    throw UnimplementedError();
  }

  @override
  Future<bool> sendPasswordResetEmail(String body) {
    // TODO: implement sendPasswordResetEmail
    throw UnimplementedError();
  }
}
