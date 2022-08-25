// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_body.g.dart';

@JsonSerializable()
class RefreshTokenBody {
  @JsonKey(name:"grant_type")
  String grantType;
  @JsonKey(name: "refresh_token")
  String refreshToken;

  RefreshTokenBody({
    required this.grantType,
    required this.refreshToken,
  });

  factory RefreshTokenBody.fromJson(Map<String, dynamic> json) => _$RefreshTokenBodyFromJson(json);
  Map<String, dynamic> toJson() => _$RefreshTokenBodyToJson(this);
}
