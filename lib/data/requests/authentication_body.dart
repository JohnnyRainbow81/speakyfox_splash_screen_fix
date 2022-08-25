// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'authentication_body.g.dart';

@JsonSerializable()
class AuthenticationRequestBody {
  @JsonKey(name: "username")
  String userName;
  @JsonKey(name: "password")
  String password;
  @JsonKey(name: "grant_type")
  String grantType;
  AuthenticationRequestBody({
    required this.userName,
    required this.password,
    required this.grantType,
  });

  factory AuthenticationRequestBody.fromJson(Map<String, dynamic> json) => _$AuthenticationRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$AuthenticationRequestBodyToJson(this);
}
