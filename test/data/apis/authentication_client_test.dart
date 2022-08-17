import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/app/constants.dart';
import 'package:speakyfox/data/dio_clients/authentication_client.dart';
import 'package:speakyfox/data/dio_factory.dart';
import 'package:speakyfox/data/mappers/ticket_mapper.dart';
import 'package:speakyfox/data/mappers/user_mapper.dart';
import 'package:speakyfox/data/requests/reset_password_body.dart';
import 'package:speakyfox/data/responses/ticket_response.dart';
import 'package:speakyfox/data/responses/user_response.dart';
import 'package:speakyfox/domain/models/ticket.dart';
import 'package:speakyfox/domain/models/user.dart';

void main() async {
  late User user;
  final authDio = await DioAuth.initialize(Constants.baseUrlAuth);
  AuthenticationClient authenticationClient = AuthenticationClient(authDio);

  //Test on production server with real credentials! (because QA Server isn't up-to-date)
  test('authentication client', () async {
    final answer = await authenticationClient.accessToken("stefan_anders@gmx.net", "Kuchen1981!", "password");
    print(answer.accessToken.toString());
  });

  test('fetch me', (() async {
    TicketResponse ticketResponse =
        await authenticationClient.accessToken("stefan_anders@gmx.net", "Kuchen1981!", "password");
    Ticket ticket = ticketResponse.toTicket();
    UserResponse userResponse = await authenticationClient.fetchMe(ticket.accessToken);
    user = userResponse.toUser();
    print(user);
  }));

  test('reset password', (() async {
    //final answer = await authenticationClient.resetPassword(user.id!, ResetPasswordBody(password: "Kuchen1996!",token: user. ));
  }));
}
