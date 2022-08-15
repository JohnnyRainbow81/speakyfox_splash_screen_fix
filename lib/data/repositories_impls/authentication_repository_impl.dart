// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:speakyfox/app/connectivity_service.dart';
import 'package:speakyfox/app/error_handling/error_handler.dart';
import 'package:speakyfox/app/error_handling/exceptions_ui.dart';
import 'package:speakyfox/data/mappers/authentication_mapper.dart';
import 'package:speakyfox/data/responses/authentication_response.dart';
import 'package:speakyfox/data/sources/authorization/authorization_remote_source.dart';
import 'package:speakyfox/domain/models/authentication.dart';
import 'package:speakyfox/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository<Authentication> {
  final ConnectivityService _connectivityService;
  final AuthenticationRemoteSource _authenticationRemoteSource;

  AuthenticationRepositoryImpl(
    this._authenticationRemoteSource,
    this._connectivityService,
  );

  @override
  Future<Authentication> login(String username, String password, String grantType) async {
    if (await _connectivityService.hasConnection()) {
      try {
        AuthenticationResponse response = await _authenticationRemoteSource.login(username, password, grantType);
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
  Future<Authentication> register(
      String userName, String email, String password, String mobileNumber, String profilePicture) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
