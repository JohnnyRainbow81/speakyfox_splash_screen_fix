// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/app/dependency_injection.dart';
import 'package:speakyfox/domain/services/authentication_service.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService;

  String _username = "";
  String _password = "";

  bool _isLoggedIn = false;

  LoginViewModel(
    this._authenticationService,
  );

  get isLoggedIn => _isLoggedIn;

  String? validateUsername(String? username) {
    if (username == null || username.isEmpty) {
      return 'Please enter a username';
    } else if (username.length < 4) {
      return "Too few characters";
    }
    _username = username;
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter a valid password';
    }
    _password = password;
    return null;
  }

  bool isLoginFormValid() {
    //TODO validation
    return _username.isNotEmpty && _password.isNotEmpty;
  }

  Future<bool> login() async {
    _isLoggedIn = await runBusyFuture(_authenticationService.login(_username, _password));
    //notifyListeners();
    return _isLoggedIn;
  }
}
