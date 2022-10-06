// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/domain/models/model_base.dart';

class Order extends ModelBase {
  String copy;
  String subscriptionId;
  String effectiveFromUtc;
  String effectiveToUtc;
  String paymentMethod;
  String voucherCode;
  double priceWithoutVAT;
  double finalPriceWithVAT;
  double vat;
  String userId;
  String externalIdentifier;

  Order({
    required String id,
    required String modified,
    required String modifiedBy,
    required String created,
    required String createdBy,
    required String deleted,
    required String deletedBy,
    required this.copy,
    required this.subscriptionId,
    required this.effectiveFromUtc,
    required this.effectiveToUtc,
    required this.paymentMethod,
    required this.voucherCode,
    required this.priceWithoutVAT,
    required this.finalPriceWithVAT,
    required this.vat,
    required this.userId,
    required this.externalIdentifier,
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
    return 'Order(copy: $copy, subscriptionId: $subscriptionId, effectiveFromUtc: $effectiveFromUtc, effectiveToUtc: $effectiveToUtc, paymentMethod: $paymentMethod, voucherCode: $voucherCode, priceWithoutVAT: $priceWithoutVAT, finalPriceWithVAT: $finalPriceWithVAT, vat: $vat, userId: $userId, externalIdentifier: $externalIdentifier)';
  }
}
