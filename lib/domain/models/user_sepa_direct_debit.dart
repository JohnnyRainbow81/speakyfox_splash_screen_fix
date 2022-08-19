// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/domain/models/payment_method.dart';
import 'package:speakyfox/domain/models/user_payment_method.dart';

class UserSepaDirectDebit extends UserPaymentMethod {
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
      required PaymentMethodType type,
      required String externalId,
    required this.lastFourDigits,
    required this.bankName,
  }): super(
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
