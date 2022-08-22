import 'package:json_annotation/json_annotation.dart';

part 'reset_password_dto.g.dart';

@JsonSerializable()
class ResetPasswordDto {
  @JsonKey(name: "password")
  String password;

  @JsonKey(name: "token")
  String token;

  ResetPasswordDto({
    required this.password,
    required this.token,
  });

  factory ResetPasswordDto.fromJson(Map<String, dynamic> json) => _$ResetPasswordDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordDtoToJson(this);
}
