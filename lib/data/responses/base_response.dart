import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "group")
  int? group;
  @JsonKey(name: "internalCode")
  int? internalCode;
  @JsonKey(name: "statusCode")
  int? statusCode;
  
  BaseResponse({
    required this.group,
    required this.internalCode,
    required this.statusCode,
  });
}
