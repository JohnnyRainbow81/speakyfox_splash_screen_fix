// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:speakyfox/data/responses/base_response.dart';

import 'package:speakyfox/data/responses/image_response.dart';
import 'package:speakyfox/domain/models/payment_method.dart';

part 'payment_method_response.g.dart';

@JsonSerializable()
class PaymentMethodResponse extends BaseResponse{
String name;
  String description;
  String additionalInformation;
  String fileName;
  String fileId;
  ImageResponse image;
  PaymentProvider paymentProvider;
  PaymentMethodType type;
  String externalId;
  PaymentMethodResponse({
    required String id,
    required String modified,
    required String modifiedBy,
    required String created,
    required String createdBy,
    required String deleted,
    required String deletedBy,
    required this.name,
    required this.description,
    required this.additionalInformation,
    required this.fileName,
    required this.fileId,
    required this.image,
    required this.paymentProvider,
    required this.type,
    required this.externalId,
  }):super(id: id, created: created, createdBy: createdBy,deleted: deleted,deletedBy: deletedBy,modified: modified,modifiedBy: modifiedBy);

  factory PaymentMethodResponse.fromJson(Map<String, dynamic> json) => _$PaymentMethodResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentMethodResponseToJson(this);
}
