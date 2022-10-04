// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentMethodDto _$PaymentMethodDtoFromJson(Map<String, dynamic> json) =>
    PaymentMethodDto(
      id: json['id'] as String,
      modified: json['modified'] as String?,
      modifiedBy: json['modifiedBy'] as String?,
      created: json['created'] as String?,
      createdBy: json['createdBy'] as String?,
      deleted: json['deleted'] as String?,
      deletedBy: json['deletedBy'] as String?,
      name: json['name'] as String,
      description: json['description'] as String,
      additionalInformation: json['additionalInformation'] as String,
      fileName: json['fileName'] as String,
      fileId: json['fileId'] as String,
      image: ImageDto.fromJson(json['image'] as Map<String, dynamic>),
      paymentProvider:
          $enumDecode(_$PaymentProviderEnumMap, json['paymentProvider']),
      type: $enumDecode(_$PaymentMethodTypeEnumMap, json['type']),
      externalId: json['externalId'] as String,
    );

Map<String, dynamic> _$PaymentMethodDtoToJson(PaymentMethodDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'modified': instance.modified,
      'modifiedBy': instance.modifiedBy,
      'created': instance.created,
      'createdBy': instance.createdBy,
      'deleted': instance.deleted,
      'deletedBy': instance.deletedBy,
      'name': instance.name,
      'description': instance.description,
      'additionalInformation': instance.additionalInformation,
      'fileName': instance.fileName,
      'fileId': instance.fileId,
      'image': instance.image,
      'paymentProvider': _$PaymentProviderEnumMap[instance.paymentProvider]!,
      'type': _$PaymentMethodTypeEnumMap[instance.type]!,
      'externalId': instance.externalId,
    };

const _$PaymentProviderEnumMap = {
  PaymentProvider.appleStore: 'appleStore',
  PaymentProvider.payPal: 'paypal',
  PaymentProvider.googlePlayStore: 'googlePlaystore',
  PaymentProvider.stripe: 'stripe',
  PaymentProvider.speakyfox: 'speakyfox',
};

const _$PaymentMethodTypeEnumMap = {
  PaymentMethodType.sepaDirectDebit: 'SEPADirectDebit',
  PaymentMethodType.creditCard: 'CreditCard',
  PaymentMethodType.payPal: 'PayPal',
  PaymentMethodType.appleId: 'AppleId',
  PaymentMethodType.internal: 'Internal',
  PaymentMethodType.ideal: 'iDEAL',
  PaymentMethodType.klarna: 'Klarna',
  PaymentMethodType.sofort: 'Sofort',
  PaymentMethodType.eps: 'EPS',
  PaymentMethodType.giroPay: 'GiroPay',
};
