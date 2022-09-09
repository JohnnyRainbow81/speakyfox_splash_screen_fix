// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/app/utilities.dart';
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

  bool _isLoggedIn = false;
  bool _isResetEmailSent = false;
  bool _isAGB_accepted = false;
  bool _isDataProtectionAccepted = false;

  Function? _allRegistrationInputsAreValidCallback;

  AuthenticationViewModel(
    this._authenticationService,
  ) {
    _username = _authenticationService.getCredentials()?.user.firstName ?? "";
    _password = _authenticationService.getCredentials()?.user.password ?? "";
    _email = _authenticationService.getCredentials()?.user.email ?? "";
  }

  set allRegistrationInputsAreValid(Function? callback) {
    _allRegistrationInputsAreValidCallback = callback;
  }

  String get email => _email;
  String get password => _password;
  String get username => _username;

  bool get isLoggedIn => _isLoggedIn;
  bool get isResetEmailSent => _isResetEmailSent;
  bool get isAGB_accepted => _isAGB_accepted;
  bool get isDataProtectionAccepted => _isDataProtectionAccepted;

  void validateUsername(String? username) {
    if (username == null || username.isEmpty) {
      _usernameError = 'Bitte gib deinen Namen oder deine E-Mail Adresse ein';
    } else if (username.length < 3) {
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

  void toggleAGB_accepted() {
    _isAGB_accepted = !_isAGB_accepted;
    notifyListeners();
  }

  void toggleDataProtectionAccepted() {
    _isDataProtectionAccepted = !_isDataProtectionAccepted;
    notifyListeners();
  }

  bool get isLoginFormValid {
    //if one of these is not empty means, it has successfully passed validation
    return _email.isNotEmpty && _password.isNotEmpty && _emailError == null && _passwordError == null;
  }

  bool get isRegisterFormValid {
    bool isAllValid = _username.isNotEmpty &&
        _password.isNotEmpty &&
        _email.isNotEmpty &&
        _usernameError == null &&
        _passwordError == null &&
        _emailError == null &&
        _isAGB_accepted == true &&
        _isDataProtectionAccepted == true;

    if (isAllValid) {
      if (_allRegistrationInputsAreValidCallback != null) {
        _allRegistrationInputsAreValidCallback!();
      }
    }

    return isAllValid;
  }

  bool get isEmailFormValid {
    //validation is already done here
    return email.isNotEmpty;
  }

  Future<bool> login() async {
    bool? success = false;
    //FIXME "type 'Null' is not a subtype of type 'bool' in type cast" > Error from stacked library doesn't return "false" but "null" so we need to make the return type nullable
    success = await runBusyFuture<bool?>(_authenticationService.login(_email, _password));
    _isLoggedIn = success ?? false;
    if (isLoggedIn) {
      notifyListeners();
    }
    return _isLoggedIn;
  }

  Future<bool> sendResetEmail() async {
    //FIXME "type 'Null' is not a subtype of type 'bool' in type cast" > Error from stacked library doesn't return "false" but "null" so we need to make the return type nullable
    bool? success = false;
    //Mock for testing
    //success = await runBusyFuture<bool?>(_authenticationService.sendPasswordResetEmail(SendPasswordResetBody(email: _email)));
    success = true; //delete
    _isResetEmailSent = success ?? false;
    if (_isResetEmailSent) {
      notifyListeners();
    }
    return _isResetEmailSent;
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