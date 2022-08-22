import 'package:json_annotation/json_annotation.dart';
import 'package:speakyfox/data/responses/user_credit_card_response.dart';
import 'package:speakyfox/data/responses/user_payment_method_response.dart';
import 'package:speakyfox/domain/models/payment_method.dart';

part 'user_paypal_response.g.dart';

// @JsonSerializable()
// class UserPaypalResponse extends UserPaymentMethodResponse {
//   PaymentMethodType type;
//    String email;
//   String name;

//   UserPaypalResponse({
//     required String id,
//     required String modified,
//     required String modifiedBy,
//     required String created,
//     required String createdBy,
//     required String deleted,
//     required String deletedBy,
//     required this.type,
//     required String externalId,
//     required this.email,
//     required this.name,
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
//   factory UserPaypalResponse.fromJson(Map<String, dynamic> json) => _$UserPaypalResponseFromJson(json);
//   Map<String, dynamic> toJson() => _$UserPaypalResponseToJson(this);
// }
