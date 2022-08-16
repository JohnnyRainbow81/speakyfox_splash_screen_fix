// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:speakyfox/data/responses/base_response.dart';

part 'ticket_response.g.dart';

@JsonSerializable()
class TicketResponse extends BaseResponse{
  @JsonKey(name: "access_token")
  String accessToken;

  @JsonKey(name: "expires_in")
  int expiresIn;

  @JsonKey(name: "refresh_token")
  String refreshToken;

  @JsonKey(name: "scope")
  String scope;

  @JsonKey(name: "token_type")
  String tokenType;

  TicketResponse({
    int? group,
    int? statusCode,
    int? internalCode,
    required this.accessToken,
    required this.expiresIn,
    required this.refreshToken,
    required this.scope,
    required this.tokenType,
  }) : super(group: group, statusCode: statusCode, internalCode: internalCode);

  factory TicketResponse.fromJson(Map<String, dynamic> json) => _$TicketResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TicketResponseToJson(this);

  @override
  String toString() {
    return 'TicketResponse(accessToken: $accessToken, expiresIn: $expiresIn, refreshToken: $refreshToken, scope: $scope, tokenType: $tokenType)';
  }
}


@JsonSerializable()
class ResetPasswordResponse extends BaseResponse {
  @JsonKey(name: "password")
  String password;

  @JsonKey(name: "token")
  String token;

  ResetPasswordResponse({
    int? group,
    int? statusCode,
    int? internalCode,
    required this.password,
    required this.token,
  }) : super(group: group, internalCode: internalCode, statusCode: statusCode);

factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) => _$ResetPasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordResponseToJson(this);
  
}
