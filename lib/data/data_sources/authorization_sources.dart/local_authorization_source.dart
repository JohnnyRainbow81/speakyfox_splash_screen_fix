import 'package:speakyfox/data/responses/authentication_response.dart';
import 'package:speakyfox/domain/repositories/authentication_repository.dart';

class LocalAuthenticationSource implements AuthenticationRepository<AuthenticationResponse> {
  @override
  Future<AuthenticationResponse> login(String username, String password, String grantType) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<AuthenticationResponse> register(String userName, String email, String password, String mobileNumber, String profilePicture) {
    // TODO: implement register
    throw UnimplementedError();
  }

}