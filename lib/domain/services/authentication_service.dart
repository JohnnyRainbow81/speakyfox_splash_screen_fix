// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/domain/models/authentication.dart';
import 'package:speakyfox/domain/models/user.dart';
import 'package:speakyfox/domain/repositories/authentication_repository.dart';

enum GrantType { password }

//Only class to communicate with Auth Server
class AuthenticationService {
  String username = "";
  String password = "";
  int _expirationTimestamp = -1;
  User? _me;

  late Authentication _authentication;

  final AuthenticationRepository _authenticationRepository;

  AuthenticationService(
    this._authenticationRepository,
  );

  String get accessToken {
    //check if valid here?
    return _authentication.accessToken;
  }

  Future<void> _fetchAccessToken(String username, String password) async {
    if (isLoginValid()) return;

    _authentication = await _authenticationRepository.fetchAccessToken(username, password, GrantType.password.name);
    _expirationTimestamp = (DateTime.now().millisecondsSinceEpoch / 1000).floor() + _authentication.expiresIn;
  }

  Future<bool> login(String username, String password) async {
    await _fetchAccessToken(username, password);
    User user = await _authenticationRepository.fetchMe(accessToken);
    _me = user;

    return true;
  }

  bool isLoginValid() {
    if (username.isEmpty || password.isEmpty) return false;
    if (_expirationTimestamp < 0) return false;
    if (_expirationTimestamp < DateTime.now().millisecondsSinceEpoch) return false;

    return true;
  }

  Future<bool> sendPasswordResetEmail(String email) async {
    return false;
  }

  bool hasRole() {
    return false;
  }
}
