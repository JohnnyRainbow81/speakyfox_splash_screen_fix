// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionResponse _$SubscriptionResponseFromJson(
        Map<String, dynamic> json) =>
    SubscriptionResponse(
      id: json['id'] as String,
      modified: json['modified'] as String?,
      modifiedBy: json['modifiedBy'] as String?,
      created: json['created'] as String?,
      createdBy: json['createdBy'] as String?,
      deleted: json['deleted'] as String?,
      deletedBy: json['deletedBy'] as String?,
      productDisplayTitle: json['productDisplayTitle'] as String,
      planDisplayTitle: json['planDisplayTitle'] as String,
      status: $enumDecode(_$SubscriptionStatusEnumMap, json['status']),
      currentPeriodStart: json['currentPeriodStart'] as String,
      currentPeriodEnd: json['currentPeriodEnd'] as String,
      couponKey: json['couponKey'] as String,
      languages: (json['languages'] as List<dynamic>)
          .map((e) => LanguageResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      interval: json['interval'] as String,
      intervalCount: json['intervalCount'] as int,
      paymentMethod: UserPaymentMethodResponse.fromJson(
          json['paymentMethod'] as Map<String, dynamic>),
      nextBillingAmount: json['nextBillingAmount'] as int,
      invoices: (json['invoices'] as List<dynamic>)
          .map((e) => InvoiceResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubscriptionResponseToJson(
        SubscriptionResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'modified': instance.modified,
      'modifiedBy': instance.modifiedBy,
      'created': instance.created,
      'createdBy': instance.createdBy,
      'deleted': instance.deleted,
      'deletedBy': instance.deletedBy,
      'productDisplayTitle': instance.productDisplayTitle,
      'planDisplayTitle': instance.planDisplayTitle,
      'status': _$SubscriptionStatusEnumMap[instance.status]!,
      'currentPeriodStart': instance.currentPeriodStart,
      'currentPeriodEnd': instance.currentPeriodEnd,
      'couponKey': instance.couponKey,
      'languages': instance.languages,
      'interval': instance.interval,
      'intervalCount': instance.intervalCount,
      'paymentMethod': instance.paymentMethod,
      'nextBillingAmount': instance.nextBillingAmount,
      'invoices': instance.invoices,
    };

const _$SubscriptionStatusEnumMap = {
  SubscriptionStatus.incomplete: 'incomplete',
  SubscriptionStatus.incompleteExpired: 'incompleteExpired',
  SubscriptionStatus.trialing: 'trialing',
  SubscriptionStatus.active: 'active',
  SubscriptionStatus.pastDue: 'pastDue',
  SubscriptionStatus.canceled: 'canceled',
  SubscriptionStatus.unpaid: 'unpaid',
  SubscriptionStatus.undefined: 'undefined',
};
