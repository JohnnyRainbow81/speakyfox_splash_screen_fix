// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'reset_password_body.g.dart';

@JsonSerializable()
class ResetPasswordBody {
  @JsonKey(name:"password")
  String password;
  @JsonKey(name: "token")
  String token;
  ResetPasswordBody({
    required this.password,
    required this.token,
  });


  factory ResetPasswordBody.fromJson(Map<String, dynamic> json) => _$ResetPasswordBodyFromJson(json);
  Map<String, dynamic> toJson() => _$ResetPasswordBodyToJson(this);
}
