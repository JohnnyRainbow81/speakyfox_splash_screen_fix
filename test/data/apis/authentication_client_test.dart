import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/data/dio_factory.dart';
import 'package:speakyfox/data/mappers/ticket_mapper.dart';
import 'package:speakyfox/data/mappers/user_mapper.dart';
import 'package:speakyfox/data/remote/authentication_client.dart';
import 'package:speakyfox/domain/models/ticket.dart';
import 'package:speakyfox/domain/models/user.dart';

void main() async {
  late User user;
  //Test on production server with real credentials! (because QA Server isn't up-to-date)
  final authDio = await DioV1.initialize("https://speakyfox-api-production.herokuapp.com/api/v1/");
  AuthenticationClient authenticationClient = AuthenticationClient(authDio);

  test('authentication client', () async {
    final answer = await authenticationClient.accessToken("stefan_anders@gmx.net", "Kuchen1981!", "password");
    print(answer.accessToken.toString());
  });

  test('fetch user', (() async {
    final response = await authenticationClient.accessToken("stefan_anders@gmx.net", "Kuchen1981!", "password");
    Ticket ticket = response.toTicket();
    final userDto = await authenticationClient.fetchUser("Bearer ${ticket.accessToken}");
    user = userDto.data.toUser();
    print(user);
  }));

  test('reset password', (() async {
    //final answer = await authenticationClient.resetPassword(user.id!, ResetPasswordBody(password: "Kuchen1996!",token: user. ));
  }));
}
