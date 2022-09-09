// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/app/error_handling/exceptions_ui.dart';
import 'package:speakyfox/app/utilities.dart';
import 'package:speakyfox/data/requests/send_password_reset_body.dart';
import 'package:speakyfox/domain/services/authentication_service.dart';
import 'package:stacked/stacked.dart';

class AuthenticationViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService;

  late String _username;
  late String _password;
  late String _email;

  String? _usernameError;
  String? _passwordError;
  String? _emailError;

  String? get userNameError => _usernameError;
  String? get passwordError => _passwordError;
  String? get emailError => _emailError;

  bool? _isLoggedIn = false;

  Function? _allInputsAreValidCallback;

  AuthenticationViewModel(
    this._authenticationService,
  ) {
    _username = _authenticationService.getCredentials()?.user.firstName ?? "";
    _password = _authenticationService.getCredentials()?.user.password ?? "";
    _email = _authenticationService.getCredentials()?.user.email ?? "";
  }

  set allInputsAreValid(Function? callback) {
    _allInputsAreValidCallback = callback;
  }

  String get email => _email;
  String get password => _password;
  String get username => _username;

  bool get isLoggedIn => _isLoggedIn ?? false;

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

  bool get isEmailFormValid {
    //validation is already done here
    return email.isNotEmpty;
  }

  Future<bool> login() async {
        //FIXME type 'Null' is not a subtype of type 'bool' in type cast > Error from stacked library so we need to make the result nullable   
    _isLoggedIn = await runBusyFuture<bool?>(_authenticationService.login(_email, _password));
    if (isLoggedIn) { //redundant?
      notifyListeners();
    } else {
      _isLoggedIn = false;
    }
    return _isLoggedIn ?? false;
  }

  Future<bool?> sendResetEmail() async {
    //FIXME type 'Null' is not a subtype of type 'bool' in type cast > Error from stacked library so we need to make the result nullable    

    return runBusyFuture<bool?>(_authenticationService.sendPasswordResetEmail(SendPasswordResetBody(email: _email)));
  }

  Future<bool> register() async {
    throw UnimplementedError();
  }

  void reset() {
    _passwordError = null;
    _usernameError = null;
    _emailError = null;
    _isLoggedIn = false;
  }
}
