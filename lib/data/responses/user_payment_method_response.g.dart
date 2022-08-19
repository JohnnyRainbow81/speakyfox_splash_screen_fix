// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_payment_method_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPaymentMethodResponse _$UserPaymentMethodResponseFromJson(
        Map<String, dynamic> json) =>
    UserPaymentMethodResponse(
      id: json['id'] as String,
      modified: json['modified'] as String,
      modifiedBy: json['modifiedBy'] as String,
      created: json['created'] as String,
      createdBy: json['createdBy'] as String,
      deleted: json['deleted'] as String,
      deletedBy: json['deletedBy'] as String,
      type: $enumDecode(_$PaymentMethodTypeEnumMap, json['type']),
      externalId: json['externalId'] as String,
    );

Map<String, dynamic> _$UserPaymentMethodResponseToJson(
        UserPaymentMethodResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'modified': instance.modified,
      'modifiedBy': instance.modifiedBy,
      'created': instance.created,
      'createdBy': instance.createdBy,
      'deleted': instance.deleted,
      'deletedBy': instance.deletedBy,
      'type': _$PaymentMethodTypeEnumMap[instance.type]!,
      'externalId': instance.externalId,
    };

const _$PaymentMethodTypeEnumMap = {
  PaymentMethodType.sepaDirectDebit: 'sepaDirectDebit',
  PaymentMethodType.creditCard: 'creditCard',
  PaymentMethodType.payPal: 'paypal',
  PaymentMethodType.appleId: 'appleId',
  PaymentMethodType.internal: 'internal',
};
