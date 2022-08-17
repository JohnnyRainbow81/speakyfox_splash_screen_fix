// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordBody _$ResetPasswordBodyFromJson(Map<String, dynamic> json) =>
    ResetPasswordBody(
      password: json['password'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$ResetPasswordBodyToJson(ResetPasswordBody instance) =>
    <String, dynamic>{
      'password': instance.password,
      'token': instance.token,
    };
