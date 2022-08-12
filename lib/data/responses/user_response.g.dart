// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..group = json['group'] as int?
      ..internalCode = json['internalCode'] as int?
      ..statusCode = json['statusCode'] as int?;

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'group': instance.group,
      'internalCode': instance.internalCode,
      'statusCode': instance.statusCode,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String?,
      formOfAddress: json['formOfAddress'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      email: json['email'] as String?,
      currentLanguagePairId: json['currentLanguagePairId'] as String?,
      currentSourceLanguageId: json['currentSourceLanguageId'] as String?,
      currentTargetLanguageId: json['currentTargetLanguageId'] as String?,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      subscriptionIds: (json['subscriptionIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'formOfAddress': instance.formOfAddress,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'currentLanguagePairId': instance.currentLanguagePairId,
      'currentSourceLanguageId': instance.currentSourceLanguageId,
      'currentTargetLanguageId': instance.currentTargetLanguageId,
      'roles': instance.roles,
      'subscriptionIds': instance.subscriptionIds,
    };
