// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/data/dtos/user_address_dto.dart';

import 'package:json_annotation/json_annotation.dart';

part 'user_details_dto.g.dart';


@JsonSerializable()
class UserDetailsDto {
  String name;
  String email;
  String phone;
  UserAddressDto address;

  UserDetailsDto({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });

  factory UserDetailsDto.fromJson(Map<String, dynamic> json) => _$UserDetailsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserDetailsDtoToJson(this);
}

