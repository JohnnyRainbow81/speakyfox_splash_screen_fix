// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:speakyfox/app/connectivity_service.dart';
import 'package:speakyfox/app/error_handling/error_handler.dart';
import 'package:speakyfox/app/error_handling/exceptions_ui.dart';
import 'package:speakyfox/data/dtos/identity_token_dto.dart';
import 'package:speakyfox/data/dtos/ticket_dto.dart';
import 'package:speakyfox/data/dtos/user_dto.dart';
import 'package:speakyfox/data/local/authentication_local_source.dart';
import 'package:speakyfox/data/mappers/identity_token_mapper.dart';
import 'package:speakyfox/data/mappers/ticket_mapper.dart';
import 'package:speakyfox/data/mappers/user_mapper.dart';
import 'package:speakyfox/data/remote/authentication_client.dart';
import 'package:speakyfox/data/requests/authentication_body.dart';
import 'package:speakyfox/data/requests/create_user_request.dart';
import 'package:speakyfox/data/requests/refresh_token_body.dart';
import 'package:speakyfox/data/requests/reset_password_body.dart';
import 'package:speakyfox/data/requests/send_password_reset_body.dart';
import 'package:speakyfox/domain/models/identity_token.dart';
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
  Future<User> register(CreateProfileUserRequest user) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _authenticationClient.register(user /* username, password, grantType */);
        return response.data.toUser();
      } catch (error) {
        ErrorHandler.handleError(Errors.registrationFailed);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw LoginNotSuccessfulException();
  }

  @override
  Future<Ticket> accessToken(
      AuthenticationRequestBody body /* String username, String password, String grantType */) async {
    //Try to load from local source
    try {
      TicketDto ticket = _authenticationLocalSource.loadTicket();
      return ticket.toTicket();
    } catch (cacheError) {
      //Not stored locally? get from backend
      if (await _connectivityService.hasConnection()) {
        try {
          final response = await _authenticationClient.accessToken(body /* username, password, grantType */);
          _authenticationLocalSource.saveTicket(response); //store locally
          return response.toTicket();
        } catch (error) {
          ErrorHandler.handleError(Errors.userPasswordCoupleInvalid);
        }
      } else {
        throw NoInternetConnectionUIException();
      }
    }
    throw LoginNotSuccessfulException();
  }

  @override
  Future<Ticket> refreshToken(RefreshTokenBody body) async {
    //more logic here
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _authenticationClient.refreshToken(body);
        return response.toTicket();
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
        return response.data;
      } catch (error) {
        ErrorHandler.handleError(Errors.emailNotFound);
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
      final UserDto user = await _authenticationLocalSource.loadUser();
      return user.toUser();
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

  @override
  Future<bool> validateToken(String userId, String token) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _authenticationClient.validateToken(userId, token);
        bool success = response.data;
        return success;
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      //No internet
      //get from Cache?
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "AuthenticationRepositoryImpl.validateToken()");
  }

  @override
  IdentityToken? loadCredentials() {
    try {
      IdentityTokenDto? identityTokenDto = _authenticationLocalSource.loadCredentials();
      return identityTokenDto?.toIdentityToken();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> saveCredentials(IdentityToken identityToken) async {
    bool saved = await _authenticationLocalSource.saveCredentials(identityToken.toIdentityTokenDto());
    return saved;
  }

  @override
  Future<bool> clearCredentials() async {
    bool cleared = await _authenticationLocalSource.clearCredentials();
    return cleared;
  }

  @override
  User? loadUser() {
    try {
      final UserDto user = _authenticationLocalSource.loadUser();
      return user.toUser();
    } catch (cacheError) {
      return null;
    }
  }
}
