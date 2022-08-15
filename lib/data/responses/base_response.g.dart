// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse(
      group: json['group'] as int?,
      internalCode: json['internalCode'] as int?,
      statusCode: json['statusCode'] as int?,
    );

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'group': instance.group,
      'internalCode': instance.internalCode,
      'statusCode': instance.statusCode,
    };
