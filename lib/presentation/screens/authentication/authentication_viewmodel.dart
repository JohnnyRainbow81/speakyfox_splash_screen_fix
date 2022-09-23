// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speakyfox/app/constants.dart';
import 'package:speakyfox/app/dependency_injection.dart';
import 'package:speakyfox/app/utilities.dart';
import 'package:speakyfox/data/remote/authentication_client.dart';
import 'package:speakyfox/data/requests/create_user_request.dart';
import 'package:speakyfox/data/requests/send_password_reset_body.dart';
import 'package:speakyfox/domain/services/authentication_service.dart';
import 'package:speakyfox/presentation/common/resources/text_assets.dart';
import 'package:stacked/stacked.dart';

import '../../../domain/models/user.dart';

class AuthenticationViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService;

  late String _username;
  late String _password;
  late String _email;
  Map<String, dynamic>? _AGBs;

  String? _usernameError;
  String? _passwordError;
  String? _emailError;

  bool _isRegistrationEmailSent = false;
  bool _isResetEmailSent = false;
  bool _isAGB_accepted = false;
  bool _isDataProtectionAccepted = false;
  bool _stayLoggedIn = false;
  bool _canSendEmail = true;
  bool _hasTextFieldFocus = false;

  int _waitTime = Constants.emailResendDelay;

  Function? _allRegistrationInputsAreValidCallback;

  AuthenticationViewModel(
    this._authenticationService,
  ) {
    User? user = _authenticationService.getUser();

    _username = user?.firstName ?? "";
    _email = user?.email ?? "";
    _password = "";

    getAGB();
  }

  set allRegistrationInputsAreValid(Function? callback) {
    _allRegistrationInputsAreValidCallback = callback;
  }

  set hasTextFieldFocus(bool value) {
    _hasTextFieldFocus = value;
    notifyListeners();
  }

  String get email => _email;
  String get password => _password;
  String get username => _username;

  String? get userNameError => _usernameError;
  String? get passwordError => _passwordError;
  String? get emailError => _emailError;

  bool get isLoggedIn => _authenticationService.isAuthenticated();
  bool get isResetEmailSent => _isResetEmailSent;
  bool get isAGB_accepted => _isAGB_accepted;
  bool get isDataProtectionAccepted => _isDataProtectionAccepted;
  bool get stayLoggedIn => _stayLoggedIn;
  bool get isRegistrationEmailSent => _isRegistrationEmailSent;
  bool get canSendEmail => !isBusy && _canSendEmail;

  bool get hasTextFieldFocus => _hasTextFieldFocus;

  Map<String, dynamic> get AGBs => _AGBs ?? {};

  String get waitTime => _waitTime.toString();

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

  void toggleStayLoggedIn() {
    _stayLoggedIn = !_stayLoggedIn;
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
    //email validation has already been done at this point. "valid" then means, that
    //the email string has been assigned a valid value that satisfies all email address criterias
    return email.isNotEmpty;
  }

  bool isAlreadyLoggedIn() {
    return _authenticationService.isAuthenticated();
  }

  Future<void> login() async {
    await runBusyFuture<bool?>(_authenticationService.login(_email, _password));
    if (_authenticationService.isAuthenticated()) {
      _password = "";
      notifyListeners();
    }
  }

  Future<void> sendResetEmail() async {
    _canSendEmail = false;
    //FIXME "type 'Null' is not a subtype of type 'bool' in type cast" > Error from stacked library doesn't return "false" but "null" so we need to make the return type nullable
    bool? success = false;
    //Better mock this call for testing
    success =
        await runBusyFuture<bool?>(_authenticationService.sendPasswordResetEmail(SendPasswordResetBody(email: _email)));

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
        firstname: "", lastname: _username, email: _email, password: _password, affiliateId: "")));
    _isRegistrationEmailSent = success ?? false;
    if (_isRegistrationEmailSent) {
      _password = "";
      notifyListeners();
    }
  }

  void getAGB() {
    rootBundle.loadString(TextAssets.AGBs).then(
      (string) {
        _AGBs = jsonDecode(string);
        notifyListeners();
      },
    );
  }

  void reset() {
    _passwordError = null;
    _usernameError = null;
    _emailError = null;
    _isRegistrationEmailSent = false;
  }
}
