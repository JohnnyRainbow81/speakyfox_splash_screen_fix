import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:speakyfox/app/error_handling/exceptions_ui.dart';
import 'package:speakyfox/data/mappers/ticket_mapper.dart';
import 'package:speakyfox/data/mappers/user_mapper.dart';
import 'package:speakyfox/data/dtos/ticket_dto.dart';
import 'package:speakyfox/data/dtos/user_dto.dart';
import 'package:speakyfox/domain/models/user.dart';

import '../../domain/models/ticket.dart';

enum Keys { ticket, user }

class AuthenticationLocalSource {
  final SharedPreferences _sharedPreferences;
  AuthenticationLocalSource(this._sharedPreferences);

  Future<bool> saveTicket(TicketDto ticket) async {
    return await _sharedPreferences.setString(Keys.user.name, ticket.toJson().toString());
  }

  Future<Ticket> loadTicket() async {
    if (_sharedPreferences.containsKey(Keys.ticket.name)) {
      String str = _sharedPreferences.getString(Keys.ticket.name)!;
      Map<String, dynamic> map = json.decode(str);
      TicketDto ticketDto = TicketDto.fromJson(map);
      return ticketDto.toTicket();
    }
    throw CacheException();
  }

  Future<bool> saveUser(UserDto user) async {
    return await _sharedPreferences.setString(Keys.user.name, user.toJson().toString());
  }

  Future<User> loadUser() async {
    if (_sharedPreferences.containsKey(Keys.user.name)) {
      String str = _sharedPreferences.getString(Keys.user.name)!;
      Map<String, dynamic> map = json.decode(str);
      UserDto userDto = UserDto.fromJson(map);
      return userDto.toUser();
    }
    throw CacheException();
  }
}
