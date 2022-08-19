import 'package:speakyfox/data/responses/speed_rate_response.dart';
import 'package:speakyfox/domain/models/speed_rate.dart';

extension SpeedRateMapper on SpeedRateResponse {
  SpeedRate toSpeedRate() {
    return SpeedRate(speed: speed, value: value);
  }
}
