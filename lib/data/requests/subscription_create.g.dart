// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionCreateRequest _$SubscriptionCreateRequestFromJson(
        Map<String, dynamic> json) =>
    SubscriptionCreateRequest(
      planId: json['planId'] as String,
      paymentMethodId: json['paymentMethodId'] as String,
      coupon: json['coupon'] as String,
      affiliateId: json['affiliateId'] as String,
      externalId: json['externalId'] as String,
      externalSubscriptionId: json['externalSubscriptionId'] as String,
      offerId: json['offerId'] as String,
      billingDetails: BillingDetailsRequest.fromJson(
          json['billingDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubscriptionCreateRequestToJson(
        SubscriptionCreateRequest instance) =>
    <String, dynamic>{
      'planId': instance.planId,
      'offerId': instance.offerId,
      'affiliateId': instance.affiliateId,
      'externalId': instance.externalId,
      'externalSubscriptionId': instance.externalSubscriptionId,
      'paymentMethodId': instance.paymentMethodId,
      'coupon': instance.coupon,
      'billingDetails': instance.billingDetails,
    };

BillingDetailsRequest _$BillingDetailsRequestFromJson(
        Map<String, dynamic> json) =>
    BillingDetailsRequest(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      address: AddressRequest.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BillingDetailsRequestToJson(
        BillingDetailsRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
    };

AddressRequest _$AddressRequestFromJson(Map<String, dynamic> json) =>
    AddressRequest(
      displayName: json['displayName'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$AddressRequestToJson(AddressRequest instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'value': instance.value,
    };
