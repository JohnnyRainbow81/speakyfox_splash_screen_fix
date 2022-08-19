import 'package:speakyfox/data/responses/ticket_response.dart';
import 'package:speakyfox/domain/models/ticket.dart';

extension TicketMapper on TicketResponse {
  Ticket toTicket() {
    return Ticket(
        accessToken: accessToken, expiresIn: expiresIn, refreshToken: refreshToken, scope: scope, tokenType: tokenType);
  }
}

