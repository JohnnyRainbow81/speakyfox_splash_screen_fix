// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationResponse _$AuthenticationResponseFromJson(
        Map<String, dynamic> json) =>
    AuthenticationResponse(
      group: json['group'] as int?,
      statusCode: json['statusCode'] as int?,
      internalCode: json['internalCode'] as int?,
      accessToken: json['access_token'] as String,
      expiresIn: json['expires_in'] as int,
      refreshToken: json['refresh_token'] as String,
      scope: json['scope'] as String,
      tokenType: json['token_type'] as String,
    );

Map<String, dynamic> _$AuthenticationResponseToJson(
        AuthenticationResponse instance) =>
    <String, dynamic>{
      'group': instance.group,
      'internalCode': instance.internalCode,
      'statusCode': instance.statusCode,
      'access_token': instance.accessToken,
      'expires_in': instance.expiresIn,
      'refresh_token': instance.refreshToken,
      'scope': instance.scope,
      'token_type': instance.tokenType,
    };

ResetPasswordResponse _$ResetPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordResponse(
      group: json['group'] as int?,
      statusCode: json['statusCode'] as int?,
      internalCode: json['internalCode'] as int?,
      password: json['password'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$ResetPasswordResponseToJson(
        ResetPasswordResponse instance) =>
    <String, dynamic>{
      'group': instance.group,
      'internalCode': instance.internalCode,
      'statusCode': instance.statusCode,
      'password': instance.password,
      'token': instance.token,
    };
