import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:speakyfox/app/error_handling/exceptions_ui.dart';
import 'package:speakyfox/data/dtos/identity_token_dto.dart';
import 'package:speakyfox/data/dtos/user_dto.dart';

enum Keys { ticket, user, identityToken }

class AuthenticationLocalSource {
  final SharedPreferences _sharedPreferences;
  AuthenticationLocalSource(this._sharedPreferences);





  IdentityTokenDto? loadCredentials() {
    if (_sharedPreferences.containsKey(Keys.identityToken.name)) {
      String str = _sharedPreferences.getString(Keys.identityToken.name)!;
      Map<String, dynamic> map = json.decode(str);
      IdentityTokenDto identityTokenDto = IdentityTokenDto.fromJson(map);
      return identityTokenDto;
    }
    return null;
  }

  Future<bool> saveCredentials(IdentityTokenDto identityTokenDto) async {
    try {
      String jsonStr = json.encode(identityTokenDto.toJson());
      return await _sharedPreferences.setString(Keys.identityToken.name, jsonStr);
    } catch (e) {
      throw CacheSavingException();
    }
  }

  Future<bool> clearCredentials() async {
    try {
      final clearIdentityToken = await _sharedPreferences.setString(Keys.identityToken.name, "");
      final clearTicket = await _sharedPreferences.setString(Keys.ticket.name, "");

      return clearIdentityToken && clearTicket;
    } catch (e) {
      throw CacheClearingException();
    }
  }
}
