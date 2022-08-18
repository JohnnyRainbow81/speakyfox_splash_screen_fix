// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:speakyfox/app/connectivity_service.dart';
import 'package:speakyfox/app/error_handling/error_handler.dart';
import 'package:speakyfox/app/error_handling/exceptions_ui.dart';
import 'package:speakyfox/data/local_sources/authentication_local_source.dart';
import 'package:speakyfox/data/mappers/ticket_mapper.dart';
import 'package:speakyfox/data/mappers/user_mapper.dart';
import 'package:speakyfox/data/remote_clients/authentication_client.dart';
import 'package:speakyfox/data/requests/reset_password_body.dart';
import 'package:speakyfox/data/requests/send_password_reset_body.dart';
import 'package:speakyfox/domain/models/lecture.dart';
import 'package:speakyfox/domain/models/ticket.dart';
import 'package:speakyfox/domain/models/user.dart';
import 'package:speakyfox/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final ConnectivityService _connectivityService;
  final AuthenticationClient _authenticationClient;
  final AuthenticationLocalSource _authenticationLocalSource;

  AuthenticationRepositoryImpl(
    this._authenticationClient,
    this._authenticationLocalSource,
    this._connectivityService,
  );

  @override
  Future<Ticket> accessToken(String username, String password, String grantType) async {
    //Try to load from local source
    try {
      Ticket ticket = await _authenticationLocalSource.loadTicket();
      return ticket;
    } catch (cacheError) {
      //Not stored locally? get from backend
      if (await _connectivityService.hasConnection()) {
        try {
          final response = await _authenticationClient.accessToken(username, password, grantType);
          _authenticationLocalSource.saveTicket(response); //store locally
          return response.toTicket();
        } catch (error) {
          ErrorHandler.handleError(error);
        }
      } else {
        throw NoInternetConnectionUIException();
      }
    }
    throw LoginNotSuccessfulException();
  }

  @override
  Future<Ticket> refreshToken(String refreshToken, String grantType) async {
    //more logic here
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _authenticationClient.refreshToken(refreshToken, grantType);
        if (response.code.statusCode == HttpStatus.ok) {
          return response.data.toTicket();
        } else {
          throw LoginNotSuccessfulException(
              description: "Sorry, we couldn't refresh your Login. Please try to Login again.");
        }
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }
    throw LoginNotSuccessfulException();
  }

  @override
  Future<bool> sendPasswordResetEmail(SendPasswordResetBody body) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _authenticationClient.sendPasswordResetEmail(body);
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
  Future<bool> resetPassword(String userId, ResetPasswordBody body) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _authenticationClient.resetPassword(userId, body);
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
    try {
      final User user = await _authenticationLocalSource.loadUser();
      return user;
    } catch (cacheError) {
      if (await _connectivityService.hasConnection()) {
        try {
          final response = await _authenticationClient.fetchUser(authToken);
          _authenticationLocalSource.saveUser(response.data);
          return response.data.toUser();
        } catch (error) {
          ErrorHandler.handleError(error);
        }
      } else {
        //No internet
        //get from Cache?
        throw NoInternetConnectionUIException();
      }
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
}
