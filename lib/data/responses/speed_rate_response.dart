import 'package:json_annotation/json_annotation.dart';

import '../../domain/models/speed_rate.dart';

part 'speed_rate_response.g.dart';

@JsonSerializable()
class SpeedRateResponse {
  Rate speed;
  double value;

  SpeedRateResponse({
    required this.speed,
    required this.value,
  });

  factory SpeedRateResponse.fromJson(Map<String, dynamic> json) => _$SpeedRateResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SpeedRateResponseToJson(this);
}