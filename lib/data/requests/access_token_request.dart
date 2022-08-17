// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'access_token_request.g.dart';

@JsonSerializable()
class AccessTokenRequest {
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "token")
  String token;
  AccessTokenRequest({
    required this.email,
    required this.token,
  });


  factory AccessTokenRequest.fromJson(Map<String, dynamic> json) => _$AccessTokenRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AccessTokenRequestToJson(this);
}
