import 'package:json_annotation/json_annotation.dart';
import 'package:speakyfox/data/responses/user_payment_method_response.dart';

import '../../domain/models/payment_method.dart';

part 'user_credit_card_response.g.dart';

// @JsonSerializable()
// class UserCreditCardResponse extends UserPaymentMethodResponse{
// PaymentMethodType type;

//   String lastFourDigits;
//   String brand;
//   int expiryMonth;
//   int expiryYear;

//   UserCreditCardResponse({
//     required String id,
//     required String modified,
//     required String modifiedBy,
//     required String created,
//     required String createdBy,
//     required String deleted,
//     required String deletedBy,
//     required String externalId,
//     required this.type,
//     required this.lastFourDigits,
//     required this.brand,
//     required this.expiryMonth,
//     required this.expiryYear,
//   }) : super(
//             externalId: externalId,
//             id: id,
//             created: created,
//             createdBy: createdBy,
//             deleted: deleted,
//             deletedBy: deletedBy,
//             modified: modified,
//             modifiedBy: modifiedBy,
//             type: type);

//   factory UserCreditCardResponse.fromJson(Map<String, dynamic> json) => _$UserCreditCardResponseFromJson(json);
//   Map<String, dynamic> toJson() => _$UserCreditCardResponseToJson(this);
// }