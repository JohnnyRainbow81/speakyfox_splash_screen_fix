// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/dtos/base_dto.dart';
import 'package:speakyfox/data/dtos/invoice_dto.dart';
import 'package:speakyfox/data/dtos/language_dto.dart';
import 'package:speakyfox/data/dtos/user_payment_method_dto.dart';

import '../../domain/models/subscription.dart';

part 'subscription_dto.g.dart';

@JsonSerializable()
class SubscriptionDto extends BaseDto {
  String productDisplayTitle;
  String planDisplayTitle;
  SubscriptionStatus status;
  String currentPeriodStart;
  String currentPeriodEnd;
  String? couponKey;
  List<LanguageDto> languages = [];
  String interval;
  int intervalCount;
  UserPaymentMethodDto? paymentMethod;
  int? nextBillingAmount;
  List<InvoiceDto> invoices;

  SubscriptionDto({
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
  }) : super(
            id: id,
            modified: modified,
            modifiedBy: modifiedBy,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy);

  factory SubscriptionDto.fromJson(Map<String, dynamic> json) => _$SubscriptionDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SubscriptionDtoToJson(this);
}
