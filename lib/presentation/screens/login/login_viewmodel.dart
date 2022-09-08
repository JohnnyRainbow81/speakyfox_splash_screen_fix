// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/app/error_handling/exceptions_ui.dart';
import 'package:speakyfox/app/utilities.dart';
import 'package:speakyfox/data/requests/send_password_reset_body.dart';
import 'package:speakyfox/domain/services/authentication_service.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService;

  String _username = "";
  String _password = "";
  String _email = "";

  String? _usernameError;
  String? _passwordError;
  String? _emailError;

  String? get userNameError => _usernameError;
  String? get passwordError => _passwordError;
  String? get emailError => _emailError;

  bool _isLoggedIn = false;

  Function? _allInputsAreValidCallback;

  LoginViewModel(
    this._authenticationService,
  );

  set allInputsAreValid(Function? callback) {
    _allInputsAreValidCallback = callback;
  }

  bool get isLoggedIn => _isLoggedIn;

  void validateUsername(String? username) {
    if (username == null || username.isEmpty) {
      _usernameError = 'Bitte gib deinen Namen oder deine E-Mail Adresse ein';
    } else if (username.length < 8) {
      _usernameError = "Der Name ist zu kurz";
    } else {
      _usernameError = null;
      _username = username;
    }
    notifyListeners();
  }

  void validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      _passwordError = 'Bitte gib ein gültiges Passwort ein';
      //TODO Validation logic
    } else if (!isValidPassword(password)) {
      _passwordError =
          'Das Passwort muss mindestens \n einen Großbuchstaben,\n einen Kleinbuchstaben, \n eine Zahl, \n ein Sonderzeichen \n und mindestens 8 Zeichen enthalten';
    } else {
      _passwordError = null;
      _password = password;
    }
    notifyListeners();
  }

  void validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      _emailError = 'Gib bitte eine gültige Email-Adresse ein';
    } else if (!isValidEmail(email)) {
      _emailError = 'Das Format der Emailadresse stimmt nicht';
    } else {
      _emailError = null;
      _email = email;
    }
    notifyListeners();
  }

  bool get isLoginFormValid {
    //TODO validation
    return _email.isNotEmpty && _password.isNotEmpty && _emailError == null && _passwordError == null;
  }

  bool get isRegisterFormValid {
    bool isAllValid = _username.isNotEmpty &&
        _password.isNotEmpty &&
        _email.isNotEmpty &&
        _usernameError == null &&
        _passwordError == null &&
        _emailError == null;
    if (isAllValid) {
      if (_allInputsAreValidCallback != null) {
        _allInputsAreValidCallback!();
      }
    }

    return isAllValid;
  }

  bool get isEmailValid {
    return _email.isNotEmpty;
  }

  Future<bool> login() async {
    // FIXME not elegant! I use try/catch here because the backend gives 400 in case of wrong credentials instead of 403
    //  Fix: Go to AuthRepo-Impl and throw manually a LoginNotSuccessfullException
    try {
      setBusy(true);
      _isLoggedIn = await _authenticationService.login(_email, _password);
      setBusy(false);
      if (isLoggedIn) {
        notifyListeners(); //eventually redundant
      }
    } catch (e) {
      _isLoggedIn = false;
      setError(LoginNotSuccessfulException());
    } finally {
      setBusy(false);
    }
    return _isLoggedIn;
  }

  Future<bool> sendEmail() async {
    return _authenticationService.sendPasswordResetEmail(SendPasswordResetBody(email: _email));
  }

  Future<bool> register() async {
    throw UnimplementedError();
  }

  void resetAllFields() {
    _username = "";
    _password = "";
    _email = "";
    _passwordError = null;
    _usernameError = null;
    _emailError = null;
    _isLoggedIn = false;
  }
}
