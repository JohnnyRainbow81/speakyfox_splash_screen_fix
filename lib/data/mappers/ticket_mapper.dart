import 'package:speakyfox/data/dtos/ticket_dto.dart';
import 'package:speakyfox/domain/models/ticket.dart';

extension TicketMapper on TicketDto {
  Ticket toTicket() {
    return Ticket(
        accessToken: accessToken, expiresIn: expiresIn, refreshToken: refreshToken, scope: scope, tokenType: tokenType);
  }
}
