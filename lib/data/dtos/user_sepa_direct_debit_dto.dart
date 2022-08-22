// import 'package:json_annotation/json_annotation.dart';
// import 'package:speakyfox/data/dtos/user_payment_method_dto.dart';

// import '../../domain/models/payment_method.dart';

// part 'user_sepa_direct_debit_dto.g.dart';

// @JsonSerializable()
// class UserSepaDirectDebitDto extends UserPaymentMethodDto {
//   PaymentMethodType type;

//    String lastFourDigits;
//   String bankName;

//   UserSepaDirectDebitDto({
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
  
//   factory UserSepaDirectDebitDto.fromJson(Map<String, dynamic> json) => _$UserSepaDirectDebitDtoFromJson(json);
//   Map<String, dynamic> toJson() => _$UserSepaDirectDebitDtoToJson(this);
// }