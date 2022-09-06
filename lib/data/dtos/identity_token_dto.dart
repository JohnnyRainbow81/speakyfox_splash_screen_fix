import 'package:json_annotation/json_annotation.dart';
import 'package:speakyfox/data/dtos/user_dto.dart';

part 'identity_token_dto.g.dart';

@JsonSerializable()
class IdentityTokenDto {
 String expires;
 String accessToken;
 String refreshToken;
  UserDto user;
  IdentityTokenDto({
    required this.expires,
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  factory IdentityTokenDto.fromJson(Map<String, dynamic> json) => _$IdentityTokenDtoFromJson(json);
  Map<String, dynamic> toJson() => _$IdentityTokenDtoToJson(this);
}