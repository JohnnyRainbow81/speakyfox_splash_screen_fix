import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:speakyfox/app/error_handling/exceptions_ui.dart';
import 'package:speakyfox/data/mappers/ticket_mapper.dart';
import 'package:speakyfox/data/mappers/user_mapper.dart';
import 'package:speakyfox/data/responses/ticket_response.dart';
import 'package:speakyfox/data/responses/user_response.dart';
import 'package:speakyfox/domain/models/user.dart';

import '../../domain/models/ticket.dart';

enum Keys { ticket, user }

class AuthenticationLocalSource {
  final SharedPreferences _sharedPreferences;
  AuthenticationLocalSource(this._sharedPreferences);

  Future<bool> saveTicket(TicketResponse ticket) async {
    return await _sharedPreferences.setString(Keys.user.name, ticket.toJson().toString());
  }

  Future<Ticket> loadTicket() async {
    if (_sharedPreferences.containsKey(Keys.ticket.name)) {
      String str = _sharedPreferences.getString(Keys.ticket.name)!;
      Map<String, dynamic> map = json.decode(str);
      TicketResponse ticketResponse = TicketResponse.fromJson(map);
      return ticketResponse.toTicket();
    }
    throw CacheException();
  }

  Future<bool> saveUser(UserResponse user) async {
    return await _sharedPreferences.setString(Keys.user.name, user.toJson().toString());
  }

  Future<User> loadUser() async {
    if (_sharedPreferences.containsKey(Keys.user.name)) {
      String str = _sharedPreferences.getString(Keys.user.name)!;
      Map<String, dynamic> map = json.decode(str);
      UserResponse userResponse = UserResponse.fromJson(map);
      return userResponse.toUser();
    }
    throw CacheException();

  }
}
