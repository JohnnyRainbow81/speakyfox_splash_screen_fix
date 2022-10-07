// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/dtos/coupon_dto.dart';
import 'package:speakyfox/data/dtos/user_details_dto.dart';

part 'subscription_create.g.dart';

@JsonSerializable()
class SubscriptionCreateRequest {
  String planId;
  String offerId;
  String affiliateId;
  String externalId;
  String externalSubscriptionId;
  String paymentMethodId;
  String coupon;
  BillingDetailsRequest billingDetails;

  SubscriptionCreateRequest({
    required this.planId,
    required this.paymentMethodId,
    required this.coupon,
    required this.affiliateId,
    required this.externalId,
    required this.externalSubscriptionId,
    required this.offerId,
    required this.billingDetails,
  });
  factory SubscriptionCreateRequest.fromJson(Map<String, dynamic> json) => _$SubscriptionCreateRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SubscriptionCreateRequestToJson(this);
}

@JsonSerializable()
class BillingDetailsRequest {
  String name;
  String email;
  String phone;
  AddressRequest address;
  BillingDetailsRequest({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });

  factory BillingDetailsRequest.fromJson(Map<String, dynamic> json) => _$BillingDetailsRequestFromJson(json);
  Map<String, dynamic> toJson() => _$BillingDetailsRequestToJson(this);
}

@JsonSerializable()
class AddressRequest {
  String displayName;
  String value;
  AddressRequest({
    required this.displayName,
    required this.value,
  });
  factory AddressRequest.fromJson(Map<String, dynamic> json) => _$AddressRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AddressRequestToJson(this);
}
