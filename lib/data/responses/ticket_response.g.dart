// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketResponse _$TicketResponseFromJson(Map<String, dynamic> json) =>
    TicketResponse(
      accessToken: json['accessToken'] as String,
      expiresIn: json['expiresIn'] as int,
      refreshToken: json['refreshToken'] as String,
      scope: json['scope'] as String,
      tokenType: json['tokenType'] as String,
    );

Map<String, dynamic> _$TicketResponseToJson(TicketResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'expiresIn': instance.expiresIn,
      'refreshToken': instance.refreshToken,
      'scope': instance.scope,
      'tokenType': instance.tokenType,
    };

ResetPasswordResponse _$ResetPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordResponse(
      password: json['password'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$ResetPasswordResponseToJson(
        ResetPasswordResponse instance) =>
    <String, dynamic>{
      'password': instance.password,
      'token': instance.token,
    };
