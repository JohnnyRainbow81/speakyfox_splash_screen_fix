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
  UserPaymentMethod paymentMethod;
  int nextBillingAmount;
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
}

enum SubscriptionType { oneTime, month, threeMonths, sixMonths, year }

enum SubscriptionStatus {
  @JsonValue("incomplete")
  incomplete,
  @JsonValue("incompleteExpired")
  incompleteExpired,
  @JsonValue("trialing")
  trialing,
  @JsonValue("active")
  active,
  @JsonValue("pastDue")
  pastDue,
  @JsonValue("canceled")
  canceled,
  @JsonValue("unpaid")
  unpaid,
  @JsonValue("undefined")
  undefined
}
