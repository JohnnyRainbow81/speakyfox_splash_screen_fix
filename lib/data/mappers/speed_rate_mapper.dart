import 'package:speakyfox/data/dtos/speed_rate_dto.dart';
import 'package:speakyfox/domain/models/speed_rate.dart';

extension SpeedRateMapper on SpeedRateDto {
  SpeedRate toSpeedRate() {
    return SpeedRate(speed: speed, value: value);
  }
}
