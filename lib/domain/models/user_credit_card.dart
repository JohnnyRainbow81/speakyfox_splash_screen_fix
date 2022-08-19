// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/domain/models/payment_method.dart';
import 'package:speakyfox/domain/models/user_payment_method.dart';

class UserCreditCard extends UserPaymentMethod {
  @override
  PaymentMethodType type = PaymentMethodType.creditCard;

  String lastFourDigits;
  String brand;
  int expiryMonth;
  int expiryYear;

  UserCreditCard({
    required String id,
    required String modified,
    required String modifiedBy,
    required String created,
    required String createdBy,
    required String deleted,
    required String deletedBy,
    required String externalId,
    required this.type,
    required this.lastFourDigits,
    required this.brand,
    required this.expiryMonth,
    required this.expiryYear,
  }) : super(
            externalId: externalId,
            id: id,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            modified: modified,
            modifiedBy: modifiedBy,
            type: type);
}
