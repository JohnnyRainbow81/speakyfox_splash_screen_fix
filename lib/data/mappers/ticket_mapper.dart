import 'package:speakyfox/data/responses/ticket_response.dart';
import 'package:speakyfox/domain/models/ticket.dart';

extension TicketResponseMapper on TicketResponse {
  Ticket toTicket() {
    return Ticket(
        accessToken: accessToken, expiresIn: expiresIn, refreshToken: refreshToken, scope: scope, tokenType: tokenType);
  }
}

extension ResetPasswordResponseMapper on ResetPasswordResponse {
  ResetPassword toResetPassword() {
    return ResetPassword(password: password, token: token);
  }
}
