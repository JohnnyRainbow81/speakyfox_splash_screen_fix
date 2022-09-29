import 'package:json_annotation/json_annotation.dart';

part 'data_protection_dto.g.dart';

@JsonSerializable()
class DataProtectionDto {
  String dataProtection;

  DataProtectionDto({required this.dataProtection});

  factory DataProtectionDto.fromJson(Map<String, dynamic> json) => _$DataProtectionDtoFromJson(json);
  Map<String, dynamic> toJson() => _$DataProtectionDtoToJson(this);
}
