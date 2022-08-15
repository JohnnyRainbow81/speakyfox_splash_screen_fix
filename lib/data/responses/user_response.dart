// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/data/responses/base_response.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse extends BaseResponse {
  @JsonKey(name: "data")
  Data? data;

  UserResponse({
    int? group,
    int? statusCode,
    int? internalCode,
    this.data,
  }) : super(group: group, statusCode: statusCode, internalCode: internalCode );

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "formOfAddress")
  String? formOfAddress;
  @JsonKey(name: "firstname")
  String? firstname;
  @JsonKey(name: "lastname")
  String? lastname;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "currentLanguagePairId")
  String? currentLanguagePairId;
  @JsonKey(name: "currentSourceLanguageId")
  String? currentSourceLanguageId;
  @JsonKey(name: "currentTargetLanguageId")
  String? currentTargetLanguageId;
  @JsonKey(name: "roles")
  List<String>? roles;
  @JsonKey(name: "subscriptionIds")
  List<String>? subscriptionIds;

  Data({
    this.id,
    this.formOfAddress,
    this.firstname,
    this.lastname,
    this.email,
    this.currentLanguagePairId,
    this.currentSourceLanguageId,
    this.currentTargetLanguageId,
    this.roles,
    this.subscriptionIds,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
