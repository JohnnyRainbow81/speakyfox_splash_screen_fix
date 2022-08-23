// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAddressDto _$UserAddressDtoFromJson(Map<String, dynamic> json) =>
    UserAddressDto(
      city: json['city'] as String,
      country: Map<String, String>.from(json['country'] as Map),
      line1: json['line1'] as String,
      line2: json['line2'] as String,
      postal_code: json['postal_code'] as String,
      state: json['state'] as String,
    );

Map<String, dynamic> _$UserAddressDtoToJson(UserAddressDto instance) =>
    <String, dynamic>{
      'city': instance.city,
      'country': instance.country,
      'line1': instance.line1,
      'line2': instance.line2,
      'postal_code': instance.postal_code,
      'state': instance.state,
    };
