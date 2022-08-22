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
      lastFourDigits: json['lastFourDigits'] as String?,
      brand: json['brand'] as String?,
      expiryMonth: json['expiryMonth'] as int?,
      externalId: json['externalId'] as String?,
      expiryYear: json['expiryYear'] as int?,
      bankName: json['bankName'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      type: $enumDecode(_$PaymentMethodTypeEnumMap, json['type']),
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
      'lastFourDigits': instance.lastFourDigits,
      'brand': instance.brand,
      'expiryMonth': instance.expiryMonth,
      'expiryYear': instance.expiryYear,
      'externalId': instance.externalId,
      'bankName': instance.bankName,
      'email': instance.email,
      'name': instance.name,
      'type': _$PaymentMethodTypeEnumMap[instance.type]!,
    };

const _$PaymentMethodTypeEnumMap = {
  PaymentMethodType.sepaDirectDebit: 'sepaDirectDebit',
  PaymentMethodType.creditCard: 'creditCard',
  PaymentMethodType.payPal: 'paypal',
  PaymentMethodType.appleId: 'appleId',
  PaymentMethodType.internal: 'internal',
};
