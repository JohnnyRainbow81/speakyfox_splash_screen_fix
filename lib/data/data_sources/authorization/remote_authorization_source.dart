import 'package:speakyfox/data/dio_clients/authentication_client.dart';
import 'package:speakyfox/data/responses/authentication_response.dart';
import 'package:speakyfox/domain/models/authentication.dart';
import 'package:speakyfox/domain/repositories/authentication_repository.dart';

class RemoteAuthenticationSource implements AuthenticationRepository<AuthenticationResponse> {
  final AuthenticationClient _authenticationClient;

  RemoteAuthenticationSource(this._authenticationClient);

  @override
  Future<AuthenticationResponse> login(String username, String password, String grantType) async {
    return  _authenticationClient.login(username, password, grantType);
  }

  @override
  Future<AuthenticationResponse> register (
      String userName, String email, String password, String mobileNumber, String profilePicture)async{
    throw UnimplementedError();
  }
}
