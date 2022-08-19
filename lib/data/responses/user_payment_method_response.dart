// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/responses/base_response.dart';
import 'package:speakyfox/domain/models/payment_method.dart';

part 'user_payment_method_response.g.dart';

@JsonSerializable()
class UserPaymentMethodResponse extends BaseResponse {
  PaymentMethodType type;
  String externalId;

  UserPaymentMethodResponse({
    required String id,
    required String modified,
    required String modifiedBy,
    required String created,
    required String createdBy,
    required String deleted,
    required String deletedBy,
    required this.type,
    required this.externalId,
  }) : super(
          id: id,
          modified: modified,
          modifiedBy: modifiedBy,
          created: created,
          createdBy: createdBy,
          deleted: deleted,
          deletedBy: deletedBy,
        );
  factory UserPaymentMethodResponse.fromJson(Map<String, dynamic> json) => _$UserPaymentMethodResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserPaymentMethodResponseToJson(this);
}
