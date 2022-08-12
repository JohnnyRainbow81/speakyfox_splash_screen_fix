// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/domain/models/user.dart';
import 'package:stacked/stacked.dart';

import 'package:speakyfox/domain/services/user_service.dart';

class LoginViewModel extends BaseViewModel {
  final UserService _userService;

  String _username = "";
  String _password = "";

  LoginViewModel(
    this._userService,
  );

  String? validateUsername(String? username) {
    if (username == null || username.isEmpty) {
      return 'Please enter some text';
    }
    _username = username;
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter some text';
    }
    _password = password;
    return null;
  }

  bool isLoginFormValid() {
    return _username.isNotEmpty && _password.isNotEmpty;
  }

  Future<bool> login() async {
   return await _userService.getMe(_username, _password);
  }
}
