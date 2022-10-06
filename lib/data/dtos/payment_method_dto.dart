// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:speakyfox/data/dtos/base_dto.dart';

import 'package:speakyfox/data/dtos/image_dto.dart';
import 'package:speakyfox/domain/models/payment_method.dart';

part 'payment_method_dto.g.dart';

@JsonSerializable()
class PaymentMethodDto extends BaseDto {
  String? name;
  String? description;
  String additionalInformation;
  String fileName;
  String fileId;
  ImageDto image;
  PaymentProvider paymentProvider;
  PaymentMethodType type;
  String externalId;
  PaymentMethodDto({
    required String id,
    String? modified,
    String? modifiedBy,
    String? created,
    String? createdBy,
    String? deleted,
    String? deletedBy,
    this.name,
    required this.description,
    required this.additionalInformation,
    required this.fileName,
    required this.fileId,
    required this.image,
    required this.paymentProvider,
    required this.type,
    required this.externalId,
  }) : super(
            id: id,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            modified: modified,
            modifiedBy: modifiedBy);

  factory PaymentMethodDto.fromJson(Map<String, dynamic> json) => _$PaymentMethodDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentMethodDtoToJson(this);
}
