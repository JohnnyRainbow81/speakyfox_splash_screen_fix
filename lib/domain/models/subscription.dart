// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/domain/models/model_base.dart';
import 'package:speakyfox/domain/models/user_payment_method.dart';

import 'invoice.dart' show Invoice;
import 'language.dart' show Language;

class Subscription extends ModelBase {
  String productDisplayTitle;
  String planDisplayTitle;
  SubscriptionStatus status;
  String currentPeriodStart;
  String currentPeriodEnd;
  String couponKey;
  List<Language> languages = [];
  String interval;
  int intervalCount;
  UserPaymentMethod? paymentMethod;
  int? nextBillingAmount;
  List<Invoice> invoices = [];

  Subscription({
    required String id,
    required String modified,
    required String modifiedBy,
    required String created,
    required String createdBy,
    required String deleted,
    required String deletedBy,
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
  }) : super(
            id: id,
            modified: modified,
            modifiedBy: modifiedBy,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy);


  @override
  String toString() {
    return 'Subscription(productDisplayTitle: $productDisplayTitle, planDisplayTitle: $planDisplayTitle, currentPeriodStart: $currentPeriodStart, currentPeriodEnd: $currentPeriodEnd, couponKey: $couponKey, languages: $languages, interval: $interval, intervalCount: $intervalCount, paymentMethod: $paymentMethod, nextBillingAmount: $nextBillingAmount, invoices: $invoices)';
  }
}

enum SubscriptionType { oneTime, month, threeMonths, sixMonths, year }

enum SubscriptionStatus {
  @JsonValue("Incomplete")
  incomplete,
  @JsonValue("IncompleteExpired")
  incompleteExpired,
  @JsonValue("Trialing")
  trialing,
  @JsonValue("Active")
  active,
  @JsonValue("PastDue")
  pastDue,
  @JsonValue("Canceled")
  canceled,
  @JsonValue("Unpaid")
  unpaid,
  @JsonValue("Undefined")
  undefined,
  @JsonValue("Processing")
  processing
}
