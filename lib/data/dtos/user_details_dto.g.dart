// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailsDto _$UserDetailsDtoFromJson(Map<String, dynamic> json) =>
    UserDetailsDto(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      address: UserAddressDto.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDetailsDtoToJson(UserDetailsDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
    };
