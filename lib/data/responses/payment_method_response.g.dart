// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentMethodResponse _$PaymentMethodResponseFromJson(
        Map<String, dynamic> json) =>
    PaymentMethodResponse(
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
      image: ImageResponse.fromJson(json['image'] as Map<String, dynamic>),
      paymentProvider:
          $enumDecode(_$PaymentProviderEnumMap, json['paymentProvider']),
      type: $enumDecode(_$PaymentMethodTypeEnumMap, json['type']),
      externalId: json['externalId'] as String,
    );

Map<String, dynamic> _$PaymentMethodResponseToJson(
        PaymentMethodResponse instance) =>
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
  PaymentMethodType.sepaDirectDebit: 'sepaDirectDebit',
  PaymentMethodType.creditCard: 'creditCard',
  PaymentMethodType.payPal: 'paypal',
  PaymentMethodType.appleId: 'appleId',
  PaymentMethodType.internal: 'internal',
};
