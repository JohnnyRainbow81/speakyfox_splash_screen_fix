import 'package:speakyfox/domain/models/base_model.dart';

class Order extends BaseModel {
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
}