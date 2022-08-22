// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'code.g.dart';

@JsonSerializable()
class Code {
  @JsonKey(name: "group")
  int? group;
  @JsonKey(name: "internalCode")
  int? internalCode;
  @JsonKey(name: "statusCode")
  int? statusCode;
  
  Code({
    this.group,
    this.internalCode,
    this.statusCode,
  });
  
    factory Code.fromJson(Map<String, dynamic> json) => _$CodeFromJson(json);
  Map<String, dynamic> toJson() => _$CodeToJson(this);
}
