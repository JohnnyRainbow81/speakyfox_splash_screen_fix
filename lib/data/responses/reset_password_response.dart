
import 'package:json_annotation/json_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reset_password_response.g.dart';

@JsonSerializable()
class ResetPasswordResponse {
  @JsonKey(name: "password")
  String password;

  @JsonKey(name: "token")
  String token;

  ResetPasswordResponse({
    required this.password,
    required this.token,
  });

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) => _$ResetPasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordResponseToJson(this);
}
