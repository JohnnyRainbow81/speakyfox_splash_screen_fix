// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationRequestBody _$AuthenticationRequestBodyFromJson(
        Map<String, dynamic> json) =>
    AuthenticationRequestBody(
      userName: json['username'] as String,
      password: json['password'] as String,
      grantType: json['grant_type'] as String,
    );

Map<String, dynamic> _$AuthenticationRequestBodyToJson(
        AuthenticationRequestBody instance) =>
    <String, dynamic>{
      'username': instance.userName,
      'password': instance.password,
      'grant_type': instance.grantType,
    };
