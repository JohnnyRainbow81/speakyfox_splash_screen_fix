import 'package:speakyfox/data/responses/user_payment_method_response.dart';
import 'package:speakyfox/domain/models/user_payment_method.dart';
import 'package:speakyfox/domain/models/user_sepa_direct_debit.dart';

import '../../domain/models/payment_method.dart';

extension UserPaymentMethodMapper on UserPaymentMethodResponse {
  UserPaymentMethod toUserPaymentMethod{
    switch(type) {
      Weitermachen!
      case PaymentMethodType.sepaDirectDebit:
       return UserSepaDirectDebit(id: id, modified: modified, modifiedBy: modifiedBy, created: created, createdBy: createdBy, deleted: deleted, deletedBy: deletedBy, type: type, externalId: externalId, lastFourDigits: lastFourDigits, bankName: bankName);
      case PaymentMethodType.creditCard:
        // TODO: Handle this case.
        break;
      case PaymentMethodType.payPal:
        // TODO: Handle this case.
        break;
      case PaymentMethodType.appleId:
        // TODO: Handle this case.
        break;
      case PaymentMethodType.internal:
        // TODO: Handle this case.
        break;
    }
  }
}