// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/app/dependency_injection.dart';
import 'package:speakyfox/app/error_handling/exceptions_ui.dart';
import 'package:speakyfox/domain/services/authentication_service.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService;

  String _username = "";
  String _password = "";

  String? _usernameError;
  String? _passwordError;

  String? get userNameError => _usernameError;
  String? get passwordError => _passwordError;

  bool _isLoggedIn = false;

  LoginViewModel(
    this._authenticationService,
  );

  bool get isLoggedIn => _isLoggedIn;

  void validateUsername(String? username) {
    if (username == null || username.isEmpty) {
      _usernameError = 'Bitte gib deinen Namen ein';
    } else if (username.length < 4) {
      _usernameError = "Der Name ist zu kurz";
    } else {
      _usernameError = null;
    }
    _username = username!;
    notifyListeners();
  }

  void validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      _passwordError = 'Gib bitte ein gültiges Passwort ein';
    } else {
      _passwordError = null;
    }
    _password = password!;
    notifyListeners();
  }

  bool isLoginFormValid() {
    //TODO validation
    return _username.isNotEmpty && _password.isNotEmpty;
  }

  Future<bool> login() async {
    FIXME not elegant! I use try/catch here because the backend gives 400 in case of wrong credentials instead of 403 
    Fix: Go to AuthRepo-Impl and throw manually a LoginNotSuccessfullException 
    try {
      _isLoggedIn = await _authenticationService.login(_username, _password);
      if (isLoggedIn) {
        notifyListeners();
      }
    } catch (e) {
      _isLoggedIn = false;
      setError(LoginNotSuccessfulException());
    }

    //notifyListeners();
    return _isLoggedIn;
  }
}
