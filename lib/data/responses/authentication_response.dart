// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'authentication_response.g.dart';

@JsonSerializable()
class AuthenticationResponse {
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

  AuthenticationResponse({
    required this.accessToken,
    required this.expiresIn,
    required this.refreshToken,
    required this.scope,
    required this.tokenType,
  });

  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) => _$AuthenticationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);

  @override
  String toString() {
    return 'AuthenticationResponse(accessToken: $accessToken, expiresIn: $expiresIn, refreshToken: $refreshToken, scope: $scope, tokenType: $tokenType)';
  }
}
