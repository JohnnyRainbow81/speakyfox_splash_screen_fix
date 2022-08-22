// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/responses/base_response.dart';
import 'package:speakyfox/data/responses/invoice_response.dart';
import 'package:speakyfox/data/responses/language_response.dart';
import 'package:speakyfox/data/responses/user_payment_method_response.dart';

import '../../domain/models/subscription.dart';

part 'subscription_response.g.dart';

@JsonSerializable()
class SubscriptionResponse extends BaseResponse {
   String productDisplayTitle;
  String planDisplayTitle;
  SubscriptionStatus status;
  String currentPeriodStart;
  String currentPeriodEnd;
  String couponKey;
  List<LanguageResponse> languages = [];
  String interval;
  int intervalCount;
  UserPaymentMethodResponse paymentMethod;
  int nextBillingAmount;
  List<InvoiceResponse> invoices;

  SubscriptionResponse({
    required String id,
    String? modified,
    String? modifiedBy,
    String? created,
    String? createdBy,
    String? deleted,
    String? deletedBy,
    required this.productDisplayTitle,
    required this.planDisplayTitle,
    required this.status,
    required this.currentPeriodStart,
    required this.currentPeriodEnd,
    required this.couponKey,
    required this.languages,
    required this.interval,
    required this.intervalCount,
    required this.paymentMethod,
    required this.nextBillingAmount,
    required this.invoices,
  }): super(
            id: id,
            modified: modified,
            modifiedBy: modifiedBy,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy);


  factory SubscriptionResponse.fromJson(Map<String, dynamic> json) => _$SubscriptionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SubscriptionResponseToJson(this);
}
