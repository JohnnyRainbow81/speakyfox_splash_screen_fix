import 'package:json_annotation/json_annotation.dart';

part 'agb_dto.g.dart';

@JsonSerializable()
class AGBDto {
  String agbs;

  AGBDto({required this.agbs});

  factory AGBDto.fromJson(Map<String, dynamic> json) => _$AGBDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AGBDtoToJson(this);
}
