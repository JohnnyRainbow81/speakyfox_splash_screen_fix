// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_sepa_direct_debit_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSepaDirectDebitResponse _$UserSepaDirectDebitResponseFromJson(
        Map<String, dynamic> json) =>
    UserSepaDirectDebitResponse(
      id: json['id'] as String,
      modified: json['modified'] as String,
      modifiedBy: json['modifiedBy'] as String,
      created: json['created'] as String,
      createdBy: json['createdBy'] as String,
      deleted: json['deleted'] as String,
      deletedBy: json['deletedBy'] as String,
      type: $enumDecode(_$PaymentMethodTypeEnumMap, json['type']),
      externalId: json['externalId'] as String,
      lastFourDigits: json['lastFourDigits'] as String,
      bankName: json['bankName'] as String,
    );

Map<String, dynamic> _$UserSepaDirectDebitResponseToJson(
        UserSepaDirectDebitResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'modified': instance.modified,
      'modifiedBy': instance.modifiedBy,
      'created': instance.created,
      'createdBy': instance.createdBy,
      'deleted': instance.deleted,
      'deletedBy': instance.deletedBy,
      'externalId': instance.externalId,
      'type': _$PaymentMethodTypeEnumMap[instance.type]!,
      'lastFourDigits': instance.lastFourDigits,
      'bankName': instance.bankName,
    };

const _$PaymentMethodTypeEnumMap = {
  PaymentMethodType.sepaDirectDebit: 'sepaDirectDebit',
  PaymentMethodType.creditCard: 'creditCard',
  PaymentMethodType.payPal: 'paypal',
  PaymentMethodType.appleId: 'appleId',
  PaymentMethodType.internal: 'internal',
};
