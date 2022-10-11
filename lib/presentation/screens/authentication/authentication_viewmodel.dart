// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as htmlparser;
import 'package:speakyfox/app/constants.dart';
import 'package:speakyfox/app/utilities.dart';
import 'package:speakyfox/data/requests/create_user_request.dart';
import 'package:speakyfox/data/requests/send_password_reset_body.dart';
import 'package:speakyfox/domain/services/authentication_service.dart';
import 'package:speakyfox/presentation/common/resources/text_assets.dart';
import 'package:stacked/stacked.dart';

import '../../../domain/models/user.dart';

enum AuthMode { login, registration, resetEmail }

//ONE Viewmodel for ALL authentication-screens to have a single source for repeating & related data and logic
class AuthenticationViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService;

  late String _usernameRegistration;
  late String _emailRegistration;
  late String _passwordRegistration;

  late String _emailLogin;
  late String _passwordLogin;

  dom.Document? _AGBsHTML;
  dom.Document? _dataProtectionHTML;

  String? _usernameRegistrationError;
  String? _emailRegistrationError;
  String? _passwordRegistrationError;

  String? _emailLoginError;
  String? _passwordLoginError;

  bool _isRegistrationEmailSent = false;
  bool _isResetEmailSent = false;
  bool _isAGB_accepted = false;
  bool _isDataProtectionAccepted = false;
  bool _stayLoggedIn = false;
  bool _canSendEmail = true;
  bool _hasTextFieldFocus = false;

  int _waitTime = Constants.emailResendDelay;

  AuthenticationViewModel(
    this._authenticationService,
  ) {
    User? user = _authenticationService.getUser();

    _usernameRegistration = "";
    _emailRegistration = "";
    _passwordRegistration = "";

    _emailLogin = user?.email ?? "";
    _passwordLogin = "";

    loadAGBs();
    loadDataProtection();
  }

  set hasTextFieldFocus(bool value) {
    _hasTextFieldFocus = value;
    notifyListeners();
  }

  String get usernameRegistration => _usernameRegistration;
  String get emailRegistration => _emailRegistration;
  String get passwordRegistration => _passwordRegistration;

  String get emailLogin => _emailLogin;
  String get passwordLogin => _passwordLogin;

  String? get usernameRegistrationError => _usernameRegistrationError;
  String? get passwordRegistrationError => _passwordRegistrationError;
  String? get emailRegistrationError => _emailRegistrationError;

  String? get passwordLoginError => _passwordLoginError;
  String? get emailLoginError => _emailLoginError;

  bool get isLoggedIn => _authenticationService.isAuthenticated();
  bool get isResetEmailSent => _isResetEmailSent;
  bool get isAGB_accepted => _isAGB_accepted;
  bool get isDataProtectionAccepted => _isDataProtectionAccepted;
  bool get stayLoggedIn => _stayLoggedIn;
  bool get isRegistrationEmailSent => _isRegistrationEmailSent;
  bool get canSendEmail => !isBusy && _canSendEmail;

  bool get hasTextFieldFocus => _hasTextFieldFocus;

  dom.Document? get AGBsHTML => _AGBsHTML;
  dom.Document? get dataProtectionHTML => _dataProtectionHTML;

  String get waitTime => _waitTime.toString();

  void validateUsernameRegistration(String username) {
    if (username.isEmpty) {
      _usernameRegistrationError = 'Bitte gib deinen Namen oder deine E-Mail Adresse ein';
    } else if (username.length < 3) {
      _usernameRegistrationError = "Der Name ist zu kurz";
    } else {
      _usernameRegistrationError = null;
    }
    _usernameRegistration = username;
    notifyListeners();
  }

  void validatePasswordRegistration(String password) {
    if (password.isEmpty) {
      _passwordRegistrationError = 'Bitte such dir ein gültiges Passwort aus';
    } else if (!isValidPassword(password)) {
      _passwordRegistrationError =
          'Das Passwort muss mindestens \n einen Großbuchstaben,\n einen Kleinbuchstaben, \n eine Zahl, \n ein Sonderzeichen \n und mindestens 8 Zeichen enthalten';
    } else {
      _passwordRegistrationError = null;
      _passwordRegistration = password;
    }
    notifyListeners();
  }

  void validatePasswordLogin(String password) {
    if (password.isEmpty) {
      _passwordLoginError = 'Bitte gib dein Passwort ein';
    } else if (!isValidPassword(password)) {
      _passwordLoginError =
          'Dein Passwort besteht mindestens \n einen Großbuchstaben,\n einen Kleinbuchstaben, \n eine Zahl, \n ein Sonderzeichen \n und mindestens 8 Zeichen';
    } else {
      _passwordLoginError = null;
      _passwordLogin = password;
    }
    notifyListeners();
  }

  void validateEmailRegistration(String email) {
    if (email.isEmpty) {
      _emailRegistrationError = 'Gib bitte eine gültige Email-Adresse ein';
    } else if (!isValidEmail(email)) {
      _emailRegistrationError = 'Das Format der Emailadresse stimmt nicht';
    } else {
      _emailRegistrationError = null;
    }
    _emailRegistration = email;
    notifyListeners();
  }

  void validateEmailLogin(String email) {
    if (email.isEmpty) {
      _emailLoginError = 'Gib bitte deine Email-Adresse ein';
    } else if (!isValidEmail(email)) {
      _emailLoginError = 'Das Format der Emailadresse stimmt nicht';
    } else {
      _emailLoginError = null;
    }
    _emailLogin = email;
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

  void toggleStayLoggedIn() {
    _stayLoggedIn = !_stayLoggedIn;
    notifyListeners();
  }

  bool get isLoginFormValid {
    //if all input strings are not empty and all error strings are null(the textfield api needs them as 'null' to show visual error indications), the form is valid.
    return _emailLogin.isNotEmpty &&
        _passwordLogin.isNotEmpty &&
        _emailLoginError == null &&
        _passwordLoginError == null;
  }

  bool get isRegisterFormValid {
    return _usernameRegistration.isNotEmpty &&
        _passwordRegistration.isNotEmpty &&
        _emailRegistration.isNotEmpty &&
        _usernameRegistrationError == null &&
        _passwordRegistrationError == null &&
        _emailRegistrationError == null &&
        _isAGB_accepted == true &&
        _isDataProtectionAccepted == true;
  }

  //email validation has already been done at this point. "valid" then means, that
  //the email string has been assigned a valid value that satisfies all email address criterias
  bool get isEmailLoginFormValid => emailLogin.isNotEmpty;

  bool get isEmailRegistrationFormValid => emailRegistration.isNotEmpty;

  bool isAlreadyLoggedIn() => _authenticationService.isAuthenticated();

  Future<void> login() async {
    await runBusyFuture<bool?>(_authenticationService.login(_emailLogin, _passwordLogin));
    if (_authenticationService.isAuthenticated()) {
      _resetInputs();
      notifyListeners();
    }
  }

  Future<void> sendResetEmail() async {
    _canSendEmail = false;
    //FIXME "type 'Null' is not a subtype of type 'bool' in type cast" > Error from stacked library doesn't return "false" but "null" so we need to make the return type nullable
    bool? success = false;
    //Better mock this call for testing
    success = await runBusyFuture<bool?>(
        _authenticationService.sendPasswordResetEmail(SendPasswordResetBody(email: _emailLogin)));

    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        _waitTime--;
        if (_waitTime <= 0) {
          timer.cancel();
          _canSendEmail = true;
          _waitTime = Constants.emailResendDelay;
          _isResetEmailSent = false;
        }
        notifyListeners();
      },
    );

    _isResetEmailSent = success ?? false;

    if (_isResetEmailSent) {
      notifyListeners();
    }
  }

  Future<void> register() async {
    //FIXME "type 'Null' is not a subtype of type 'bool' in type cast" > Error from stacked library doesn't return "false" but "null" so we need to make the return type nullable
    bool? success = await runBusyFuture<bool?>(_authenticationService.register(CreateProfileUserRequest(
        firstname: "",
        lastname: _usernameRegistration,
        email: _emailRegistration,
        password: _passwordRegistration,
        affiliateId: "")));

    _isRegistrationEmailSent = success ?? false;

    if (_isRegistrationEmailSent) {

      //pre-fill login email with registration email (leave password blank due to data protection)..
      _emailLogin = _emailRegistration;
      //.. but reset other login / registration data
      _resetInputs();   Hier stimmt was nicht
      notifyListeners();
    }
  }

  //I know, code duplication is stupid, but since Dart references are passed-by-value,
  //we cannot setBusyForObject(param), because param would be a copy of the _AGBsHTML or _dataProtectionHTML- param
  //so this stupid "stacked" library method won't tell anymore if one of those objects has busy state.
  //Because the lib seems to identify the busy object via its pointer. Damnit. (Also Dart lang is to blame here imho)

  // > We have to hard-code setBusyForObject(_AGBsHTML) and also for _dataProtectionHTML.
  void loadAGBs() {
    setBusyForObject(_AGBsHTML, true);

    rootBundle.loadString(TextAssets.AGBsHtml).then((loadedData) {
      _AGBsHTML = htmlparser.parse(loadedData);
      setBusyForObject(_AGBsHTML, false);
    });
  }

  void loadDataProtection() {
    setBusyForObject(_dataProtectionHTML, true);

    rootBundle.loadString(TextAssets.dataProtectionHtml).then((loadedData) {
      _dataProtectionHTML = htmlparser.parse(loadedData);
      setBusyForObject(_dataProtectionHTML, false);
    });
  }

  void fetchAGBs() async {
    String? htmlRaw = await runBusyFuture<String?>(_authenticationService.fetchAGBs());
    dom.Document htmlDoc = htmlparser.parse(htmlRaw);

    //TODO backend must offer AGB HTML data first
  }

  void fetchDataProtection() async {
    //TODO backend must offer data Protection HTML data first
  }

  void _resetInputs() {
    _usernameRegistration = "";
    _emailRegistration = "";
    _passwordRegistration = "";

    _passwordLogin = "";

    _passwordRegistrationError = null;
    _usernameRegistrationError = null;
    _emailRegistrationError = null;

    _passwordLoginError = null;
    _emailLoginError = null;

    _isAGB_accepted = false;
    _isDataProtectionAccepted = false;

    _hasTextFieldFocus = false;
  }
}
