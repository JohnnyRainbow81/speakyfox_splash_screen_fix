import 'package:speakyfox/app/error_handling/exceptions_ui.dart';
import 'package:speakyfox/data/dtos/user_payment_method_dto.dart';
import 'package:speakyfox/domain/models/user_credit_card.dart';
import 'package:speakyfox/domain/models/user_payment_method.dart';
import 'package:speakyfox/domain/models/user_paypal.dart';
import 'package:speakyfox/domain/models/user_sepa_direct_debit.dart';

import '../../domain/models/payment_method.dart';

extension UserPaymentMethodMapper on UserPaymentMethodDto {
  UserPaymentMethod? toUserPaymentMethod() {
    switch (type) {
      case PaymentMethodType.sepaDirectDebit:
        return UserSepaDirectDebit(
            id: id,
            modified: modified ?? "",
            modifiedBy: modifiedBy ?? "",
            created: created ?? " ",
            createdBy: createdBy ?? "",
            deleted: deleted ?? "",
            deletedBy: deletedBy ?? "",
            type: type,
            externalId: externalId ?? "",
            lastFourDigits: lastFourDigits ?? "",
            bankName: bankName ?? "");
      case PaymentMethodType.creditCard:
        return UserCreditCard(
            id: id,
            modified: modified ?? "",
            modifiedBy: modifiedBy ?? "",
            created: created ?? "",
            createdBy: createdBy ?? "",
            deleted: deleted ?? "",
            deletedBy: deletedBy ?? "",
            externalId: externalId ?? "",
            type: type,
            lastFourDigits: lastFourDigits ?? "",
            brand: brand ?? "",
            expiryMonth: expiryMonth ?? 0,
            expiryYear: expiryYear ?? 0);
      case PaymentMethodType.payPal:
        return UserPaypal(
            id: id,
            modified: modified ?? "",
            modifiedBy: modifiedBy ?? "",
            created: created ?? "",
            createdBy: createdBy ?? "",
            deleted: deleted ?? "",
            deletedBy: deletedBy ?? "",
            type: type,
            externalId: externalId ?? "",
            email: email ?? "",
            name: name ?? "");
      case PaymentMethodType.appleId:
        break;
      case PaymentMethodType.internal:
        // TODO: Handle this case.
        break;
      default:
        return null;
      // throw PaymentException(
      //     message: "Payment method error", description: "We couldn't deserialize your payment method");
    }
    return null;
    //throw PaymentException(message: "Payment method error", description: "We couldn't deserialize your payment method");
  }
}
