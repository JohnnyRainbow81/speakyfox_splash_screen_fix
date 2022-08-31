// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionCreateRequest _$SubscriptionCreateRequestFromJson(
        Map<String, dynamic> json) =>
    SubscriptionCreateRequest(
      planId: json['planId'] as String,
      offerId: json['offerId'] as String,
      affiliateId: json['affiliateId'] as String,
      billingDetails: UserDetailsDto.fromJson(
          json['billingDetails'] as Map<String, dynamic>),
      externalId: json['externalId'] as String,
      externalSubscriptionId: json['externalSubscriptionId'] as String,
      paymentMethodId: json['paymentMethodId'] as String,
      coupon: json['coupon'] as String,
    );

Map<String, dynamic> _$SubscriptionCreateRequestToJson(
        SubscriptionCreateRequest instance) =>
    <String, dynamic>{
      'planId': instance.planId,
      'offerId': instance.offerId,
      'affiliateId': instance.affiliateId,
      'billingDetails': instance.billingDetails,
      'externalId': instance.externalId,
      'externalSubscriptionId': instance.externalSubscriptionId,
      'paymentMethodId': instance.paymentMethodId,
      'coupon': instance.coupon,
    };
