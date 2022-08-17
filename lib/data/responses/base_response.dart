// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {
  String? id;
  String? modified;
  String? modifiedBy;
  String? created;
  String? createdBy;
  String? deleted;
  String? deletedBy;
  BaseResponse({
    this.id,
    this.modified,
    this.modifiedBy,
    this.created,
    this.createdBy,
    this.deleted,
    this.deletedBy,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}
