// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'user_address_dto.g.dart';


@JsonSerializable()
class UserAddressDto {

  String city;
  Map<String, String> country;
  String line1;
  String line2;
  String postal_code;
  String state;
  UserAddressDto({
    required this.city,
    required this.country,
    required this.line1,
    required this.line2,
    required this.postal_code,
    required this.state,
  });

  factory UserAddressDto.fromJson(Map<String, dynamic> json) => _$UserAddressDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserAddressDtoToJson(this);
}

