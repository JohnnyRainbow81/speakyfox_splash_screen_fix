// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response<T> _$ResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    Response<T>(
      code: Code.fromJson(json['code'] as Map<String, dynamic>),
      data: fromJsonT(json['data']),
      description: json['description'] as String?,
      total: json['total'] as int?,
      errors: json['errors'],
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ResponseToJson<T>(
  Response<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'code': instance.code,
      'data': toJsonT(instance.data),
      'description': instance.description,
      'total': instance.total,
      'errors': instance.errors,
      'message': instance.message,
    };
