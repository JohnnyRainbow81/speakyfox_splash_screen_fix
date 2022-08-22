// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:speakyfox/data/dtos/base_dto.dart';

part 'coupon_dto.g.dart';

@JsonSerializable()
class CouponDto extends BaseDto {
  String key;
  String? name;
  int? amountOff;
  int? percentOff;
  String planId;
  String duration;
  int? durationInMonths;

  CouponDto({
    required String id,
    String? modified,
    String? modifiedBy,
    String? created,
    String? createdBy,
    String? deleted,
    String? deletedBy,
    required this.key,
    required this.name,
    required this.amountOff,
    required this.percentOff,
    required this.planId,
    required this.duration,
    required this.durationInMonths,
  }) : super(
            id: id,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy,
            modified: modified,
            modifiedBy: modifiedBy);

  factory CouponDto.fromJson(Map<String, dynamic> json) => _$CouponDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CouponDtoToJson(this);
}
