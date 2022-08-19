// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:speakyfox/data/responses/base_response.dart';

part 'coupon_response.g.dart';

@JsonSerializable()
class CouponResponse extends BaseResponse {
  String key;
  String? name;
  int? amountOff;
  int? percentOff;
  String planId;
  String duration;
  int? durationInMonths;

  CouponResponse({
    required String id,
    required String modified,
    required String modifiedBy,
    required String created,
    required String createdBy,
    required String deleted,
    required String deletedBy,
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

  factory CouponResponse.fromJson(Map<String, dynamic> json) => _$CouponResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CouponResponseToJson(this);
}
