// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      id: json['id'] as String,
      modified: json['modified'] as String?,
      modifiedBy: json['modifiedBy'] as String?,
      created: json['created'] as String?,
      createdBy: json['createdBy'] as String?,
      deleted: json['deleted'] as String?,
      deletedBy: json['deletedBy'] as String?,
      formOfAddress: json['formOfAddress'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      userName: json['userName'] as String?,
      normalizedUserName: json['normalizedUserName'] as String?,
      email: json['email'] as String,
      emailConfirmed: json['emailConfirmed'] as bool?,
      normalizedEmail: json['normalizedEmail'] as String?,
      accessFailedAccount: json['accessFailedAccount'] as int?,
      lockoutEnabled: json['lockoutEnabled'] as bool?,
      password: json['password'] as String?,
      lockoutEnd: json['lockoutEnd'] as String?,
      policies: (json['policies'] as List<dynamic>?)?.map((e) => e as String).toList(),
      currentLanguagePairId: json['currentLanguagePairId'] as String?,
      currentSourceLanguageId: json['currentSourceLanguageId'] as String?,
      currentTargetLanguageId: json['currentTargetLanguageId'] as String?,
      roles: (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      subscriptionIds: (json['subscriptionIds'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'modified': instance.modified,
      'modifiedBy': instance.modifiedBy,
      'created': instance.created,
      'createdBy': instance.createdBy,
      'deleted': instance.deleted,
      'deletedBy': instance.deletedBy,
      'id': instance.id,
      'formOfAddress': instance.formOfAddress,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'userName': instance.userName,
      'normalizedUserName': instance.normalizedUserName,
      'email': instance.email,
      'emailConfirmed': instance.emailConfirmed,
      'normalizedEmail': instance.normalizedEmail,
      'accessFailedAccount': instance.accessFailedAccount,
      'lockoutEnabled': instance.lockoutEnabled,
      'password': instance.password,
      'lockoutEnd': instance.lockoutEnd,
      'policies': instance.policies,
      'currentLanguagePairId': instance.currentLanguagePairId,
      'currentSourceLanguageId': instance.currentSourceLanguageId,
      'currentTargetLanguageId': instance.currentTargetLanguageId,
      'roles': instance.roles,
      'subscriptionIds': instance.subscriptionIds,
    };
