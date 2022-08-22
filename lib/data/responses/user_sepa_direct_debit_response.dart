import 'package:json_annotation/json_annotation.dart';
import 'package:speakyfox/data/responses/user_payment_method_response.dart';

import '../../domain/models/payment_method.dart';

part 'user_sepa_direct_debit_response.g.dart';

// @JsonSerializable()
// class UserSepaDirectDebitResponse extends UserPaymentMethodResponse {
//   PaymentMethodType type;

//    String lastFourDigits;
//   String bankName;

//   UserSepaDirectDebitResponse({
//      required String id,
//       required String modified,
//       required String modifiedBy,
//       required String created,
//       required String createdBy,
//       required String deleted,
//       required String deletedBy,
//       required this.type,
//       required String externalId,
//     required this.lastFourDigits,
//     required this.bankName,
//   }): super(
//             externalId: externalId,
//             id: id,
//             created: created,
//             createdBy: createdBy,
//             deleted: deleted,
//             deletedBy: deletedBy,
//             modified: modified,
//             modifiedBy: modifiedBy,
//             type: type);
  
//   factory UserSepaDirectDebitResponse.fromJson(Map<String, dynamic> json) => _$UserSepaDirectDebitResponseFromJson(json);
//   Map<String, dynamic> toJson() => _$UserSepaDirectDebitResponseToJson(this);
// }