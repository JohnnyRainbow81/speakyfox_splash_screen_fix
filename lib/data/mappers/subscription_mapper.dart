import 'package:speakyfox/data/mappers/invoice_mapper.dart';
import 'package:speakyfox/data/mappers/language_mapper.dart';
import 'package:speakyfox/data/responses/subscription_response.dart';
import 'package:speakyfox/domain/models/subscription.dart';

extension SubscriptionMapper on SubscriptionResponse {
  Subscription toSubscription() {
    return Subscription(
        id: id,
        modified: modified ?? "",
        modifiedBy: modifiedBy ?? "",
        created: created ?? "",
        createdBy: createdBy ?? "",
        deleted: deleted ?? "",
        deletedBy: deletedBy ?? "",
        productDisplayTitle: productDisplayTitle,
        planDisplayTitle: planDisplayTitle,
        status: status,
        currentPeriodStart: currentPeriodStart,
        currentPeriodEnd: currentPeriodEnd,
        couponKey: couponKey,
        languages: languages.map((language) => language.toLanguage()).toList(),
        interval: interval,
        intervalCount: intervalCount,
        paymentMethod:  paymentMethod.toUserPaymentMethod(),
        nextBillingAmount: nextBillingAmount,
        invoices: invoices.map((invoice) => invoice.toInvoice()).toList());
  }
}
