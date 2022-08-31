// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:speakyfox/data/dtos/user_details_dto.dart';

part 'subscription_create.g.dart';

@JsonSerializable()
class SubscriptionCreateRequest {
 String planId;
 String offerId;
 String affiliateId;
  UserDetailsDto billingDetails;
  String externalId;
  String externalSubscriptionId;
  String paymentMethodId;
  String coupon;
  
  SubscriptionCreateRequest({
    required this.planId,
    required this.offerId,
    required this.affiliateId,
    required this.billingDetails,
    required this.externalId,
    required this.externalSubscriptionId,
    required this.paymentMethodId,
    required this.coupon,
  });

  factory SubscriptionCreateRequest.fromJson(Map<String, dynamic> json) => _$SubscriptionCreateRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SubscriptionCreateRequestToJson(this);
}
