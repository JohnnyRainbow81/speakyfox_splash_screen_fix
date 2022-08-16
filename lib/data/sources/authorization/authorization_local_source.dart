import 'package:speakyfox/data/responses/authentication_response.dart';
import 'package:speakyfox/data/responses/user_response.dart';
import 'package:speakyfox/domain/repositories/authentication_repository.dart';

class AuthenticationLocalSource implements AuthenticationRepository<AuthenticationResponse, UserResponse, ResetPasswordResponse> {
  @override
  Future<AuthenticationResponse> fetchAccessToken(String username, String password, String grantType) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<AuthenticationResponse> register(String userName, String email, String password, String mobileNumber, String profilePicture) {
    // TODO: implement register
    throw UnimplementedError();
  }

    @override
  Future<ResetPasswordResponse> resetPassword(String email) async {
   throw UnimplementedError();
  }

  @override
  Future<UserResponse> fetchMe(String authToken) async {
   throw UnimplementedError();
  }
}