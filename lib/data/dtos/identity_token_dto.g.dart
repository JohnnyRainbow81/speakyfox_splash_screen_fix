// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_token_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdentityTokenDto _$IdentityTokenDtoFromJson(Map<String, dynamic> json) =>
    IdentityTokenDto(
      expires: json['expires'] as String,
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      user: UserDto.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IdentityTokenDtoToJson(IdentityTokenDto instance) =>
    <String, dynamic>{
      'expires': instance.expires,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'user': instance.user,
    };
