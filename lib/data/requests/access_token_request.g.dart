// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_token_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessTokenRequest _$AccessTokenRequestFromJson(Map<String, dynamic> json) =>
    AccessTokenRequest(
      email: json['email'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$AccessTokenRequestToJson(AccessTokenRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'token': instance.token,
    };
