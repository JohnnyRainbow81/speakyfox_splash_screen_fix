// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'ticket_dto.g.dart';

@JsonSerializable()
//underscore instead of camelCase because of Auth convention
class TicketDto {
  @JsonKey(name: "access_token")
  String accessToken;
  @JsonKey(name: "expires_in")
  int expiresIn;
  @JsonKey(name: "refresh_token")
  String? refreshToken;
  String scope;
  @JsonKey(name: "token_type")
  String tokenType;

  TicketDto({
    required this.accessToken,
    required this.expiresIn,
    this.refreshToken,
    required this.scope,
    required this.tokenType,
  });

  factory TicketDto.fromJson(Map<String, dynamic> json) => _$TicketDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TicketDtoToJson(this);

  @override
  String toString() {
    return 'TicketDto(accessToken: $accessToken, expiresIn: $expiresIn, refreshToken: $refreshToken, scope: $scope, tokenType: $tokenType)';
  }
}
