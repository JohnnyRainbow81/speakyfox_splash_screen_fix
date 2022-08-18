// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'coordinates_response.g.dart';

@JsonSerializable()
class CoordinatesResponse {
  int x;
  int y;
  int? height;
  int? width;
  int? degree;
  CoordinatesResponse({
    required this.x,
    required this.y,
    this.height,
    this.width,
    this.degree,
  });
  factory CoordinatesResponse.fromJson(Map<String, dynamic> json) => _$CoordinatesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CoordinatesResponseToJson(this);
}
