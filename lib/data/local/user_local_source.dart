import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:speakyfox/app/error_handling/exceptions_ui.dart';
import 'package:speakyfox/data/dtos/user_dto.dart';

class UserLocalSource {
  final SharedPreferences _sharedPreferences;

  UserLocalSource(this._sharedPreferences);
  

  Future<bool> saveUser(UserDto user) async {
    try {
      String jsonStr = json.encode(user.toJson());
      return await _sharedPreferences.setString(Keys.user.name, jsonStr);
    } catch (e) {
      throw CacheSavingException();
    }
  }

  UserDto loadUser() {
    if (_sharedPreferences.containsKey(Keys.user.name)) {
      String str = _sharedPreferences.getString(Keys.user.name)!;
      Map<String, dynamic> map = json.decode(str);
      UserDto userDto = UserDto.fromJson(map);
      return userDto;
    }
    throw CacheLoadingException();
  }
}
