// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response<T> _$ResponseFromJson<T>(Map<String, dynamic> json) => Response<T>(
      code: Code.fromJson(json['code'] as Map<String, dynamic>),
      data: _Converter<T>().fromJson(json['data'] as Object),
      description: json['description'] as String?,
      total: json['total'] as int?,
      errors: json['errors'],
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ResponseToJson<T>(Response<T> instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': _Converter<T>().toJson(instance.data),
      'description': instance.description,
      'total': instance.total,
      'errors': instance.errors,
      'message': instance.message,
    };
