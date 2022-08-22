// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/domain/models/payment_method.dart';
import 'package:speakyfox/domain/models/user_payment_method.dart';

class UserPaypal extends UserPaymentMethod {
  PaymentMethodType type = PaymentMethodType.payPal;
  String email;
  String name;

  UserPaypal({
    required String id,
      String? modified,
      String? modifiedBy,
      String? created,
      String? createdBy,
      String? deleted,
      String? deletedBy,
      required PaymentMethodType type,
      required String externalId,
    required this.email,
    required this.name,
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
