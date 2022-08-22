import 'package:json_annotation/json_annotation.dart';

import '../../domain/models/speed_rate.dart';

part 'speed_rate_dto.g.dart';

@JsonSerializable()
class SpeedRateDto {
  Rate speed;
  double value;

  SpeedRateDto({
    required this.speed,
    required this.value,
  });

  factory SpeedRateDto.fromJson(Map<String, dynamic> json) => _$SpeedRateDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SpeedRateDtoToJson(this);
}
