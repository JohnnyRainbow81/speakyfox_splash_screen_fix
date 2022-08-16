import 'package:speakyfox/data/dio_clients/authentication_client.dart';
import 'package:speakyfox/data/responses/authentication_response.dart';
import 'package:speakyfox/data/responses/user_response.dart';
import 'package:speakyfox/domain/models/authentication.dart';
import 'package:speakyfox/domain/repositories/authentication_repository.dart';

class AuthenticationRemoteSource implements AuthenticationRepository<AuthenticationResponse, UserResponse, ResetPasswordResponse> {
  final AuthenticationClient _authenticationClient;

  AuthenticationRemoteSource(this._authenticationClient);

  @override
  Future<AuthenticationResponse> fetchAccessToken(String username, String password, String grantType) async {
    return  _authenticationClient.getAccessToken(username, password, grantType);
  }

    @override
  Future<ResetPasswordResponse> resetPassword(String email) async {
    return _authenticationClient.resetPassword(email);
  }

  @override
  Future<UserResponse> fetchMe(String authToken) async {
   return _authenticationClient.getMe("Bearer $authToken");
  }
}
