// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/domain/models/base_model.dart';
import 'package:speakyfox/domain/models/payment_method.dart';

abstract class UserPaymentMethod extends BaseModel {
  PaymentMethodType type;

  String externalId;

  UserPaymentMethod(
      {required String id,
      required String modified,
      required String modifiedBy,
      required String created,
      required String createdBy,
      required String deleted,
      required String deletedBy,
      required this.type,
      required this.externalId})
      : super(
            id: id,
            modified: modified,
            modifiedBy: modifiedBy,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy);
}

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
    required PaymentMethodType type,
    required String externalId,
    required this.lastFourDigits,
    required this.brand,
    required this.expiryMonth,
    required this.expiryYear,
  }) : super(
            id: id,
            modified: modified,
            modifiedBy: modifiedBy,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            type: type,
            externalId: externalId);
}

class UserPayPal extends UserPaymentMethod {
  @override
  PaymentMethodType type = PaymentMethodType.payPal;

  String email;
  String name;

  UserPayPal({
    required String id,
    required String modified,
    required String modifiedBy,
    required String created,
    required String createdBy,
    required String deleted,
    required String deletedBy,
    required String externalId,
    required this.type,
    required this.email,
    required this.name,
  }) : super(
            id: id,
            modified: modified,
            modifiedBy: modifiedBy,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            type: type,
            externalId: externalId);
}

class UserSepaDirectDebit extends UserPaymentMethod {
  @override
  PaymentMethodType type = PaymentMethodType.sepaDirectDebit;

  String lastFourDigits;
  String bankName;
  UserSepaDirectDebit({
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
    required this.bankName,
  }) : super(
            id: id,
            modified: modified,
            modifiedBy: modifiedBy,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            type: type,
            externalId: externalId);
}
