// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'ticket_response.g.dart';

@JsonSerializable()
class TicketResponse {
  String accessToken;
  int expiresIn;
  String refreshToken;
  String scope;
  String tokenType;

  TicketResponse({
    required this.accessToken,
    required this.expiresIn,
    required this.refreshToken,
    required this.scope,
    required this.tokenType,
  });

  factory TicketResponse.fromJson(Map<String, dynamic> json) => _$TicketResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TicketResponseToJson(this);

  @override
  String toString() {
    return 'TicketResponse(accessToken: $accessToken, expiresIn: $expiresIn, refreshToken: $refreshToken, scope: $scope, tokenType: $tokenType)';
  }
}
