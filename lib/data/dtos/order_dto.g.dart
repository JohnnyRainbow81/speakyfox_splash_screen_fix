// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDto _$OrderDtoFromJson(Map<String, dynamic> json) => OrderDto(
      id: json['id'] as String,
      modified: json['modified'] as String,
      modifiedBy: json['modifiedBy'] as String,
      created: json['created'] as String,
      createdBy: json['createdBy'] as String,
      deleted: json['deleted'] as String,
      deletedBy: json['deletedBy'] as String,
      copy: json['copy'] as String,
      subscriptionId: json['subscriptionId'] as String,
      effectiveFromUtc: json['effectiveFromUtc'] as String,
      effectiveToUtc: json['effectiveToUtc'] as String,
      paymentMethod: json['paymentMethod'] as String,
      voucherCode: json['voucherCode'] as String,
      priceWithoutVAT: (json['priceWithoutVAT'] as num).toDouble(),
      finalPriceWithVAT: (json['finalPriceWithVAT'] as num).toDouble(),
      vat: (json['vat'] as num).toDouble(),
      userId: json['userId'] as String,
      externalIdentifier: json['externalIdentifier'] as String,
    );

Map<String, dynamic> _$OrderDtoToJson(OrderDto instance) => <String, dynamic>{
      'id': instance.id,
      'modified': instance.modified,
      'modifiedBy': instance.modifiedBy,
      'created': instance.created,
      'createdBy': instance.createdBy,
      'deleted': instance.deleted,
      'deletedBy': instance.deletedBy,
      'copy': instance.copy,
      'subscriptionId': instance.subscriptionId,
      'effectiveFromUtc': instance.effectiveFromUtc,
      'effectiveToUtc': instance.effectiveToUtc,
      'paymentMethod': instance.paymentMethod,
      'voucherCode': instance.voucherCode,
      'priceWithoutVAT': instance.priceWithoutVAT,
      'finalPriceWithVAT': instance.finalPriceWithVAT,
      'vat': instance.vat,
      'userId': instance.userId,
      'externalIdentifier': instance.externalIdentifier,
    };
