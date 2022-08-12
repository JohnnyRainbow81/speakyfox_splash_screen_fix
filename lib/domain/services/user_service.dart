// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/domain/models/user.dart';
import 'package:speakyfox/domain/repositories/user_repository.dart';
import 'package:speakyfox/domain/services/authentication_service.dart';

class UserService {
  final AuthenticationService _authenticationService;
  final UserRepository _userRepository;
  User? _me;

  UserService(
    this._authenticationService,
    this._userRepository,
  );

  User? get me {
    return _me;
  }

//This method is here because the API is different from Authentication
  Future<bool> getMe(String username, String password) async {
    await _authenticationService.login(username, password);
    User user = await _userRepository.getMe(_authenticationService.accessToken);
    _me = user;
    
    return true;
  }
}
