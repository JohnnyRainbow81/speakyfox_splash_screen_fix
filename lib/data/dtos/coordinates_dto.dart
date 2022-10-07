// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'coordinates_dto.g.dart';

@JsonSerializable()
class CoordinatesDto {
  double x;
  double y;
  double? height;
  double? width;
  double? degree;
  CoordinatesDto({
    required this.x,
    required this.y,
    this.height,
    this.width,
    this.degree,
  });
  factory CoordinatesDto.fromJson(Map<String, dynamic> json) => _$CoordinatesDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CoordinatesDtoToJson(this);
}
