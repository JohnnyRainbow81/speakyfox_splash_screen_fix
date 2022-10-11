// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProfileUserRequest _$CreateProfileUserRequestFromJson(
        Map<String, dynamic> json) =>
    CreateProfileUserRequest(
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      affiliateId: json['affiliateId'] as String,
      isOfferRegistration: json['isOfferRegistration'] as bool? ?? false,
      formOfAddress: json['formOfAddress'] as String? ?? "Unknown",
    );

Map<String, dynamic> _$CreateProfileUserRequestToJson(
        CreateProfileUserRequest instance) =>
    <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'password': instance.password,
      'isOfferRegistration': instance.isOfferRegistration,
      'affiliateId': instance.affiliateId,
      'formOfAddress': instance.formOfAddress,
    };
