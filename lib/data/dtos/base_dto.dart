// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'base_dto.g.dart';

@JsonSerializable()
class BaseDto {
  String id;
  String? modified = "";
  String? modifiedBy = "";
  String? created = "";
  String? createdBy = "";
  String? deleted = "";
  String? deletedBy = "";
  BaseDto({
    required this.id,
    this.modified,
    this.modifiedBy,
    this.created,
    this.createdBy,
    this.deleted,
    this.deletedBy,
  });

  factory BaseDto.fromJson(Map<String, dynamic> json) => _$BaseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$BaseDtoToJson(this);
}
