// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/dtos/base_dto.dart';
import 'package:speakyfox/domain/models/payment_method.dart';

part 'user_payment_method_dto.g.dart';

//This response handles all cases (Credit Card, Paypal, SEPA)
@JsonSerializable()
class UserPaymentMethodDto extends BaseDto {
  String? lastFourDigits;
  String? brand;
  int? expiryMonth;
  int? expiryYear;
  String? externalId;
  String? bankName;
  String? email;
  String? name;
  PaymentMethodType type;

  UserPaymentMethodDto({
    required String id,
    required String modified,
    required String modifiedBy,
    required String created,
    required String createdBy,
    required String deleted,
    required String deletedBy,
    this.lastFourDigits,
    this.brand,
    this.expiryMonth,
    this.externalId,
    this.expiryYear,
    this.bankName,
    this.email,
    this.name,
    required this.type,
  }) : super(
          id: id,
          modified: modified,
          modifiedBy: modifiedBy,
          created: created,
          createdBy: createdBy,
          deleted: deleted,
          deletedBy: deletedBy,
        );
  factory UserPaymentMethodDto.fromJson(Map<String, dynamic> json) => _$UserPaymentMethodDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserPaymentMethodDtoToJson(this);
}
