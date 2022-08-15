import 'package:speakyfox/data/dio_clients/user_client.dart';
import 'package:speakyfox/data/responses/authentication_response.dart';
import 'package:speakyfox/data/responses/user_response.dart';
import 'package:speakyfox/domain/repositories/user_repository.dart';

class RemoteUserSource implements UserRepository<UserResponse, ResetPasswordResponse> {
  UserClient _userClient;

  RemoteUserSource(this._userClient);

  @override
  Future<ResetPasswordResponse> resetPassword(String email) async {
    return _userClient.resetPassword(email);
  }

  @override
  Future<UserResponse> getMe(String authToken) async {
   return _userClient.getMe("Bearer $authToken");
  }
}
