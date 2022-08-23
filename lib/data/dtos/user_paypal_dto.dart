// import 'package:json_annotation/json_annotation.dart';
// import 'package:speakyfox/data/dtos/user_credit_card_dto.dart';
// import 'package:speakyfox/data/dtos/user_payment_method_dto.dart';
// import 'package:speakyfox/domain/models/payment_method.dart';

//part 'user_paypal_dto.g.dart';

// @JsonSerializable()
// class UserPaypalDto extends UserPaymentMethodDto {
//   PaymentMethodType type;
//    String email;
//   String name;

//   UserPaypalDto({
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
//   factory UserPaypalDto.fromJson(Map<String, dynamic> json) => _$UserPaypalDtoFromJson(json);
//   Map<String, dynamic> toJson() => _$UserPaypalDtoToJson(this);
// }
