import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:speakyfox/app/error_handling/exceptions_ui.dart';
import 'package:speakyfox/data/dtos/identity_token_dto.dart';
import 'package:speakyfox/data/mappers/ticket_mapper.dart';
import 'package:speakyfox/data/mappers/user_mapper.dart';
import 'package:speakyfox/data/dtos/ticket_dto.dart';
import 'package:speakyfox/data/dtos/user_dto.dart';
import 'package:speakyfox/domain/models/identity_token.dart';
import 'package:speakyfox/domain/models/user.dart';

import '../../domain/models/ticket.dart';

enum Keys { ticket, user, identityToken }

class AuthenticationLocalSource {
  final SharedPreferences _sharedPreferences;
  AuthenticationLocalSource(this._sharedPreferences);

  Future<bool> saveTicket(TicketDto ticket) async {
    try {
      String jsonStr = json.encode(ticket.toJson());
      return await _sharedPreferences.setString(Keys.user.name, jsonStr);
    } catch (e) {
      throw CacheSavingException();
    }
  }

  Future<TicketDto> loadTicket() async {
    if (_sharedPreferences.containsKey(Keys.ticket.name)) {
      String str = _sharedPreferences.getString(Keys.ticket.name)!;
      Map<String, dynamic> map = json.decode(str);
      TicketDto ticketDto = TicketDto.fromJson(map);
      return ticketDto;
    }
    throw CacheLoadingException();
  }

  Future<bool> saveUser(UserDto user) async {
    try {
      String jsonStr = json.encode(user.toJson());
      return await _sharedPreferences.setString(Keys.user.name, jsonStr);
    } catch (e) {
      throw CacheSavingException();
    }
  }

  Future<UserDto> loadUser() async {
    if (_sharedPreferences.containsKey(Keys.user.name)) {
      String str = _sharedPreferences.getString(Keys.user.name)!;
      Map<String, dynamic> map = json.decode(str);
      UserDto userDto = UserDto.fromJson(map);
      return userDto;
    }
    throw CacheLoadingException();
  }

  Future<IdentityTokenDto> loadCredentials() async {
    if (_sharedPreferences.containsKey(Keys.identityToken.name)) {
      String str = _sharedPreferences.getString(Keys.identityToken.name)!;
      Map<String, dynamic> map = json.decode(str);
      IdentityTokenDto identityTokenDto = IdentityTokenDto.fromJson(map);
      return identityTokenDto;
    }
    throw CacheLoadingException();
  }

  Future<bool> saveCredentials(IdentityTokenDto identityTokenDto) async {
    try {
      String jsonStr = json.encode(identityTokenDto.toJson());
      return await _sharedPreferences.setString(Keys.identityToken.name, jsonStr);
    } catch (e) {
      throw CacheSavingException();
    }
  }
}
